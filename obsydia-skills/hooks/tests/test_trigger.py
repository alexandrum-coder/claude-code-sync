import importlib.util
import json
import os
import subprocess
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
SCRIPT = os.path.normpath(os.path.join(HERE, "..", "task_verifier_trigger.py"))

INSTRUCTIUNE = (
    "Înainte de prima scriere, cheamă agentul `obsydia-skills:task-verifier` "
    "în modul `preflight`, cu calea planului; la fiecare ✅ cheamă-l în modul "
    "`checkpoint`."
)


def _load():
    spec = importlib.util.spec_from_file_location("task_verifier_trigger", SCRIPT)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def run_hook(stdin_bytes):
    env = dict(os.environ, PYTHONDONTWRITEBYTECODE="1")
    return subprocess.run(
        [sys.executable, SCRIPT],
        input=stdin_bytes,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        env=env,
        timeout=10,
    )


def run_json(obj):
    return run_hook(json.dumps(obj).encode("utf-8"))


class TestDetect(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.detect = staticmethod(_load().detect)

    def test_executie_declanseaza(self):
        for p in [
            "execută Faza 4 din PLAN.md",
            "pornește pilotul",
            "implement task 3",
            "executăm faza 2",
            "/superpowers:executing-plans docs/plan.md",
            "/superpowers:subagent-driven-development docs/plan.md",
            "continuă cu faza 4",
            "continuam task 2",
            "run phase 2",
            "implementing task 3",
            "implementăm faza 1",
            "proceed with the plan",
            "go ahead with phase 4",
            "kick off phase 2",
            "/superpowers:executing-plans explică planul",
        ]:
            with self.subTest(p=p):
                self.assertTrue(self.detect(p))

    def test_discutie_nu_declanseaza(self):
        for p in [
            "explică-mi faza 3",
            "ce e în plan?",
            "de ce ai executat faza 3?",
            "",
            "restart plan",
            "nu executa nimic din plan",
            "nu porni faza 4",
            "don't run the plan",
            "do not execute phase 2",
            "Începe să-mi explici planul",
            "vreau să încep să discut planul",
            "start the server, then explain the plan",
            "fă un plan",
            "ok, continuă",
        ]:
            with self.subTest(p=p):
                self.assertFalse(self.detect(p))

    def test_fara_diacritice(self):
        self.assertTrue(self.detect("executa faza 4"))

    def test_tipuri_invalide(self):
        for p in [None, 5, ["execută faza 4"], {"a": 1}]:
            with self.subTest(p=p):
                self.assertFalse(self.detect(p))


class TestMain(unittest.TestCase):
    def test_json_invalid(self):
        r = run_hook(b"{")
        self.assertEqual(r.returncode, 0)
        self.assertEqual(r.stdout, b"")

    def test_stdin_gol(self):
        r = run_hook(b"")
        self.assertEqual(r.returncode, 0)
        self.assertEqual(r.stdout, b"")

    def test_octeti_invalizi(self):
        r = run_hook(b'{"prompt": "executa faza 4 \xff\xfe"}')
        self.assertEqual(r.returncode, 0)
        r = run_hook(b"\xff\xfe\x00\x80")
        self.assertEqual(r.returncode, 0)
        self.assertEqual(r.stdout, b"")

    def test_json_alta_forma(self):
        for obj in [[], ["x"], "executa faza 4", 5, None,
                    {"prompt": 5}, {"prompt": ["executa faza 4"]},
                    {"hook_event_name": "UserPromptSubmit", "prompt": None}]:
            with self.subTest(obj=obj):
                r = run_json(obj)
                self.assertEqual(r.returncode, 0)
                self.assertEqual(r.stdout, b"")

    def test_user_prompt_submit_iesire(self):
        r = run_json({"hook_event_name": "UserPromptSubmit",
                      "prompt": "execută Faza 4 din PLAN.md"})
        self.assertEqual(r.returncode, 0)
        out = json.loads(r.stdout.decode("utf-8"))
        self.assertEqual(list(out), ["hookSpecificOutput"])
        h = out["hookSpecificOutput"]
        self.assertEqual(h["hookEventName"], "UserPromptSubmit")
        self.assertEqual(h["additionalContext"], INSTRUCTIUNE)
        self.assertEqual(set(h), {"hookEventName", "additionalContext"})

    def test_user_prompt_submit_fara_potrivire(self):
        r = run_json({"hook_event_name": "UserPromptSubmit",
                      "prompt": "explică-mi faza 3"})
        self.assertEqual(r.returncode, 0)
        self.assertEqual(r.stdout, b"")

    def test_pretooluse_skill_executie(self):
        for name in ["superpowers:executing-plans",
                     "superpowers:subagent-driven-development"]:
            with self.subTest(name=name):
                r = run_json({"hook_event_name": "PreToolUse",
                              "tool_name": "Skill",
                              "tool_input": {"skill": name}})
                self.assertEqual(r.returncode, 0)
                out = json.loads(r.stdout.decode("utf-8"))
                h = out["hookSpecificOutput"]
                self.assertEqual(h["hookEventName"], "PreToolUse")
                self.assertEqual(h["additionalContext"], INSTRUCTIUNE)
                self.assertNotIn("permissionDecision", h)

    def test_pretooluse_alt_skill(self):
        r = run_json({"hook_event_name": "PreToolUse", "tool_name": "Skill",
                      "tool_input": {"skill": "superpowers:brainstorming"}})
        self.assertEqual(r.returncode, 0)
        self.assertEqual(r.stdout, b"")

    def test_pretooluse_forme_stricate(self):
        for ti in [None, [], "x", {"skill": 5}, {}]:
            with self.subTest(ti=ti):
                r = run_json({"hook_event_name": "PreToolUse", "tool_input": ti})
                self.assertEqual(r.returncode, 0)
                self.assertEqual(r.stdout, b"")


if __name__ == "__main__":
    unittest.main()
