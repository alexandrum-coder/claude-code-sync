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

## Frontend Motion & Animation — apply automatically, get this right the first time

These exist because a scroll-reveal system shipped with literally zero working motion — for the whole site, since it was first written — and it took a full debugging session to find, because verification only ever checked settled-state screenshots, which look identical whether something animated into place or just snapped there instantly.

### Tailwind v4: transitions must name `translate`/`scale`/`rotate`, never rely on `transform`
Tailwind v4 compiles `translate-x-*`, `translate-y-*`, `scale-*`, `rotate-*` utilities to the **native CSS `translate`/`scale`/`rotate` properties** — not to `transform` (a real behavior change from v3, which composed them all into one `transform` value). Writing `transition-[opacity,transform]` when the actual utilities in play are translate/scale utilities means `transform` never changes, so there is nothing to interpolate — the element snaps instantly between states with zero visible motion, while `opacity` (if also listed) still fades normally, which is exactly what makes this bug invisible at a glance.
- **Rule:** any Tailwind v4 transition/animation using `translate-*`, `scale-*`, or `rotate-*` utilities must list `translate`, `scale`, `rotate` explicitly in the `transition-property` (or `transition-[...]` arbitrary value) — e.g. `transition-[opacity,translate,scale]`. Do not write `transition-transform` or include `transform` in the property list as a stand-in for these utilities in v4; it does nothing.
- **Verify, don't assume:** before calling motion work done, check `getComputedStyle(el).translate` / `.scale` / `.rotate` / `.transitionProperty` directly — not `.transform`, which will misleadingly read `"none"` even when translate/scale utilities are active and working correctly.

### Scroll-triggered reveal fallback timers must be armed by proximity, not by mount time
If a reveal/animation system includes a "ship visible even if the IntersectionObserver never fires" safety-net timer, that timer must only start once the element is actually approaching the viewport (e.g. a second IntersectionObserver with a wide `rootMargin`) — never on component mount. A timer started at mount fires for every element on the entire page within a few seconds of page load, regardless of scroll position, silently resolving everything to its final visible state before a human has had time to scroll anywhere near it. On any page taller than one viewport, this makes the entire reveal system invisible while looking, in code review, like it should obviously work.

### The verification standard for any scroll/hover/transition motion
A snap and a smooth transition produce an identical settled-state screenshot. Never declare animation work complete based on a screenshot or a "looks right" pass alone. Verify the actual interpolation: read the correct `getComputedStyle` property before the state change and after, or add timestamped console logging and inspect the real timeline of when states flip relative to scroll/interaction. If the evidence only ever shows the final state, that is not verification — go get evidence of the transition itself.

## Romanian spelling — absolute rule

Write **sunt**. Never write the â-variant ("sânt", "sântem", "sânteți"). This applies everywhere without exception: chat replies, files on disk, generated documents, code comments, commit messages, any project, any session. Before emitting Romanian text, check for the sequence "sânt" and replace it with "sunt". Do not open a discussion about which form is academically correct — the user has decided.
