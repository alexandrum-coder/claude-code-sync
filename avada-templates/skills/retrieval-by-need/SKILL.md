---
name: retrieval-by-need
description: Use when planning, designing, speccing, rebuilding, or auditing any website, page, landing page, hero, header, footer, template, or online store with the Avada theme, Avada Builder, or Avada Layouts on WordPress — including tasks phrased in Romanian (pagină Avada, site Avada, landing Avada, magazin/WooCommerce Avada, formular Avada, meniu Avada). Also use when replacing custom HTML/CSS/JS with native Avada, or choosing which Avada element fits a section.
---

# retrieval-by-need (Avada)

## Overview
Build Avada sites from **native Avada capabilities first**, and answer each task by loading **only the documentation chapters that task needs** — never the whole pack. This file is the always-on core: the rules, the decision order, and the routing table. The detailed knowledge lives in `chapters/` and is read on demand.

Two failure modes this skill exists to stop:
1. **Context dumping** — reading every chapter "to be safe." Don't. Route first, read the minimum.
2. **Custom-code reflex** — writing HTML/CSS/JS/PHP for something Avada does natively.

## Retrieval protocol (do this every task)
1. Apply the **Non-negotiable rules** and **Decision order** below — always, without loading anything.
2. Identify the task type, then read `index/routing-index.md` (small) to confirm which chapters map to it.
3. Read **only** the chapters listed for that task type (plus any `depends_on` noted in `index/chapter-manifest.json`).
4. If the task is ambiguous, match its keywords (EN + RO) against `index/chapter-manifest.json` triggers before loading.
5. If a needed fact is missing from the loaded chapters, load **one** more specific chapter — do not bulk-load `chapters/`.

## Non-negotiable rules
- **Native Avada first.** Use Avada Builder, Containers, Columns, Design/Layout/Form Elements, Global Options, Avada Layouts, Library and Global Elements before any custom code.
- **No invented features.** Only claim an Avada capability if it's in a chapter or the cited official page. If unsure, write `[verify]` — never fabricate an element, option, or hook name.
- **Custom code is the last resort.** HTML/CSS/JS/PHP only when no native path exists, and only with a one-line written justification of why Avada can't do it natively.
- **Never edit the parent theme.** Customization goes through Global Options, element options, Avada Layouts, or a child theme.
- **Structure everything as Containers → Columns → Elements.**
- **Specify responsive** (Large / Medium / Small) and **reuse** (Library vs Global Element) for every recurring block.

## Decision order (ask in this sequence before custom code)
1. Is there a native Avada **Element** for this?
2. Can a **Container / Column** setting do it?
3. Can **Global Options** or **Element Options** do it?
4. Can it be saved/reused via **Library / Global Element**?
5. Does it belong in an **Avada Layout / Layout Section**?
6. Only if all answer "no" → propose custom code, with justification.

## Routing table (task type → chapters to load)
Chapter `00` (full rules) is summarized above; load it only for deep rule detail.

| Task type (EN / RO) | Load chapters |
|---|---|
| New page / pagină nouă | 01, 02, 03, 04, 09 |
| Landing / lead-gen / formular | 01, 02, 05, 08, 04 |
| Rebuild / audit existing / refacere pagină | 01, 03, 04, 07* |
| Header / footer / Layouts / meniu | 09, 01, 03 |
| WooCommerce / shop / magazin | 06, 09, 01, 03 |
| Global styling / branding / culori, fonturi | 03, 04, 10 |
| Responsive / mobile | 04, 03 |
| Custom-code justification / audit cod | 07, 01 |
| SEO / AEO / schema | 08, 02 |
| Translation / bilingual copy / traducere | 10, 08 |

`*` load 07 only if custom code is actually found or requested.

## Language rule (bilingual)
The WordPress admin and every Avada **element/option name is English** — keep them English even for Romanian clients. Write **client-facing body copy** (headings, paragraphs, CTA and form labels) in the client's language, usually **Romanian**. Use `chapters/10-glossary-bilingual.md` for EN↔RO terms.

## Reusable prompts
For full deliverables, use the plugin's commands: `/avada-plan` (whole site), `/avada-page`, `/avada-rebuild`, `/avada-landing`, `/avada-header-footer`, `/avada-woocommerce`, `/avada-audit`. Fill in `templates/project-brief.md` for a concrete project.

## Red flags — STOP if you catch yourself
- "I'll read all the chapters to be thorough." → No. Route first, load the minimum.
- "I'll just write a bit of CSS/HTML for this." → Run the Decision order first.
- "Avada probably has an option called…" → Verify in a chapter or mark `[verify]`. Don't invent.
- "I'll put the copy in English because the theme is English." → Element names EN, body copy in the client's language.

| Rationalization | Reality |
|---|---|
| "Loading everything is safer." | It buries the task and wastes context. The routing table is the safe path. |
| "Custom code is faster here." | Faster to write, worse to maintain and breaks Avada updates. Native first. |
| "This element surely exists." | If it's not in a chapter or the cited doc, it's `[verify]`, not fact. |
