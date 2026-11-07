#!/usr/bin/env python3
"""Hook de declansare pentru agentul task-verifier.

Tratează UserPromptSubmit și PreToolUse (matcher Skill). Nu blochează
niciodată: iese mereu cu cod 0, iar la orice abatere nu scrie nimic.
"""
import json
import re
import sys
import unicodedata

INSTRUCTIUNE = (
    "Înainte de prima scriere, cheamă agentul `obsydia-skills:task-verifier` "
    "în modul `preflight`, cu calea planului; la fiecare ✅ cheamă-l în modul "
    "`checkpoint`."
)

SKILLURI = ("executing-plans", "subagent-driven-development")

_VERB = re.compile(
    r"\b(?:execut(?:a|am|e)|implementeaz(?:a|am)|implementam|implement(?:ing)?|"
    r"porneste|pornesc|pornim|porni|ruleaz(?:a|am)|incepe|incepem|incep|start|"
    r"continu(?:a|am)|run|proceed|go\s+ahead|kick\s+off)\b"
)
_NEGATIE = re.compile(r"(?:\bnu|\bdon'?t|\bdo\s+not|\bnever)\s+$")
_DISCUTIE = re.compile(
    r"\b(?:explic|discut|rezum|descri|explain|discuss|summar|describ)"
)
_OBIECT = re.compile(
    r"\b(?:faz(?:a|ei|ele|elor|e)|task(?:ul|uri|urile)?|pilot(?:ul|ului)?|"
    r"lot(?:ul|ului|uri|urile)?|plan(?:ul|ului|uri|urile)?|step(?:s)?|"
    r"phase(?:s)?)\b"
)
_SKILL_CMD = re.compile(r"(?:^|\s)/[\w.-]*:?(?:executing-plans|subagent-driven-development)\b")


def _normalizeaza(text):
    d = unicodedata.normalize("NFKD", text.lower())
    return "".join(c for c in d if not unicodedata.combining(c))


def detect(prompt):
    if not isinstance(prompt, str):
        return False
    t = _normalizeaza(prompt)
    if _SKILL_CMD.search(t):
        return True
    if _DISCUTIE.search(t) or not _OBIECT.search(t):
        return False
    for m in _VERB.finditer(t):
        if not _NEGATIE.search(t[: m.start()]):
            return True
    return False


def _iesire(event):
    return {
        "hookSpecificOutput": {
            "hookEventName": event,
            "additionalContext": INSTRUCTIUNE,
        }
    }


def _decide(data):
    if not isinstance(data, dict):
        return None
    event = data.get("hook_event_name")
    if event == "PreToolUse":
        ti = data.get("tool_input")
        name = ti.get("skill") if isinstance(ti, dict) else None
        if isinstance(name, str) and any(s in name.lower() for s in SKILLURI):
            return _iesire("PreToolUse")
        return None
    if event in (None, "UserPromptSubmit"):
        if detect(data.get("prompt")):
            return _iesire("UserPromptSubmit")
    return None


def main():
    try:
        raw = sys.stdin.buffer.read()
        data = json.loads(raw.decode("utf-8"))
        out = _decide(data)
        if out is not None:
            sys.stdout.write(json.dumps(out))
            sys.stdout.flush()
    except Exception:
        pass
    return 0


if __name__ == "__main__":
    main()
    sys.exit(0)
