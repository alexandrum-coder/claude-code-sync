---
id: "04"
title_en: Responsive Rules
title_ro: Reguli responsive
load_when_en: You need desktop/tablet/mobile behavior — breakpoints, responsive option sets, column stacking/order, responsive typography.
load_when_ro: Ai nevoie de comportament desktop/tabletă/mobil — breakpoints, seturi responsive, ordinea coloanelor.
task_types: [new-page, landing-lead-gen, rebuild-audit-page, global-styling-branding, responsive-mobile]
depends_on: ["03"]
---

# 04 — Responsive Rules / Reguli responsive

## Rule / Regulă
EN: Build every section responsive using **native Avada responsive controls** — never with custom media-query CSS as the default path. Think Desktop → Tablet → Mobile for every Container/Column/Element before shipping a page.
RO: Construiește fiecare secțiune responsive folosind **controalele native Avada** — nu cu CSS custom pe media queries ca soluție implicită. Gândește Desktop → Tabletă → Mobil pentru fiecare Container/Column/Element înainte de a livra o pagină.

## The three breakpoints / Cele trei breakpoints
EN: Avada names three responsive sizes: **Large** (desktop), **Medium** (tablet), **Small** (phone). Pixel values for each breakpoint are **configurable, set by the user** at **Avada → Options → Responsive → Element Responsive Breakpoints**. Do **not** state or assume specific default pixel values — always say "configurable" and check the live project setting when it matters.
RO: Avada denumește trei dimensiuni responsive: **Large** (desktop), **Medium** (tabletă), **Small** (telefon). Valorile în pixeli pentru fiecare breakpoint sunt **configurabile, setate de utilizator** în **Avada → Options → Responsive → Element Responsive Breakpoints**. **Nu** afirma sau presupune valori implicite în pixeli — spune mereu "configurabil" și verifică setarea reală a proiectului când contează.

## Live Responsive Editing
EN: While editing with Avada Builder, use the **Responsive icon** in the toolbar to preview the page at each breakpoint and edit options **per size, live**. This is the primary native workflow for responsive work — not a separate CSS pass.
RO: În timpul editării cu Avada Builder, folosește **iconița Responsive** din toolbar pentru a previzualiza pagina la fiecare breakpoint și a edita opțiuni **per dimensiune, live**. Acesta e fluxul nativ principal pentru lucrul responsive — nu un pas separat de CSS.

## Responsive Option Sets
EN: By default, option values **cascade** Large → Medium → Small (a value set on Large applies to Medium/Small unless overridden). **Responsive Option Sets** break that cascade so you can edit a size independently.

- **Container**: only **Margins** and **Padding** are per-size (Option Set).
- **Column**: **Column Width, Column Order, Column Spacing, Margins, Padding** are per-size (Option Set).

RO: Implicit, valorile opțiunilor **se propagă în cascadă** Large → Medium → Small (o valoare setată pe Large se aplică și pe Medium/Small dacă nu e suprascrisă). **Responsive Option Sets** rupe această cascadă, permițând editarea independentă pe fiecare dimensiune.

- **Container**: doar **Margins** și **Padding** sunt per-dimensiune (Option Set).
- **Column**: **Column Width, Column Order, Column Spacing, Margins, Padding** sunt per-dimensiune (Option Set).

| Element | Per-size (Option Set) properties |
|---|---|
| Container | Margins, Padding |
| Column | Column Width, Column Order, Column Spacing, Margins, Padding |

## Default column behavior / Comportament implicit coloane
EN: Configured globally at **Avada → Avada Builder Elements → Column**:
- **Medium inherits Large** by default.
- **Small goes Full Width** by default.
- Both are **configurable** at that same location — override per-project if the design needs a different default.

RO: Configurat global în **Avada → Avada Builder Elements → Column**:
- **Medium moștenește Large** implicit.
- **Small devine Full Width (lățime completă)** implicit.
- Ambele sunt **configurabile** în aceeași locație — suprascrie per proiect dacă design-ul cere alt implicit.

## Responsive Typography
EN: Two global controls in **Global Options → Responsive**:
- **Responsive Typography Sensitivity** — a scaling factor for how much font sizes shrink between breakpoints (`0` = off, no automatic scaling).
- **Minimum Font Size Factor** — a floor so text doesn't shrink below a usable size on small screens.

Use these before manually setting a different font size per breakpoint on every heading.

RO: Două controale globale în **Global Options → Responsive**:
- **Responsive Typography Sensitivity** — un factor de scalare pentru cât se micșorează fonturile între breakpoints (`0` = dezactivat, fără scalare automată).
- **Minimum Font Size Factor** — un prag minim ca textul să nu devină ilizibil pe ecrane mici.

Folosește-le înainte de a seta manual o dimensiune de font diferită per breakpoint la fiecare titlu.

## Per-element visibility per size / Vizibilitate per element, per dimensiune
EN: Every Container, Column, and most Elements expose a **visibility** control per breakpoint (show/hide on Large/Medium/Small). Use this to hide purely decorative elements on Small instead of forcing them to render and then hiding via CSS.
RO: Fiecare Container, Column și majoritatea Elementelor expun un control de **vizibilitate** per breakpoint (afișare/ascundere pe Large/Medium/Small). Folosește-l pentru a ascunde elementele pur decorative pe Small, în loc să le forțezi să se randeze și să le ascunzi prin CSS.

## Practical mobile checklist / Checklist practic pentru mobil
For every section, before calling it done / Pentru fiecare secțiune, înainte de a o considera finalizată:

| Check (EN) | Verificare (RO) |
|---|---|
| Column order makes sense on Small (use Column Order Option Set if content order should differ from visual desktop order) | Ordinea coloanelor are sens pe Small (folosește Column Order dacă ordinea conținutului trebuie să difere de ordinea vizuală desktop) |
| Title/heading sizes are legible, not oversized, on Small (Responsive Typography or per-size override) | Dimensiunile titlurilor sunt lizibile, nu supradimensionate, pe Small |
| Vertical spacing (Container/Column Margins & Padding Option Set) is reduced where desktop spacing feels excessive | Spațierea verticală (Margins & Padding) e redusă acolo unde spațierea desktop pare excesivă |
| Images/hero visuals are sized appropriately for Small (not forcing desktop crop/scale) | Imaginile/vizualul din hero sunt dimensionate corect pentru Small |
| Purely decorative elements are hidden on Small via visibility controls, not left to load and hide by CSS | Elementele pur decorative sunt ascunse pe Small prin controalele native de vizibilitate |
| Primary CTA remains visible and easily tappable at every breakpoint | CTA-ul principal rămâne vizibil și ușor de apăsat la fiecare breakpoint |
| Column Width/Spacing reviewed per size, not left to silently inherit when a different look is needed | Column Width/Spacing verificate per dimensiune, nu lăsate să moștenească tacit când e nevoie de alt aspect |

## SEO note / Notă SEO
EN: Google indexes using the **mobile version of the page** (mobile-first indexing). Correct, complete mobile behavior is therefore an SEO factor, not just a UX nicety — verify content parity and legibility on Small, not only that it "doesn't break."
RO: Google indexează folosind **versiunea mobilă a paginii** (mobile-first indexing). Comportamentul mobil corect și complet este deci un factor SEO, nu doar o chestiune de UX — verifică paritatea conținutului și lizibilitatea pe Small, nu doar că "nu se strică".

## RO — Rezumat rapid
Trei breakpoints: Large/Medium/Small, valori în px configurabile (nu presupune valori implicite). Editează live cu iconița Responsive. Opțiunile fac cascadă Large→Medium→Small implicit; Responsive Option Sets rupe cascada (Container: Margins+Padding; Column: Width, Order, Spacing, Margins, Padding). Implicit: Medium moștenește Large, Small devine Full Width — configurabil în Avada → Avada Builder Elements → Column. Tipografie responsive: Sensitivity + Minimum Font Size Factor. Fiecare element are vizibilitate per breakpoint. Mobil corect = factor SEO (mobile-first indexing Google).
