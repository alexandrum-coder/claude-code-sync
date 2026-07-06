---
id: "00"
title_en: Build Rules
title_ro: Reguli de construcție
load_when_en: You need the full canonical native-first rules and decision order.
load_when_ro: Ai nevoie de regulile complete native-first și ordinea de decizie.
task_types: [all]
depends_on: []
---

# 00 — Build Rules (canonical, long form)

> This is the authoritative rulebook. SKILL.md only summarizes it. When in doubt, this file wins.
> Source of truth for every fact below: `_research/research-notes.md`. Anything not in that file is marked `[verify]` and must never be presented as confirmed.

## Objective / Obiectiv

**EN** — Build WordPress sites and pages using **native Avada capabilities only**, in this order of preference: Avada Builder Design/Form/Layout Elements → Container/Column/Nested Columns → Global Options / Element Options → Avada Library / Global Elements → Avada Layouts / Layout Sections → custom code (child theme CSS/JS/PHP) as the last, justified resort. The goal is a maintainable, editor-friendly build a non-developer can still operate inside Avada Builder — not a bespoke codebase.

**RO** — Construiește site-uri și pagini WordPress folosind **exclusiv capabilitățile native Avada**, în această ordine de preferință: Elemente Design/Form/Layout din Avada Builder → Container/Column/Nested Columns → Global Options / Element Options → Avada Library / Global Elements → Avada Layouts / Layout Sections → cod custom (CSS/JS/PHP în child theme) doar ca ultimă soluție, justificată. Scopul este un build mentenabil, operabil de un non-developer în Avada Builder — nu un cod bespoke.

## Mandatory rules / Reguli obligatorii

| # | EN | RO |
|---|----|----|
| 1 | Use native Avada elements before any custom HTML/CSS/JS. | Folosește elemente native Avada înainte de orice HTML/CSS/JS custom. |
| 2 | Never invent an Avada element, option, or hook name. If it's not in `research-notes.md` or a cited official page, mark `[verify]`. | Nu inventa niciodată un nume de element, opțiune sau hook Avada. Dacă nu e în `research-notes.md` sau într-o pagină oficială citată, marchează `[verify]`. |
| 3 | Structure every page as **Containers → Columns → Elements**. Never build a custom CSS grid when Columns/Nested Columns can do it. | Structurează fiecare pagină ca **Containers → Columns → Elements**. Nu construi un grid CSS custom când Columns/Nested Columns pot rezolva. |
| 4 | For recurring design blocks, use **Avada Library**. For blocks that must stay identical and sync everywhere, use **Global Elements**. | Pentru blocuri recurente, folosește **Avada Library**. Pentru blocuri care trebuie să rămână identice și sincronizate peste tot, folosește **Global Elements**. |
| 5 | For header, footer, page title bar, and post/archive/singular templates, use **Avada Layouts** and **Layout Sections** (Header Builder / Footer Builder / Mega Menu Builder / Off-Canvas Builder) — not legacy Global Options (Header, Menu, Page Title Bar, Sliding Bar are legacy) and not theme file edits. | Pentru header, footer, page title bar și template-uri post/arhivă/singular, folosește **Avada Layouts** și **Layout Sections** — nu Global Options legacy (Header, Menu, Page Title Bar, Sliding Bar sunt legacy) și nu editarea fișierelor temei. |
| 6 | For colors, typography, spacing defaults, and site-wide look, use **Global Options** (Colors = Global Color Palette, Typography = Global Typography sets) — don't hardcode hex/px per element. | Pentru culori, tipografie, spacing implicit și aspectul general, folosește **Global Options** (Colors = Global Color Palette, Typography = seturi Global Typography) — nu hardcoda hex/px per element. |
| 7 | For mobile behavior, use the **Responsive** system: Large/Medium/Small breakpoints (configurable, never assert default px), Live Responsive Editing, and Responsive Option Sets where the option supports it (Container: Margins/Padding; Column: Column Width/Order/Spacing/Margins/Padding). | Pentru comportament mobil, folosește sistemul **Responsive**: breakpoints Large/Medium/Small (configurabile, nu afirma valori px implicite), Live Responsive Editing și Responsive Option Sets acolo unde opțiunea permite (Container: Margins/Padding; Column: Column Width/Order/Spacing/Margins/Padding). |
| 8 | Use **Avada Form** (Form Builder + the 23 Form Elements) before any 3rd-party form plugin, for contact/lead/quote capture, including GDPR consent (Consent Field, Privacy & Consent element) and spam protection (reCAPTCHA Field, Turnstile Field, Honeypot Field). | Folosește **Avada Form** (Form Builder + cele 23 de elemente Form) înainte de orice plugin extern de formulare, pentru contact/lead/ofertă, inclusiv consimțământ GDPR (Consent Field, elementul Privacy & Consent) și protecție anti-spam (reCAPTCHA Field, Turnstile Field, Honeypot Field). |
| 9 | Use a child theme, hooks, filters, or PHP only for requirements that cannot be met natively — and state explicitly, per requirement, why not. | Folosește child theme, hooks, filters sau PHP doar pentru cerințe care nu pot fi rezolvate nativ — și precizează explicit, pentru fiecare cerință, de ce nu. |
| 10 | Label any element gated by a 3rd-party plugin as "requires `<plugin>`" (Events Calendar, LayerSlider, Slider Revolution, Convert Plus, WooCommerce Design Elements). | Etichetează orice element condiționat de un plugin terț cu "requires `<plugin>`" (Events Calendar, LayerSlider, Slider Revolution, Convert Plus, WooCommerce Design Elements). |
| 11 | For every decision, state which Avada element/option was used and why. | Pentru fiecare decizie, precizează elementul/opțiunea Avada folosită și motivul. |

## What NOT to do / Ce NU trebuie să faci

**EN**
- Do not generate a custom WordPress theme from scratch.
- Do not propose Elementor, Divi, Gutenberg blocks, or external page-builder plugins when Avada can satisfy the requirement.
- Do not write custom CSS for buttons, cards, grids, spacing, or responsive behavior when an Avada setting exists for it.
- Do not hardcode client-facing text in PHP templates when it can be managed inside Avada Builder.
- Do not use custom shortcodes unless explicitly requested.
- Do not recommend editing parent theme files directly — always use a child theme.
- Do not assert specific default responsive breakpoint pixel values — they are user-configurable.
- Do not list specific hook names unless verified against the hooks reference page (avada.com/documentation/avada-hooks-actions-and-filters/); otherwise mark `[verify]`.
- Do not claim Elementor/Divi/Gutenberg interoperability.

**RO**
- Nu genera o temă WordPress custom de la zero.
- Nu propune Elementor, Divi, blocuri Gutenberg sau pluginuri page-builder externe dacă Avada poate rezolva cerința.
- Nu scrie CSS custom pentru butoane, carduri, grile, spacing sau comportament responsive dacă există o setare Avada pentru asta.
- Nu hardcoda text vizibil clientului în template-uri PHP dacă poate fi administrat din Avada Builder.
- Nu folosi shortcode-uri custom decât dacă sunt cerute explicit.
- Nu recomanda modificarea directă a fișierelor temei părinte — folosește întotdeauna un child theme.
- Nu afirma valori px implicite specifice pentru breakpoints — sunt configurabile de utilizator.
- Nu enumera nume de hook-uri specifice decât dacă sunt verificate pe pagina de referință hooks (avada.com/documentation/avada-hooks-actions-and-filters/); altfel marchează `[verify]`.
- Nu afirma interoperabilitate cu Elementor/Divi/Gutenberg.

## 6-step decision order / Ordinea de decizie în 6 pași

**EN** — For every requirement, walk this ladder in order and stop at the first step that satisfies it:

1. **Element** — Is there a native Avada Design/Form/Layout/Inline Element for this? (see chapter 01)
2. **Container / Column** — Can it be achieved via Container, Column, or Nested Columns structure and their options (width, background, spacing, alignment)?
3. **Global / Element Options** — Can it be controlled via Global Options (site-wide) or the element's own Options panel, instead of one-off custom styling?
4. **Library / Global Element** — Is this block reused or reusable? Save to Avada Library (copy, editable independently) or make it a Global Element (syncs everywhere) instead of rebuilding it.
5. **Layout Section** — Does this apply to a template location (header, footer, page title bar, single/archive/search/404 content) rather than one page? Build it as an Avada Layout + Layout Section with Conditions, not a one-off page edit.
6. **Custom code, with written justification** — Only if steps 1–5 all fail, propose child-theme CSS/JS/PHP (or Advanced → Code Fields / Custom CSS in Global Options for site-wide snippets). State explicitly which native option was checked and why it doesn't cover the requirement.

**RO** — Pentru fiecare cerință, parcurge această scară în ordine și oprește-te la primul pas care o satisface:

1. **Element** — Există un Element nativ Avada (Design/Form/Layout/Inline) pentru asta? (vezi capitolul 01)
2. **Container / Column** — Se poate obține prin structura Container, Column sau Nested Columns și opțiunile lor (lățime, fundal, spațiere, aliniere)?
3. **Global / Element Options** — Se poate controla prin Global Options (la nivel de site) sau panoul de Options al elementului, în loc de stilizare custom punctuală?
4. **Library / Global Element** — Blocul este reutilizat sau reutilizabil? Salvează-l în Avada Library (copie, editabilă independent) sau fă-l Global Element (se sincronizează peste tot) în loc să-l reconstruiești.
5. **Layout Section** — Se aplică unei locații de template (header, footer, page title bar, conținut single/arhivă/căutare/404) și nu unei singure pagini? Construiește-l ca Avada Layout + Layout Section cu Conditions, nu ca o editare punctuală de pagină.
6. **Cod custom, cu justificare scrisă** — Doar dacă pașii 1–5 eșuează toți, propune CSS/JS/PHP în child theme (sau Advanced → Code Fields / Custom CSS din Global Options pentru fragmente site-wide). Precizează explicit ce opțiune nativă a fost verificată și de ce nu acoperă cerința.

## Required output per page / Output obligatoriu per pagină

**EN** — For every page, return:

1. Page goal
2. Section structure (ordered list of sections)
3. Container / Column layout per section
4. Native Avada elements used per section
5. Responsive settings — Large / Medium / Small notes (no default px claims)
6. Proposed content (copy, in the client's language where user-facing)
7. Global Options needed (Colors, Typography, Forms, etc.)
8. Library / Global Element reuse recommendations
9. Implementation checklist (buildable steps in Avada Builder)
10. Any justified custom code — what, and why native options were insufficient

**RO** — Pentru fiecare pagină, returnează:

1. Scopul paginii
2. Structura secțiunilor (listă ordonată)
3. Layout Container / Column per secțiune
4. Elementele native Avada folosite per secțiune
5. Setări responsive — note Large / Medium / Small (fără valori px implicite)
6. Conținutul text propus (copy, în limba clientului acolo unde e vizibil publicului)
7. Global Options necesare (Colors, Typography, Forms etc.)
8. Recomandări de reutilizare Library / Global Element
9. Checklist de implementare (pași realizabili în Avada Builder)
10. Orice cod custom justificat — ce anume, și de ce opțiunile native nu au fost suficiente

## Recommended response format / Format recomandat de răspuns

**EN** — Use Page → Section blocks:

```
### Page: [Page name]

#### Section 1: [Section name]
- Goal:
- Container settings:
- Columns:
- Native Avada elements:
- Content:
- Responsive notes (Large / Medium / Small):
- Reusable/global? (Library / Global Element):

#### Section 2: [Section name]
...

#### Global Options required
- ...

#### Implementation checklist
- [ ] Create page
- [ ] Add container
- [ ] Configure columns
- [ ] Add native elements
- [ ] Set responsive behavior
- [ ] Save recurring sections to Library / Global Elements

#### Custom code (if any)
- What: ...
- Why native options were insufficient: ...
```

**RO** — Folosește blocuri Page → Section:

```
### Pagina: [Nume pagină]

#### Secțiunea 1: [Nume secțiune]
- Scop:
- Setări Container:
- Columns:
- Elemente native Avada:
- Conținut:
- Note responsive (Large / Medium / Small):
- Reutilizabil/global? (Library / Global Element):

#### Secțiunea 2: [Nume secțiune]
...

#### Global Options necesare
- ...

#### Checklist de implementare
- [ ] Creează pagina
- [ ] Adaugă container
- [ ] Configurează coloanele
- [ ] Adaugă elementele native
- [ ] Setează comportamentul responsive
- [ ] Salvează secțiunile recurente în Library / Global Elements

#### Cod custom (dacă e cazul)
- Ce anume: ...
- De ce opțiunile native nu au fost suficiente: ...
```
