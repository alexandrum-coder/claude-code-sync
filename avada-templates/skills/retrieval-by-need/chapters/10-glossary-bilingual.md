---
id: "10"
title_en: Bilingual Glossary
title_ro: Glosar bilingv
load_when_en: You need EN<->RO terminology mapping, or rules for a bilingual (English UI, Romanian body) build.
load_when_ro: Ai nevoie de corespondența termenilor EN<->RO sau reguli pentru un proiect bilingv.
task_types: [global-styling-branding, translation-bilingual]
depends_on: []
---

# 10 — Bilingual Glossary

> This chapter is bilingual by nature — English terms are the WordPress/Avada UI reality; Romanian is the client-facing usage layer. Source: `research-notes.md` §10, expanded.

## 1. Language rule (read this first)

**EN** — The **WordPress admin and every Avada element/option name stays in English**, even on a project for a Romanian client. Never translate an element name ("Container" does not become "Container/Secțiune" *in the builder* — that RO term is for talking about it, not for renaming it in the UI). What changes language is the **client-facing body copy**: headings, paragraphs, CTA labels, and form labels, written in the client's language (usually Romanian).

**RO** — **Interfața WordPress și fiecare nume de element/opțiune Avada rămân în engleză**, chiar și pe un proiect pentru un client român. Nu traduce niciodată numele unui element ("Container" nu devine "Container/Secțiune" *în builder* — termenul RO e pentru a vorbi despre el, nu pentru a-l redenumi în interfață). Ce se schimbă ca limbă este **textul vizibil clientului**: titluri, paragrafe, texte CTA și etichete de formular, scrise în limba clientului (de regulă română).

## 2. EN → RO term table — structural terms

| EN (Avada UI — keep exact) | RO usage term | Note |
|---|---|---|
| Container | Container / Secțiune | Secțiunea majoră care încadrează o parte a paginii |
| Column | Coloană | Diviziune de conținut în interiorul unui Container |
| Nested Columns | Coloane imbricate | Layout intern în interiorul unei coloane |
| Element | Element | Termen generic pentru orice bloc din Avada Builder |
| Layout Section | Secțiune de layout | Header/Footer/Page Title Bar/Content — vezi capitolul 09 |
| Avada Layouts | Layout-uri Avada | Șabloane la nivel de site asignate prin Conditions |
| Avada Library | Bibliotecă Avada | Elemente/layout-uri salvate, reutilizabile |
| Global Element | Element global | Element salvat care se sincronizează peste tot |
| Global Options | Opțiuni globale | Setări la nivel de site |

## 3. EN → RO term table — common Design Elements

| EN (Avada UI — keep exact) | RO usage term | Short RO note |
|---|---|---|
| Title | Titlu (H1–H6) | Nivelul de titlu contează pentru SEO — vezi capitolul 08 |
| Text Block | Bloc de text | Paragrafe, text formatat |
| Button | Buton / CTA | Text acțiune scurt, orientat spre verb |
| Icon | Pictogramă | Simbol vizual, adesea în perechi cu text |
| Content Boxes | Casete de conținut | Carduri de servicii/beneficii, icon + titlu + text |
| Flip Boxes | Casete rotative | Card cu efect de întoarcere (față/verso) |
| Checklist | Listă cu bife | Listă de beneficii/pași cu bifă vizuală |
| Separator | Separator | Linie/spațiu de separare vizuală |
| Section Separator | Separator de secțiune | Forme/valuri decorative între secțiuni |
| Counter Boxes | Contoare / Cifre-cheie | Statistici animate (ex. "500+ clienți") |
| Counter Circles | Contoare circulare | Variantă circulară a Counter Boxes |
| Testimonials | Testimoniale | Recenzii/mărturii de clienți |
| Person | Membru echipă | Card individual pentru o persoană (echipă, autor) |
| Tabs | File / Taburi | Conținut împărțit pe file navigabile |
| Toggles | Acordeon | Accordion generic — NU folosi pentru FAQ (vezi FAQ Element) |
| FAQ (element) | Întrebări frecvente | Element dedicat Q&A, schema-friendly — vezi capitolul 08 |
| Modal | Fereastră modală / popup | Conținut suprapus, declanșat de o acțiune |
| Gallery | Galerie | Grilă de imagini |
| Image Carousel | Carusel imagini | Imagini derulabile |
| Image | Imagine | Element individual de imagine, cu alt text |
| Video | Video | Element video (fișier sau embed) |
| Google Map | Hartă Google | Hartă interactivă |
| Social Links | Rețele sociale | Iconițe/linkuri către profiluri sociale |
| Social Sharing | Distribuire socială | Butoane de distribuire a paginii |
| Avada Form | Formular Avada | Formular construit cu Form Builder — vezi capitolul 05 |
| Pricing Table | Tabel de prețuri | Prezentare planuri/pachete de preț |
| Progress Bar | Bară de progres | Bară animată (ex. nivel de competență) |
| Blog | Element blog | Listare articole de blog |
| Portfolio | Portofoliu | Listare proiecte/lucrări |
| Post Cards | Carduri articole | Variantă tip card pentru listare articole |
| Table Of Contents | Cuprins | Navigare internă pentru pagini lungi — vezi capitolul 08 |
| Breadcrumbs | Fir de ariadnă / breadcrumb | Navigare ierarhică — vezi capitolul 08 |
| Table | Tabel | Date tabulare structurate |
| Alert | Alertă / mesaj de notificare | Mesaj evidențiat (info, atenție, succes) |
| Countdown | Cronometru retroactiv | Numărătoare inversă (ex. ofertă limitată) |
| Tagline Box | Casetă de slogan | Bloc scurt evidențiat, adesea cu CTA |

## 4. EN → RO term table — Global Options terms

| EN (Avada UI — keep exact) | RO usage term | Short RO note |
|---|---|---|
| Colors (panel) | Culori | Paleta globală de culori + culoarea primară |
| Global Color Palette | Paleta globală de culori | Set de culori reutilizat în tot site-ul |
| Typography (panel) | Tipografie | Seturi tipografice globale, Body, Headings H1–H6 |
| Layout (panel) | Layout | Lățime site, structură generală |
| Responsive (panel) | Responsive | Breakpoints Large/Medium/Small — vezi capitolul 04 |
| Header (legacy panel) | Header (legacy) | Înlocuit de Avada Layouts — vezi capitolul 09 |
| Footer (panel) | Footer | Setări footer — modern: Layout Section |
| Page Title Bar (legacy panel) | Bara de titlu a paginii (legacy) | Înlocuită de Avada Layouts |
| Forms (panel) | Formulare | Stilizare formular, integrări Mailchimp/HubSpot |
| Privacy (panel) | Confidențialitate | Bară de consimțământ, mod local Google Fonts |
| Advanced → Code Fields | Avansat → Câmpuri de cod | Cod de tracking/JS — vezi capitolul 07 |
| Custom CSS (panel) | CSS custom | CSS la nivel de site — ultimă soluție, vezi capitolul 07 |
| Performance (panel) | Performanță | Dynamic CSS/JS, opțiuni PWA |
| Import/Export (panel) | Import/Export | Migrare setări Global Options ca JSON |

## 5. Client-facing copy examples — CTAs

**EN** — Common Romanian CTA button labels (use as a starting bank, adapt tone per client/industry):

| RO CTA label | EN meaning | When to use |
|---|---|---|
| Cere ofertă | Request a quote | Service/B2B pages, primary conversion action |
| Programează o discuție | Schedule a call/consultation | Consultative sales, discovery-call funnels |
| Vezi servicii | See services | Secondary navigation CTA, homepage → services page |
| Contactează-ne | Contact us | Generic contact CTA, footer/header |
| Solicită o demonstrație | Request a demo | SaaS/product pages |
| Descarcă ghidul | Download the guide | Lead-magnet/content offer |
| Sună acum | Call now | Local business, urgency-driven mobile CTA |
| Trimite mesajul | Send message | Form submit button label |
| Vezi portofoliul | See portfolio | Creative/agency sites |
| Rezervă acum | Book now | Appointment/reservation-based businesses |

**RO** — Exemple de etichete CTA folosite frecvent (folosește ca bancă de start, adaptează tonul per client/industrie) — vezi tabelul de mai sus.

## 6. Client-facing copy examples — form labels

**EN** — Common Romanian form field labels:

| RO label | EN meaning |
|---|---|
| Nume | Name |
| Nume și prenume | Full name |
| Adresă de email | Email address |
| Număr de telefon | Phone number |
| Companie | Company |
| Mesaj | Message |
| Subiect | Subject |
| Cum te putem ajuta? | How can we help you? |
| Sunt de acord cu Politica de confidențialitate | I agree to the Privacy Policy (Consent Field label) |
| Trimite | Submit |

**RO** — Etichete de câmp folosite frecvent — vezi tabelul de mai sus. Folosește-le ca punct de plecare pentru elementele Form (capitolul 05): Text Field, Email Field, Phone Number Field, Textarea Field, Consent Field, Submit/Button.

## 7. Multilingual sites (WPML/Polylang) — scope note

**EN** — This glossary and the bilingual language rule (element names EN, body copy in client's language) apply to a **single-language-per-deployment** build where the WordPress admin is English and the site content is Romanian. If the project requires a genuinely **multilingual site** (two or more live front-end language versions, language switcher, translated URLs), that is handled by a multilingual plugin — **WPML or Polylang**. Avada is compatible with this pattern, but **the plugin performs the translation/URL/hreflang mechanics, not Avada itself**. Specific integration behavior (how Avada Layouts, Global Elements, and Library items behave per language, hreflang setup, URL structure) is `[verify]` — not confirmed in research-notes.md. Confirm against the plugin's own Avada-compatibility documentation before committing to a multilingual architecture.

**RO** — Acest glosar și regula de limbă bilingvă (nume de elemente EN, text în limba clientului) se aplică unui build **cu o singură limbă per deployment**, unde interfața WordPress e engleză, iar conținutul site-ului e română. Dacă proiectul cere un site **cu adevărat multilingv** (două sau mai multe versiuni de limbă live pe front-end, selector de limbă, URL-uri traduse), aceasta se rezolvă printr-un plugin multilingv — **WPML sau Polylang**. Avada este compatibil cu acest tipar, dar **plugin-ul realizează mecanica de traducere/URL/hreflang, nu Avada în sine**. Comportamentul specific de integrare (cum se comportă Avada Layouts, Global Elements și elementele din Library per limbă, configurarea hreflang, structura URL) este `[verify]` — nu e confirmat în research-notes.md. Confirmă în documentația de compatibilitate Avada a plugin-ului respectiv înainte de a angaja o arhitectură multilingvă.

## Source
- Glossary seed: `research-notes.md` §10.
- Element names cross-checked against `research-notes.md` §1 (element catalog) and chapter `01`.
- Multilingual (WPML/Polylang) integration specifics: `[verify]` — not in research-notes.md; confirm against the plugin's own documentation.
