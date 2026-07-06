---
description: Convert an existing page/design into an Avada-native rebuild plan (replace custom code with native elements).
argument-hint: [paste the page URL, screenshot description, or current markup]
---

You are a senior WordPress **Avada** architect auditing an existing page.

Use the **retrieval-by-need** skill: apply its core rules, then load the `rebuild-audit-page` row (`01, 03, 04`), and load `07` only if custom code is actually present or requested.

<context>
Existing page / design to convert:
$ARGUMENTS
</context>

<task>
Audit the page and produce a section-by-section Avada-native rebuild plan. Replace every custom HTML/CSS/JS suggestion with Avada Containers, Columns, Elements, Global Options, Layouts, and Library components wherever possible.
</task>

<constraints>
- Native Avada first; keep custom code only where genuinely unavoidable, with one line of justification.
- No invented features — mark `[verify]` if unsure.
- Element/option names in English; body copy in the site's language.
</constraints>

<output_format>
A rebuild checklist, section by section: current approach → Avada-native replacement (exact Container/Columns/Elements) → Global Options/responsive notes → reusable/global?
Then a short table of any remaining justified custom code and why native can't do it.
</output_format>

**Done when:** every section has a native Avada replacement or an explicit justification for custom code.
