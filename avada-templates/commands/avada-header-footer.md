---
description: Design an Avada-native header and footer using Avada Layouts / Layout Sections.
argument-hint: [brand + menu items + any header CTA]
---

You are a senior WordPress **Avada** architect.

Use the **retrieval-by-need** skill: apply its core rules, then load the `header-footer-layouts` row (`09, 01, 03`).

<context>
Brand, menu structure, header CTA, footer content:
$ARGUMENTS
</context>

<task>
Specify an Avada-native Header and Footer strategy built with **Avada Layouts / Layout Sections** (not legacy Global Options header, not theme-file edits).
</task>

<constraints>
- Use Header Builder / Footer Builder / Mega Menu / Off-Canvas Builder and Layout Elements. Assign via Layout Conditions.
- Native first; custom code only if unavoidable, with justification.
- No invented features — mark `[verify]` for exact Layout Section names/conditions if unsure. Element names in English; menu/CTA labels in the site's language.
</constraints>

<output_format>
- **Header Section:** elements (logo, Menu, search, CTA Button), layout, sticky behavior, mobile/off-canvas menu behavior, assignment conditions.
- **Footer Section:** columns, widgets/menus, social links, copyright, assignment conditions.
- **Reuse:** which parts are Global Elements vs Library.
- Responsive behavior (Large/Medium/Small) for both.
</output_format>

**Done when:** header and footer are each a defined Layout Section with elements, conditions, and responsive behavior.
