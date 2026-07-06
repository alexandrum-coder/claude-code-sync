# Avada Templates Plugin — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert the manual-upload "Avada Knowledge Pack" into an installable Claude plugin (`avada-templates`) inside a self-built marketplace (`obsydia`), whose core is a `retrieval-by-need` skill that loads only rules + a routing index by default and pulls individual documentation chapters on demand.

**Architecture:** A marketplace folder holds one plugin. The plugin holds one skill plus slash-commands. The skill's `SKILL.md` is a lightweight always-on core (non-negotiable Avada rules + 6-step decision order + a routing index + language rule). The bilingual documentation lives as ~11 chapter files that are read only when the routing index maps the current task to them. A JSON manifest makes routing machine-actionable; commands wrap the reusable prompts.

**Tech Stack:** Markdown, JSON (plugin.json / marketplace.json / chapter-manifest.json), Claude Code plugin + skill format, Avada theme domain knowledge (verified against avada.com/documentation).

## Global Constraints

- **Bilingual (EN + RO), asymmetric.** Avada UI / theme terms stay **English canonical** (that is the WordPress admin language). Client-facing copy guidance and explanations are provided in **both EN and RO**. Research must consult Avada docs in EN **and** any RO material. Every chapter carries an `## EN` and `## RO` layer or a bilingual glossary line; no chapter is EN-only for user-facing guidance.
- **Native Avada first.** Custom HTML/CSS/JS/PHP only when no native Avada solution exists, and only with written justification. This rule is non-negotiable and lives in the always-on core.
- **No invented features.** Do not state an Avada capability unless verified against official docs. If unverified, mark `[uncertain]` and flag for research — never fabricate.
- **Retrieval discipline.** The skill MUST read the routing index / manifest first and load ONLY the chapters the task needs. Loading the whole pack into context is the failure mode being eliminated.
- **Marketplace name:** `obsydia`. **Plugin display name:** `Avada Templates` (folder/id `avada-templates`). **Skill name:** `retrieval-by-need`.
- **Plugin schema is authoritative from the tool, not memory.** Before writing `plugin.json` / `marketplace.json`, confirm exact schema via the `cowork-plugin-management:create-cowork-plugin` skill (Task 2). Do not guess manifest keys.
- **Workspace root for the build:** `D:\Claude CoWork\claude-code-sync\avada-template\obsydia\`.

---

## Target File Structure

```
obsydia/                                        # marketplace root
  .claude-plugin/
    marketplace.json                            # lists the avada-templates plugin
  README.md                                     # what obsydia is, how to add it
  plugins/
    avada-templates/                            # the plugin
      .claude-plugin/
        plugin.json                             # plugin manifest
      README.md                                 # plugin overview + usage
      skills/
        retrieval-by-need/
          SKILL.md                              # ALWAYS-ON core (rules + index + protocol)
          index/
            routing-index.md                    # human+machine task->chapter table
            chapter-manifest.json               # machine-readable routing metadata
          chapters/
            00-build-rules.md
            01-elements-catalog.md
            02-layout-patterns.md
            03-global-options.md
            04-responsive-rules.md
            05-forms-and-leads.md
            06-woocommerce.md
            07-child-theme-hooks.md
            08-seo-aeo.md                        # NEW (extracted from old master prompt §5)
            09-library-layouts-reuse.md          # NEW (Library / Global Elements / Layouts)
            10-glossary-bilingual.md             # NEW (EN<->RO term map + language rules)
          templates/
            project-brief.md                     # bilingual fill-in brief (from old 08)
      commands/
        avada-plan.md                            # from old 09 master prompt
        avada-page.md                            # new page
        avada-rebuild.md                         # rebuild existing page
        avada-landing.md                         # lead-gen landing
        avada-header-footer.md                   # header/footer via Layouts
        avada-woocommerce.md                     # Woo templates
        avada-audit.md                           # custom-code -> native audit
```

**Mapping from old pack → new structure:**

| Old file | New home | Change |
|---|---|---|
| README.md | plugin `README.md` + marketplace `README.md` | Rewritten as install/usage, not load-order notes |
| 00-build-rules | `SKILL.md` core **and** `chapters/00-build-rules.md` | Condensed into core; full canonical version kept as chapter |
| 01-elements-catalog | `chapters/01-elements-catalog.md` | Expanded + verified + bilingual |
| 02-layout-patterns | `chapters/02-layout-patterns.md` | Expanded + bilingual |
| 03-global-options | `chapters/03-global-options.md` | Expanded to full panel map + bilingual |
| 04-responsive-rules | `chapters/04-responsive-rules.md` | Verified breakpoints + bilingual |
| 05-forms-and-leads | `chapters/05-forms-and-leads.md` | Expanded (GDPR/consent, reCAPTCHA) + bilingual |
| 06-woocommerce | `chapters/06-woocommerce.md` | Expanded (Layouts per template) + bilingual |
| 07-child-theme-hooks | `chapters/07-child-theme-hooks.md` | Verified hooks + bilingual |
| 08-project-brief-template | `skills/.../templates/project-brief.md` | Bilingual fill-in |
| 09-master-prompt | `commands/avada-plan.md` (+ referenced by SKILL) | Rewritten per prompt-master |
| 10-mini-prompts | `commands/avada-*.md` (6 commands) | Split + rewritten per prompt-master |
| — | `chapters/08-seo-aeo.md` | NEW |
| — | `chapters/09-library-layouts-reuse.md` | NEW |
| — | `chapters/10-glossary-bilingual.md` | NEW |
| — | `index/routing-index.md`, `index/chapter-manifest.json` | NEW — the retrieval brain |

---

## Retrieval-by-need protocol (the heart of the skill)

`SKILL.md` instructs Claude, on every Avada task, to:

1. **Always apply the core rules** (embedded in `SKILL.md` — never skipped).
2. **Read `index/routing-index.md`** (small) to identify the task type.
3. **Select the minimal chapter set** from the routing table (plus any `depends_on` in the manifest).
4. **Read ONLY those chapter files.** Do not read chapters not selected. Do not read the whole `chapters/` folder.
5. If the task is ambiguous, read `index/chapter-manifest.json` triggers (EN+RO keywords) to disambiguate before loading.
6. Produce output; if a needed fact is not in a loaded chapter, load one more specific chapter rather than guessing.

**Routing table (task type → always-load + on-demand chapters):**

| Task type (EN / RO triggers) | Always | On-demand chapters |
|---|---|---|
| New page / pagină nouă | 00 (core) | 01, 02, 03, 04, 09 |
| Landing / lead gen / formular | 00 | 01, 02, 05, 08, 04 |
| Rebuild / audit existing / refacere | 00 | 01, 03, 04, 07(only if custom code found) |
| Header/Footer / Layouts | 00 | 09, 01, 03 |
| WooCommerce / magazin | 00 | 06, 09, 01, 03 |
| Global styling / branding | 00 | 03, 04, 10 |
| Responsive / mobile | 00 | 04, 03 |
| Custom code justification | 00 | 07, 01 |
| SEO / AEO / schema | 00 | 08, 02 |
| Translation / bilingual copy | 00 | 10, 08 |

This table lives verbatim in both `SKILL.md` (compact) and `routing-index.md` (full, with per-chapter "load when").

---

## Task 1 — Verify Avada facts and capture bilingual terminology

**Files:**
- Create: `obsydia/plugins/avada-templates/skills/retrieval-by-need/index/research-notes.md` (scratch; deleted before final packaging)

**Interfaces:**
- Produces: a verified fact sheet + EN↔RO term list consumed by Tasks 4–6 (chapters, glossary, manifest triggers).

- [ ] **Step 1:** WebSearch + fetch avada.com/documentation for: Builder Elements list, Container element, Column element, Global Options panel list, Responsive design settings + current breakpoint defaults, Avada Form Builder, WooCommerce Builder, Layouts & Layout Sections, Library, Hooks/actions/filters. Record exact element names and option groups.
- [ ] **Step 2:** Resolve the hedges: confirm the **Pricing Table** element exists and its options; confirm the **newsletter/mailing-list** capability (Avada Form + integrations, e.g. Mailchimp). Replace "if available" language with verified fact or a clear `[not native — use X]`.
- [ ] **Step 3:** Search for Romanian-language Avada material and, failing that, record the RO copy-terminology equivalents to pair with each EN UI term (e.g., Container = Container, Column = Coloană, Button = Buton/CTA, Testimonials = Testimoniale).
- [ ] **Step 4 (validation):** Every element/option that will appear in a chapter has a source URL or an explicit `[uncertain]` flag in `research-notes.md`. No unverified capability proceeds to a chapter.

## Task 2 — Confirm plugin/marketplace schema, then scaffold

**Files:**
- Create: `obsydia/.claude-plugin/marketplace.json`
- Create: `obsydia/plugins/avada-templates/.claude-plugin/plugin.json`
- Create: full empty folder tree per "Target File Structure"

**Interfaces:**
- Produces: valid `marketplace.json` (name `obsydia`, one plugin entry `avada-templates`) and `plugin.json` (name, version, description, author) that later tasks populate.

- [ ] **Step 1:** Read the `cowork-plugin-management:create-cowork-plugin` skill to get the exact, current manifest schema (keys, required fields, how skills/commands are discovered). Do not hand-write keys from memory.
- [ ] **Step 2:** Write `plugin.json` with verified keys: name `avada-templates`, display `Avada Templates`, semver `0.1.0`, description with EN+RO trigger keywords, author, and any required skills/commands discovery config.
- [ ] **Step 3:** Write `marketplace.json` listing the plugin by relative source path.
- [ ] **Step 4 (validation):** `python -m json.tool` (or equivalent) parses both JSON files without error; required keys present; plugin source path resolves to a real folder.

## Task 3 — Build the retrieval-by-need SKILL.md core

**Files:**
- Create: `obsydia/plugins/avada-templates/skills/retrieval-by-need/SKILL.md`

**Interfaces:**
- Consumes: routing table (above), Task 1 rules.
- Produces: the always-on contract every Avada task obeys.

- [ ] **Step 1:** Read the `superpowers:writing-skills` skill; follow its SKILL.md frontmatter + structure requirements.
- [ ] **Step 2:** Write frontmatter: `name: retrieval-by-need`, `description:` with concrete trigger phrases in EN + RO (Avada, WordPress Avada, Avada Builder, pagină Avada, site Avada, landing Avada, WooCommerce Avada, etc.) and a one-line statement that it routes to chapters by need.
- [ ] **Step 3:** Body sections: (a) non-negotiable rules (condensed 00); (b) 6-step decision order; (c) the **retrieval protocol** (read index first, load only matched chapters, never the whole pack); (d) compact routing table; (e) language-handling rule (UI EN, body EN+RO); (f) pointer to commands and brief template.
- [ ] **Step 4 (validation):** SKILL.md is under the skill body size guidance from writing-skills; contains the literal instruction not to bulk-read chapters; every chapter id referenced in the routing table exists as a filename planned in Task 5.

## Task 4 — Write the routing index + chapter manifest + brief template

**Files:**
- Create: `.../index/routing-index.md`
- Create: `.../index/chapter-manifest.json`
- Create: `.../templates/project-brief.md`

**Interfaces:**
- Consumes: chapter filenames (Task 5), routing table.
- Produces: machine-readable routing consumed by the skill at runtime.

- [ ] **Step 1:** Write `chapter-manifest.json`: array of objects `{ id, path, title_en, title_ro, always_load, task_types[], triggers_en[], triggers_ro[], depends_on[] }` for chapters 00–10 + templates.
- [ ] **Step 2:** Write `routing-index.md`: the full routing table + a per-chapter "Load when …" list (EN + RO), mirroring the manifest.
- [ ] **Step 3:** Write bilingual `project-brief.md` (goal, audience, sitemap, brand, assets, constraints) with EN prompts and RO parallel labels.
- [ ] **Step 4 (validation):** Every `path` in the manifest resolves to a real chapter file; every `id` in the routing table appears in the manifest and vice-versa (no orphans, no dangling).

## Task 5 — Write the expanded bilingual chapters (00–10)

**Files:**
- Create: `chapters/00-build-rules.md` … `chapters/10-glossary-bilingual.md` (11 files)

**Interfaces:**
- Consumes: Task 1 verified facts.
- Produces: the on-demand knowledge base.

- [ ] **Step 1:** Write 00 (canonical full rules), 01 (expanded elements catalog: add Pricing Table, Alert, Content Boxes, Countdown, Flip Boxes, Image Carousel, Table, Tagline Box, Sharing Box, Widget Area, Search, Off-Canvas, Blog/Recent Posts/Recent Works, FAQ element, Slider types, dynamic Post/Term/User elements), 02 (expanded layout patterns).
- [ ] **Step 2:** Write 03 (full Global Options panel map), 04 (responsive with verified breakpoints), 05 (Forms incl. GDPR consent + reCAPTCHA + notifications), 06 (WooCommerce Builder per template).
- [ ] **Step 3:** Write 07 (child theme + verified hooks), 08 (SEO/AEO: schema, entities, FAQ, internal linking), 09 (Library / Global Elements / Layouts & Layout Sections / conditional display), 10 (EN↔RO glossary + language rules).
- [ ] **Step 4:** Each chapter gets frontmatter: `id`, `title_en`, `title_ro`, `load_when` (EN+RO), `depends_on` — matching the manifest.
- [ ] **Step 5 (validation):** No chapter contains an unverified capability without `[uncertain]`; every chapter has both EN and RO user-facing guidance; frontmatter matches manifest exactly.

## Task 6 — Rewrite prompts as slash-commands (prompt-master rules)

**Files:**
- Create: `commands/avada-plan.md`, `avada-page.md`, `avada-rebuild.md`, `avada-landing.md`, `avada-header-footer.md`, `avada-woocommerce.md`, `avada-audit.md`

**Interfaces:**
- Consumes: old 09/10 content, prompt-master tool guidance (target = Claude/Cowork, Opus 4.x).
- Produces: installable commands that trigger the skill.

- [ ] **Step 1:** For `avada-plan.md` (from 09): senior-Avada-architect role, XML-structured sections (`<context><task><constraints><output_format>`), explicit/literal instructions, output-format lock, grounding anchor ("do not invent Avada features; load the relevant chapter or mark [uncertain]"), NO "think step by step" (Opus-native), instruction to invoke `retrieval-by-need` and load chapters by need. Keep bilingual note (EN plan, RO copy where the client needs RO).
- [ ] **Step 2:** Write the 6 mini-commands from 10, each scoped, each referencing the skill + its routing row, each with an explicit "done when" and output format.
- [ ] **Step 3 (validation):** Each command names the skill, states the chapters it needs (matching the routing table), has an output-format lock, and carries no fabricated technique (no ToT/MoE/CoT-on-native). Reference copies of 09/10 preserved as chapters where useful (both, per user decision).

## Task 7 — Validate, package, and present

**Files:**
- Modify: delete `index/research-notes.md`
- Create: (optional) a zipped `.plugin`/marketplace bundle in outputs for distribution

- [ ] **Step 1:** JSON validate `marketplace.json`, `plugin.json`, `chapter-manifest.json`.
- [ ] **Step 2:** Cross-check: every chapter id in SKILL routing ↔ routing-index ↔ manifest ↔ actual filename (four-way consistency). Every command's declared chapters exist.
- [ ] **Step 3:** Bilingual coverage check: each chapter + brief has EN and RO; glossary covers every element named in 01.
- [ ] **Step 4:** Link check: no dangling relative links; folder tree matches "Target File Structure".
- [ ] **Step 5:** Remove scratch files; present the marketplace/plugin folder + key files to the user via present_files.

---

## Self-Review (run against spec)

**Spec coverage:** rewrite plan ✓ (Tasks 1,6), prompt-master improvements ✓ (Task 6), new structure ✓ (structure section), avada-templates project ✓ (Tasks 2–6), obsydia marketplace ✓ (Task 2), retrieval-by-need skill ✓ (Tasks 3–5), bilingual ✓ (Global Constraints + Task 5), full rewrite+expand ✓ (Task 5), 12-files+routing-index ✓ (routing section), commands+docs both ✓ (Task 6).

**Placeholder scan:** chapters specify exact element additions, not "add more elements". Manifest schema fields enumerated. Routing table concrete.

**Consistency:** chapter ids 00–10 are used identically in SKILL.md, routing-index.md, chapter-manifest.json, and filenames — enforced by Task 7 four-way check.

**Open risk:** plugin manifest schema is confirmed from the tool at execution (Task 2), not from memory — the one place guessing would break installation.
