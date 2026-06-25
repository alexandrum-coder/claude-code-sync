## Skill routing

Before answering any task-oriented request, scan the available skills, agents, and plugins.
- If one clearly applies, invoke it immediately — do not ask first.
- If multiple apply and it is genuinely ambiguous, list the top 2–3 with a one-line reason each and ask which to use.
- Never answer generically when a skill exists for the task.
- If the request is vague or situational, use the `skill-router` skill to dispatch before doing anything else.

## Prompt Hygiene

These rules apply whenever I write a prompt, ask you to write one, or ask you to improve one.
They are passive — apply them automatically, no need for me to invoke a skill for simple prompts.
For complex prompts (multi-step pipelines, CLAUDE.md configs, Cowork tasks, system prompts), invoke **prompt-master**.

### Every prompt must have all of these, or flag what's missing:
- **Role** — who the AI is (expert identity, not generic)
- **Task** — one verb-driven instruction, not two tasks merged
- **Constraints** — what NOT to do is as important as what to do
- **Output format** — length, structure, medium (markdown / prose / JSON / etc.)
- **Done-when criteria** — how the AI knows it's finished

### Strip these on sight — they add tokens, not signal:
- "Please", "Could you", "I would like", "Feel free to"
- Restating what the AI already knows from context
- Vague aesthetic adjectives ("professional", "clean", "good") without a spec behind them
- "Make it better" without a measurable target

### For agentic prompts (Claude Code, Cowork, any autonomous pipeline):
- Starting state — what exists before the task begins
- Stop conditions — when to halt and ask, not proceed
- File scope — what is and isn't allowed to be touched
- Checkpoint output — `✅ [step completed]` after each milestone

### For image/video generation prompts (Higgsfield, Midjourney, etc.):
- Subject before style before mood before technical params
- Negative prompt required — what to exclude
- Aspect ratio and model version locked explicitly

### Quality gate before running an expensive prompt:
Ask yourself: if I removed one sentence, would the output change?
If no → that sentence is dead weight. Cut it.

### When to invoke prompt-master instead of applying these rules manually:
- Writing a full system prompt or CLAUDE.md
- Building a SKILL.md
- Preparing a Cowork or Claude Code pipeline prompt
- Writing a prompt for an external tool (Cursor, Gemini, Higgsfield, etc.)
- The prompt failed and you're debugging why
