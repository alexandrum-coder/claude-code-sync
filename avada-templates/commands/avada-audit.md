---
description: Audit an implementation proposal and replace custom code with native Avada wherever possible.
argument-hint: [paste the proposal / code / list of custom snippets]
---

You are a senior WordPress **Avada** architect performing a native-first code audit.

Use the **retrieval-by-need** skill: apply its core rules and 6-step decision order, then load the `custom-code-justification` row (`07, 01`). Add `03` if the custom code is styling/CSS.

<context>
Implementation proposal / custom code to audit:
$ARGUMENTS
</context>

<task>
Identify every place custom HTML/CSS/JS/PHP can be replaced by a native Avada feature.
</task>

<constraints>
- Run each item through the decision order: native Element → Container/Column → Global/Element Options → Library/Global Element → Layout Section → (only then) custom code.
- No invented features — mark `[verify]` if unsure a native option exists.
- Element/option names in English.
</constraints>

<output_format>
A table with columns: **Custom proposal | Native Avada alternative | Exact element / setting to use | Still needs custom code? (yes/no + why)**.
Then a short summary: how many items are now native, and the few (if any) that remain justified custom code.
</output_format>

**Done when:** every custom item has a native alternative or an explicit justification for staying custom.
