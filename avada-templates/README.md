# Avada Templates

Plan and specify **Avada-native** WordPress websites — without loading a whole documentation pack into context.

## The idea: retrieval-by-need

The old workflow was "upload 6–10 markdown files every time." This plugin replaces that. The `retrieval-by-need` skill keeps a small **always-on core** in context (the non-negotiable "native Avada first" rules + the 6-step decision order + a routing index) and pulls **only the chapters a task actually needs** from `skills/retrieval-by-need/chapters/`.

- Building a landing page? It loads the elements, patterns, forms, and SEO chapters — not WooCommerce or hooks.
- Building a shop? It loads WooCommerce, Library/Layouts, elements — not the child-theme chapter.

Routing is driven by `skills/retrieval-by-need/index/routing-index.md` (human-readable) and `index/chapter-manifest.json` (machine-readable, with EN + RO trigger keywords).

## Bilingual (EN + RO)

Avada's admin UI and element/option names are **English** and stay English even for Romanian clients. Client-facing **body copy** (headings, paragraphs, CTAs, form labels) is written in the client's language — usually Romanian. Every chapter carries both an English layer and a Romanian layer; `chapters/10-glossary-bilingual.md` maps the terms.

## What's inside

```
avada-templates/
  skills/retrieval-by-need/
    SKILL.md                     # always-on core: rules + decision order + routing
    index/
      routing-index.md           # task -> chapters table (+ "load when")
      chapter-manifest.json      # machine-readable routing (EN/RO triggers, deps)
    chapters/00..10-*.md         # the on-demand knowledge base
    templates/project-brief.md   # bilingual fill-in brief
  commands/                      # slash-commands (reusable prompts)
    avada-plan.md                # full site implementation plan
    avada-page.md                # one new page
    avada-rebuild.md             # convert an existing page to Avada-native
    avada-landing.md             # lead-gen landing page
    avada-header-footer.md       # header/footer via Avada Layouts
    avada-woocommerce.md         # WooCommerce templates
    avada-audit.md               # replace custom code with native Avada
```

## Use it

1. Run **`/avada-plan`** for a whole site, or a scoped command (`/avada-page`, `/avada-landing`, `/avada-woocommerce`, …) for one task.
2. Fill in `templates/project-brief.md` for the concrete project.
3. The skill loads the matching chapters and returns a section-by-section, Avada-native implementation spec (Containers → Columns → Elements), with Global Options, responsive behavior, Library/Global Elements, and an implementation checklist.

**Core rule it always enforces:** native Avada first — custom HTML/CSS/JS/PHP only when no native Avada solution exists, and only with written justification.

Facts verified against the official Avada documentation (avada.com/documentation), March–April 2026.
