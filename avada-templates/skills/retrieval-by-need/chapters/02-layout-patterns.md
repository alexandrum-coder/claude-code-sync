---
id: "02"
title_en: Page Layout Patterns
title_ro: Modele de layout pentru pagini
load_when_en: You need a section-by-section blueprint for a page type.
load_when_ro: Ai nevoie de o structură pe secțiuni pentru un tip de pagină.
task_types: [new-page, landing-lead-gen, seo-aeo-schema]
depends_on: ["01"]
---

# 02 — Page Layout Patterns

> Blueprints below name sections in recommended order, plus the Avada implementation (Container type, Columns, native Elements). Element names reference chapter 01. Do not invent elements outside chapter 01's catalog. Anything not covered there (e.g., exact Layout Section condition names) is deferred to chapter 09 and marked `[verify]` where relevant.

## Universal rules for all pages / Reguli universale pentru toate paginile

**EN**
- One **H1** per page (Title element). Use **H2** for section headings, hierarchical below.
- Keep a CTA (Button or Avada Form) visible in the hero and again at the end of the page.
- Save recurring blocks (CTA bands, service cards, testimonial blocks, headers/footers) to **Avada Library**; make site-wide-identical blocks **Global Elements**.
- Mobile: control column order, spacing, and title sizes explicitly for **Small** (and **Medium** where needed) via Responsive Option Sets — don't assume desktop layout degrades acceptably.
- Limit animations — use sparingly, prioritize clarity and performance over motion.
- Every section is a **Container**; every content split inside it is **Columns** (or **Nested Columns** for cards).

**RO**
- Un singur **H1** per pagină (elementul Title). Folosește **H2** pentru titlurile de secțiune, ierarhic mai jos.
- Păstrează un CTA (Button sau Avada Form) vizibil în hero și din nou la finalul paginii.
- Salvează blocurile recurente (benzi CTA, carduri de servicii, blocuri testimoniale, header/footer) în **Avada Library**; fă **Global Elements** din blocurile identice pe tot site-ul.
- Mobil: controlează explicit ordinea coloanelor, spațierea și dimensiunea titlurilor pentru **Small** (și **Medium** unde e nevoie) prin Responsive Option Sets — nu presupune că layout-ul desktop degradează acceptabil.
- Limitează animațiile — folosește-le cu moderație, prioritizează claritatea și performanța.
- Fiecare secțiune este un **Container**; fiecare împărțire de conținut din interior este **Columns** (sau **Nested Columns** pentru carduri).

---

## 1. B2B / Services landing page / Landing B2B / servicii

### Recommended sections
1. Hero
2. Trust bar / client logos
3. Customer pain points
4. Offered solution
5. Services / capabilities
6. Process / how it works
7. Case studies / results
8. Testimonials
9. FAQ
10. Final CTA / form

### Avada implementation

| Section | Container | Columns | Native elements |
|---|---|---|---|
| Hero | Full-width or boxed, background color/image | 2 Columns: text + visual | Title (H1), Text Block, Button (primary) + Button (secondary), Checklist or Content Boxes (short benefits) |
| Trust bar | Boxed, light background | 1 Column | Image Carousel (client logos) |
| Pain points | Boxed | 2–3 Columns | Title (H2), Text Block per pain point, Icon |
| Solution | Boxed | 2 Columns: text + visual | Title (H2), Text Block, Checklist |
| Services | Boxed | 3–4 Columns | Title (H2), Text Block (intro), Content Boxes per service |
| Process | Boxed | 3–5 Columns | Content Boxes or Counter Boxes (step numbers) + Title + Text Block per step |
| Case studies | Boxed | Columns or Post Cards grid | Title (H2), Post Cards or Portfolio |
| Testimonials | Boxed, contrast background | 1 Column | Testimonials |
| FAQ | Boxed | 1 Column | Title (H2), FAQ Element (or Toggles) |
| Final CTA | Full-width, contrast background | 1–2 Columns | Title, Text Block, Button or Avada Form |

---

## 2. Corporate multi-page site / Website corporate

### Recommended pages
Home, About, Services, Service Detail (template), Case Studies, Blog/Resources, Contact.

### Avada implementation

| Element/pattern | Implementation |
|---|---|
| Global header | Avada Layout → Header Section (Header Builder), reused via Conditions across all pages |
| Global footer | Avada Layout → Footer Section (Footer Builder) |
| Service Detail template | Avada Layout (Content Section) assigned by Condition to the Services post type/CPT, built with Layout Elements (Content, Post Meta, Related Posts) |
| Global CTA band | Avada Library → Global Element, reused on Home/Services/Contact |
| Service cards | Avada Library element (Content Boxes pattern), reused across Home/Services |
| Testimonial block | Avada Library element (Testimonials pattern) |
| Home | Hero (Container + Columns: Title, Text Block, Button, Image) → Services overview (Columns + Content Boxes) → Case study highlights (Post Cards) → Testimonials → CTA |
| About | Hero → Team (Person elements in Columns) → Company story (Text Block + Image) → Values (Content Boxes) → CTA |
| Contact | Container 2 Columns: Avada Form (with Consent Field) + Google Map or Open Street Map |

---

## 3. Local business home / Website local business

### Recommended sections
1. Hero with clear offer
2. Main services
3. Why us
4. Gallery / results
5. Reviews
6. Service area / location
7. Quick contact

### Avada implementation

| Section | Container | Columns | Native elements |
|---|---|---|---|
| Hero | Full-width, background image | 1–2 Columns | Title (H1), Text Block, Button, Image |
| Services | Boxed | 2–4 Columns | Content Boxes (Icon/Image + Title + Text) |
| Why us | Boxed | 3 Columns | Icon, Title, Text Block per differentiator, or Checklist |
| Gallery / results | Boxed | 1 Column | Gallery (or Image Before & After for renovation/results-type work) |
| Reviews | Boxed | 1 Column | Testimonials (+ Star Rating) |
| Service area / location | Boxed | 2 Columns | Google Map or Open Street Map + Text Block |
| Quick contact | Full-width or boxed, contrast background | 1–2 Columns | Avada Form |

---

## 4. Portfolio / photography site / Website portofoliu / fotografie

### Recommended sections
1. Visual hero
2. Service categories
3. Curated gallery
4. Story / style
5. Packages
6. Testimonials
7. Booking CTA

### Avada implementation

| Section | Container | Columns | Native elements |
|---|---|---|---|
| Hero | Full-width, background image/video | 1 Column | Title, Button (minimal text — visual-led) |
| Categories | Boxed | Columns per category | Image + Title + Text Block per card |
| Gallery | Full-width or boxed | 1 Column | Gallery, or Image Carousel/Media Slider for rotation |
| Story / style | Boxed | 2 Columns: text + image | Title (H2), Text Block, Image |
| Packages | Boxed | 2–3 Columns | Pricing Table (native — no hedging) |
| Testimonials | Boxed | 1 Column | Testimonials |
| Booking CTA | Full-width, contrast background | 1 Column | Avada Form, or Button linking to external booking/calendar |

---

## 5. SaaS / software home / Website SaaS / software

### Recommended sections
1. Hero with clear promise
2. Pain points
3. Product / features
4. Use cases
5. Integrations
6. Security / trust
7. Pricing / request demo
8. FAQ
9. Final CTA

### Avada implementation

| Section | Container | Columns | Native elements |
|---|---|---|---|
| Hero | Full-width or boxed | 2 Columns: text + product visual | Title (H1), Text Block, Button (primary CTA: trial/demo) |
| Pain points | Boxed | 2–3 Columns | Icon, Title, Text Block |
| Features | Boxed | 3–4 Columns | Content Boxes (Icon + Title + Text) |
| Use cases | Boxed | Tabs, or Columns of cards | Tabs (for comparing categories) or Content Boxes |
| Integrations | Boxed | Columns grid | Image (logo grid) or Image Carousel |
| Security / trust | Boxed | 2–3 Columns | Icon, Title, Text Block, Checklist |
| Pricing | Boxed | 2–3 Columns | Pricing Table; Button per plan → Avada Form for demo request |
| FAQ | Boxed | 1 Column | FAQ Element (schema-friendly) or Toggles |
| Final CTA | Full-width, contrast background | 1–2 Columns | Title, Text Block, Avada Form or Button |

---

## 6. E-commerce home / Home e-commerce

> Product/shop/cart/checkout templates themselves are built via the **Avada WooCommerce Builder** (Avada Layouts + the 38 WooCommerce Elements) — see chapter 06. This blueprint covers the **shop home page**, which is a normal Avada page, not a Woo template.

### Recommended sections
1. Hero / seasonal promo
2. Featured categories
3. Featured / bestselling products
4. Value propositions (shipping, returns, support)
5. Reviews / social proof
6. Newsletter / lead capture
7. Recently viewed or related content (optional)

### Avada implementation

| Section | Container | Columns | Native elements |
|---|---|---|---|
| Hero / promo | Full-width, background image | 1–2 Columns | Title, Text Block, Button (→ shop/category) |
| Featured categories | Boxed | 3–4 Columns | Image + Title per category (link to category archive) |
| Featured products | Boxed | 1 Column | Featured Products Slider (requires WooCommerce) or Product Carousel (requires WooCommerce) |
| Value props | Boxed | 3–4 Columns | Icon, Title, Text Block (shipping, returns, support, payment security) |
| Reviews | Boxed | 1 Column | Testimonials (+ Star Rating) |
| Newsletter / lead capture | Boxed, contrast background | 1 Column | Avada Form (+ Consent Field), Mailchimp/HubSpot integration via Global Options → Forms |
| Recently viewed / related | Boxed | 1 Column | Recent Posts / Related Products (requires WooCommerce, typically Layout-driven on product pages) |

**Rule:** for shop/single-product/cart/checkout page templates, do not rebuild them as normal pages — use Avada Layouts + WooCommerce Elements per chapter 06, and avoid overriding WooCommerce PHP templates in a child theme unless a requirement genuinely cannot be met natively.

---

## RO — Modele de layout pe scurt

**Reguli universale:** un H1 per pagină, H2 pentru secțiuni, CTA vizibil în hero și la final, salvează blocurile recurente în Library/Global Elements, controlează explicit mobilul (ordine coloane, spacing, dimensiune titluri), limitează animațiile. Fiecare secțiune = Container; fiecare împărțire = Columns/Nested Columns.

**1. Landing B2B/servicii:** Hero → Trust bar (logo-uri) → Probleme client → Soluție → Servicii → Proces → Studii de caz → Testimoniale → FAQ → CTA final. Implementare: Container per secțiune, 2-4 Columns, Content Boxes pentru servicii/proces, Testimonials pentru dovadă socială, FAQ Element/Toggles pentru FAQ, Avada Form pentru CTA final.

**2. Website corporate:** Home, About, Services, Service Detail (template), Case Studies, Blog/Resources, Contact. Header/footer = Avada Layouts (Header/Footer Section) reutilizate prin Conditions. Service Detail = Avada Layout (Content Section) pe CPT-ul Services. CTA global, carduri servicii, bloc testimoniale = Avada Library/Global Elements.

**3. Website local business:** Hero cu ofertă clară → Servicii principale → De ce noi → Galerie/rezultate → Recenzii → Zonă deservită/locație → Contact rapid. Implementare: Content Boxes pentru servicii, Testimonials + Star Rating pentru recenzii, Google Map/Open Street Map pentru locație, Avada Form pentru contact.

**4. Website portofoliu/fotografie:** Hero vizual → Categorii servicii → Galerie selectată → Poveste/stil → Pachete → Testimoniale → CTA booking. Implementare: Gallery/Image Carousel pentru portofoliu, Pricing Table pentru pachete (element nativ, fără ezitare), Avada Form sau Button către calendar pentru booking.

**5. Website SaaS/software:** Hero cu promisiune clară → Pain points → Produs/features → Use cases → Integrări → Securitate/încredere → Pricing/demo → FAQ → CTA final. Implementare: Content Boxes pentru features, Tabs pentru use cases, Pricing Table pentru planuri, FAQ Element/Toggles pentru FAQ, Avada Form pentru cererea de demo.

**6. Home e-commerce:** Hero/promo sezonier → Categorii recomandate → Produse recomandate/bestseller → Argumente de valoare (livrare, retur, suport) → Recenzii → Newsletter/captare lead → Conținut recomandat/vizualizat recent. Notă: template-urile shop/produs/coș/checkout se construiesc separat prin Avada WooCommerce Builder (Avada Layouts + cele 38 elemente WooCommerce) — vezi capitolul 06; nu le reconstrui ca pagini normale.
