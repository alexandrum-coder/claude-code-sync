---
id: "09"
title_en: Library, Layouts & Reuse
title_ro: Bibliotecă, Layouts și reutilizare
load_when_en: You need reusable/global blocks or site-wide templates — Avada Library, Global Elements, Avada Layouts & Layout Sections, conditions.
load_when_ro: Ai nevoie de blocuri reutilizabile/globale sau șabloane de site — Bibliotecă, Global Elements, Avada Layouts.
task_types: [new-page, header-footer-layouts, woocommerce-shop]
depends_on: ["01", "03"]
---

# 09 — Library, Layouts & Reuse

> Load this chapter for reusable blocks (Library / Global Elements) or site-wide template locations (Avada Layouts / Layout Sections). Depends on chapter `01` (elements catalog) and `03` (Global Options).

## 1. Avada Library

**EN** — The **Avada Library** stores reusable **Containers, Columns, Elements, and full page layouts** as saved items you can insert into any page. Source: https://avada.com/documentation/how-to-use-the-avada-builder-library/.

- A Library item, once inserted into a page, becomes an **independent copy** — editing the copy on one page does not change the copy on another page, and does not change the saved Library item unless you explicitly re-save it.
- Use the Library for anything you build once and want to **reuse as a starting point**, but expect to tweak per instance (a service card that gets different copy per page, a CTA band with different offer text per page).
- Save to Library **before** duplicating a section by hand across pages — hand-duplication drifts out of sync over time; a Library item at least gives every instance the same starting structure.

**RO** — **Avada Library** stochează **Containers, Columns, Elements și layout-uri complete de pagină** reutilizabile, ca elemente salvate pe care le poți insera în orice pagină. Sursă: https://avada.com/documentation/how-to-use-the-avada-builder-library/.

- Un element din Library, odată inserat într-o pagină, devine o **copie independentă** — editarea copiei pe o pagină nu modifică copia de pe altă pagină și nu modifică elementul salvat în Library decât dacă îl re-salvezi explicit.
- Folosește Library pentru orice construiești o dată și vrei să **reutilizezi ca punct de plecare**, dar te aștepți să ajustezi per instanță (un card de serviciu cu text diferit per pagină, o bandă CTA cu ofertă diferită per pagină).
- Salvează în Library **înainte** de a duplica manual o secțiune pe mai multe pagini — duplicarea manuală se dezaliniază în timp; un element din Library dă măcar aceeași structură de pornire fiecărei instanțe.

## 2. Global Elements

**EN** — A **Global Element** is a saved element that **stays in sync everywhere it's used**: editing the Global Element once updates every instance across the site. Contrast with a normal Library element, which is copied and edited independently per instance.

- Use a Global Element for blocks that must remain **identical everywhere**, with no per-page variation intended — a site-wide header CTA button, a footer contact block, a cookie/consent notice, a promo bar.
- Do **not** use a Global Element for anything that needs different copy or settings per page — that will fight the sync behavior. Use a normal Library element instead.
- Rule of thumb: ask "if I change this next month, do I want it to change on every page at once, or just this one?" — "every page at once" → Global Element; "just this one" → Library element (or no saved item at all).

**RO** — Un **Global Element** este un element salvat care **rămâne sincronizat peste tot unde e folosit**: editarea Global Element-ului o dată actualizează fiecare instanță de pe site. În contrast cu un element normal din Library, care este copiat și editat independent per instanță.

- Folosește un Global Element pentru blocuri care trebuie să rămână **identice peste tot**, fără variație per pagină intenționată — un buton CTA de header la nivel de site, un bloc de contact din footer, o notificare cookie/consimțământ, o bară de promoție.
- **Nu** folosi un Global Element pentru ceva ce are nevoie de text sau setări diferite per pagină — asta se va opune comportamentului de sincronizare. Folosește în schimb un element normal din Library.
- Regulă practică: întreabă-te "dacă modific asta luna viitoare, vreau să se schimbe pe toate paginile deodată, sau doar pe aceasta?" — "pe toate deodată" → Global Element; "doar pe aceasta" → element din Library (sau deloc salvat).

## 3. Library vs Global Element — decision table

**EN**

| Block | Typically | Why |
|---|---|---|
| CTA band ("Get a quote" section repeated across service pages, different offer text per page) | **Library** | Same structure, different copy per page — needs independent editing |
| Service card (Content Boxes / Flip Boxes grid item) | **Library** | Reused as a template per service, content differs each time |
| Testimonial block | **Library** (or Global Element only if it is the *same* testimonial shown site-wide, e.g., in a sidebar) | Usually content varies by page/context |
| Header | **Layout Section** (not Library, not Global Element — see §4) | Header is a template location, not a content block |
| Footer | **Layout Section** (not Library, not Global Element — see §4) | Same reasoning as header |
| Cookie/consent bar, site-wide promo bar | **Global Element** | Must be identical and update everywhere at once |
| Pricing Table with site-wide identical pricing shown on multiple pages | **Global Element** | Price changes must propagate everywhere instantly, with no drift risk |

**RO**

| Bloc | De regulă | De ce |
|---|---|---|
| Bandă CTA ("Cere ofertă" repetată pe paginile de servicii, text de ofertă diferit per pagină) | **Library** | Aceeași structură, text diferit per pagină — are nevoie de editare independentă |
| Card de serviciu (element din grila Content Boxes / Flip Boxes) | **Library** | Reutilizat ca șablon per serviciu, conținutul diferă de fiecare dată |
| Bloc testimonial | **Library** (sau Global Element doar dacă e *același* testimonial afișat la nivel de site, ex. în sidebar) | De regulă conținutul variază per pagină/context |
| Header | **Layout Section** (nu Library, nu Global Element — vezi §4) | Header-ul e o locație de template, nu un bloc de conținut |
| Footer | **Layout Section** (nu Library, nu Global Element — vezi §4) | Același raționament ca la header |
| Bară cookie/consimțământ, bară de promoție la nivel de site | **Global Element** | Trebuie să fie identică și să se actualizeze peste tot instant |
| Pricing Table cu preț identic la nivel de site, afișat pe mai multe pagini | **Global Element** | Modificările de preț trebuie propagate peste tot instant, fără risc de dezalinire |

## 4. Avada Layouts & Layout Sections

**EN** — Source to cite: https://avada.com/documentation/understanding-layouts-and-layout-sections/ and the "how to use Avada Layouts" documentation.

- **Avada Layouts** replace the legacy Global Options approach to Header, Footer, and Page Title Bar, and additionally let you build custom **Content** layouts for any post type, archive, singular view, search results, or 404 page.
- A **Layout** is a set of **Layout Sections** — conceptually: a Header Section, a Footer Section, a Page Title Bar Section, and a Content Section — assigned to specific locations on the site via **Conditions** (e.g., all pages, a specific post type, an archive, WooCommerce products). `[verify]` the exact Layout Section type names and the full granularity of Conditions against the official page above before presenting them as a fixed list.
- These sections are built using the **Header Builder**, **Footer Builder**, **Mega Menu Builder**, and **Off-Canvas Builder**, using **Layout Elements** (the 15-element set: Archives, Author, Column, Comments, Container, Content, Featured Images Slider, Pagination, Post Card Archives, Post Card Cart, Post Card Image, Post Meta, Project Details, Related Posts, Woo Archives) — Layout Elements only appear inside Layout Sections, not on normal pages.
- **Rule: build global header/footer/page-title-bar/templates as Avada Layouts + Layout Sections. Never** by editing theme files, and **never** via the legacy Header/Menu/Page Title Bar/Sliding Bar Global Options panels (those are legacy — see chapter 03/00). The **Off-Canvas Builder** is the modern replacement for the legacy Sliding Bar.

**RO** — Sursă de citat: https://avada.com/documentation/understanding-layouts-and-layout-sections/ și documentația "how to use Avada Layouts".

- **Avada Layouts** înlocuiesc abordarea legacy din Global Options pentru Header, Footer și Page Title Bar și permit, în plus, construirea de layout-uri **Content** custom pentru orice tip de conținut, arhivă, vizualizare singulară, rezultate căutare sau pagină 404.
- Un **Layout** este un set de **Layout Sections** — conceptual: o secțiune Header, o secțiune Footer, o secțiune Page Title Bar și o secțiune Content — asignate unor locații specifice de pe site prin **Conditions** (ex. toate paginile, un anumit tip de conținut, o arhivă, produse WooCommerce). `[verify]` numele exacte ale tipurilor de Layout Section și granularitatea completă a Conditions față de pagina oficială de mai sus, înainte de a le prezenta ca listă fixă.
- Aceste secțiuni se construiesc cu **Header Builder**, **Footer Builder**, **Mega Menu Builder** și **Off-Canvas Builder**, folosind **Layout Elements** (setul de 15 elemente: Archives, Author, Column, Comments, Container, Content, Featured Images Slider, Pagination, Post Card Archives, Post Card Cart, Post Card Image, Post Meta, Project Details, Related Posts, Woo Archives) — Layout Elements apar doar în Layout Sections, nu pe pagini normale.
- **Regulă: construiește header/footer/page-title-bar/template-uri globale ca Avada Layouts + Layout Sections. Niciodată** prin editarea fișierelor temei, și **niciodată** prin panourile legacy Header/Menu/Page Title Bar/Sliding Bar din Global Options (acestea sunt legacy — vezi capitolul 03/00). **Off-Canvas Builder** este înlocuitorul modern pentru Sliding Bar (legacy).

## 5. Full reuse-strategy table

**EN**

| Component | Library | Global Element | Layout Section |
|---|---|---|---|
| CTA band (offer text varies per page) | ✓ | | |
| Service card (content varies per instance) | ✓ | | |
| Testimonial block (content varies per page) | ✓ | | |
| Cookie/consent bar (identical everywhere) | | ✓ | |
| Site-wide promo bar (identical everywhere) | | ✓ | |
| Header (applies to a template location) | | | ✓ |
| Footer (applies to a template location) | | | ✓ |
| Page Title Bar (applies to a template location) | | | ✓ |
| Single-post / archive template content structure | | | ✓ |
| WooCommerce shop/product/cart/checkout templates | | | ✓ (see chapter 06) |

Decision shortcut: **"Does it vary per page?"** → yes, independently → Library. **"Must it be identical and update everywhere at once?"** → Global Element. **"Is it a template location (header/footer/page-title-bar/content-type), not a content block?"** → Layout Section.

**RO**

| Componentă | Library | Global Element | Layout Section |
|---|---|---|---|
| Bandă CTA (text ofertă variază per pagină) | ✓ | | |
| Card de serviciu (conținut variază per instanță) | ✓ | | |
| Bloc testimonial (conținut variază per pagină) | ✓ | | |
| Bară cookie/consimțământ (identică peste tot) | | ✓ | |
| Bară de promoție la nivel de site (identică peste tot) | | ✓ | |
| Header (se aplică unei locații de template) | | | ✓ |
| Footer (se aplică unei locații de template) | | | ✓ |
| Page Title Bar (se aplică unei locații de template) | | | ✓ |
| Structura de conținut a template-ului single-post / arhivă | | | ✓ |
| Template-uri WooCommerce shop/produs/coș/checkout | | | ✓ (vezi capitolul 06) |

Scurtătură de decizie: **"Variază per pagină?"** → da, independent → Library. **"Trebuie să fie identic și să se actualizeze peste tot deodată?"** → Global Element. **"E o locație de template (header/footer/page-title-bar/tip de conținut), nu un bloc de conținut?"** → Layout Section.

## Source
- Library: https://avada.com/documentation/how-to-use-the-avada-builder-library/
- Layouts & Layout Sections: https://avada.com/documentation/understanding-layouts-and-layout-sections/ (and "how to use Avada Layouts")
- `[verify]` exact Layout Section type names and full Conditions granularity against the official page above before presenting them as an exhaustive/fixed list.
