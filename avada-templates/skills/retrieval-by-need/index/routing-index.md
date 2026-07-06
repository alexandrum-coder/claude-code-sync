# Routing Index — read this before loading any chapter

**Always apply** the `SKILL.md` core (non-negotiable rules + 6-step decision order + language rule) with nothing loaded. Then use the tables below to load **only** the chapters a task needs. The machine-readable twin of this file is `chapter-manifest.json`.

> Rule: never bulk-load `chapters/`. Load the mapped set, and at most one extra specific chapter if a fact is missing.

## Task type → chapters

| Task type | EN triggers | RO triggers | Load chapters |
|---|---|---|---|
| New page | new page, homepage, about, services | pagină nouă, prima pagină, despre, servicii | 01, 02, 03, 04, 09 |
| Landing / lead-gen | landing page, lead gen, conversion, form | landing, generare lead-uri, conversie, formular | 01, 02, 05, 08, 04 |
| Rebuild / audit existing page | rebuild, convert, audit, fix page | refacere, conversie, audit pagină | 01, 03, 04, 07\* |
| Header / footer / Layouts | header, footer, menu, template, layout | header, footer, meniu, șablon | 09, 01, 03 |
| WooCommerce / shop | shop, store, product, cart, checkout | magazin, produs, coș, checkout | 06, 09, 01, 03 |
| Global styling / branding | colors, fonts, branding, theme style | culori, fonturi, brand, stil | 03, 04, 10 |
| Responsive / mobile | responsive, mobile, tablet, breakpoint | responsive, mobil, tabletă | 04, 03 |
| Custom-code justification | custom code, can Avada do X, native alternative | cod custom, alternativă nativă | 07, 01 |
| SEO / AEO / schema | seo, schema, keywords, ai visibility | seo, schema, cuvinte cheie, vizibilitate ai | 08, 02 |
| Translation / bilingual copy | translate, bilingual, romanian copy | traducere, bilingv, text română | 10, 08 |

`*` Load 07 only if custom code is actually found or explicitly requested.

## Per-chapter "Load when"

| # | Chapter | Load when (EN) | Load when (RO) | Depends on |
|---|---|---|---|---|
| 00 | Build Rules | You need the full canonical rules & decision order (SKILL.md already summarizes them). | Ai nevoie de regulile complete și ordinea de decizie. | — |
| 01 | Native Elements Catalog | Pick the right native element for a section. | Alegi elementul nativ potrivit pentru o secțiune. | — |
| 02 | Page Layout Patterns | Need a section-by-section blueprint for a page type. | Ai nevoie de structura pe secțiuni a unui tip de pagină. | 01 |
| 03 | Global Options | Site-wide colors, typography, width, header/footer, forms, performance. | Setări globale: culori, tipografie, lățime, header/footer, formulare. | — |
| 04 | Responsive Rules | Desktop/tablet/mobile behavior, breakpoints, column order. | Comportament desktop/tabletă/mobil, breakpoints, ordinea coloanelor. | 03 |
| 05 | Forms & Leads | Contact/lead/quote/newsletter, spam & GDPR consent. | Contact/lead/ofertă/newsletter, anti-spam și GDPR. | 01 |
| 06 | WooCommerce | Online store templates and product filters. | Șabloane magazin și filtre de produse. | 09, 01 |
| 07 | Child Theme & Hooks | Custom dev is genuinely required (child theme, hooks, PHP). | Este nevoie real de dezvoltare custom. | 01 |
| 08 | SEO & AI Visibility | On-page SEO + AI/answer-engine visibility, schema, FAQ. | SEO on-page + vizibilitate AI, schema, FAQ. | 02 |
| 09 | Library, Layouts & Reuse | Reusable/global blocks and site-wide templates. | Blocuri reutilizabile/globale și șabloane de site. | 01, 03 |
| 10 | Bilingual Glossary | EN↔RO terms and bilingual build rules. | Termeni EN↔RO și reguli pentru proiect bilingv. | — |
