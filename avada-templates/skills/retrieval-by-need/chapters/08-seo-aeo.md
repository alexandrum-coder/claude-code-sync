---
id: "08"
title_en: SEO & AI Visibility
title_ro: SEO și vizibilitate în AI
load_when_en: You need on-page SEO and AI/answer-engine visibility — keywords, entities, FAQ, schema, internal linking.
load_when_ro: Ai nevoie de SEO on-page și vizibilitate în motoarele AI — cuvinte cheie, entități, FAQ, schema, linkuri interne.
task_types: [landing-lead-gen, seo-aeo-schema, translation-bilingual]
depends_on: ["02"]
---

# 08 — SEO & AI Visibility

> Load this chapter for on-page SEO and AEO/GEO (answer-engine / generative-engine visibility) work. It builds on chapter `02` (layout patterns) — SEO structure and page structure are the same decision, made once.

## 1. On-page SEO with native Avada elements

**EN** — Every on-page SEO requirement below maps to a native Avada element or a WordPress/Avada setting. Do not add a 3rd-party SEO plugin's markup manually if Avada already exposes the control natively; where Avada has no native control (e.g., meta title/description fields, XML sitemap), that is a WordPress/SEO-plugin responsibility — mark it `[verify]` for the specific plugin in use on the project.

| SEO requirement | Native Avada path |
|---|---|
| One H1 per page | **Title** element set to Heading 1, used once per page — do not create a second H1 via Text Block |
| Correct heading hierarchy (H1 → H2 → H3, no skipped levels) | **Title** element per section, heading level chosen per Title instance; keep levels sequential down the page |
| Meta title / meta description | Not a native Avada element — set via the SEO plugin active on the install `[verify which plugin]`, or Yoast/RankMath-equivalent field if present |
| Keyword placement per language | Body copy inside **Text Block** / **Title** elements, written per the target language of the page (see §4) |
| Image alt text | **Image** element's alt text field — always fill it, describing the image, not stuffing keywords |
| Table of contents for long pages | **Table Of Contents** element (Design Element) |
| Breadcrumb navigation | **Breadcrumbs** element (Design Element), or Global Options → Breadcrumbs panel for site-wide breadcrumb behavior |
| Internal linking | **Button** / inline text links inside **Text Block**, plus **Related Posts** (Layout Element, in Layout Sections) and **Recent Posts** / **Blog** elements to surface related content |

**RO**

| Cerință SEO | Cale nativă Avada |
|---|---|
| Un singur H1 per pagină | Elementul **Title** setat pe Heading 1, folosit o singură dată per pagină — nu crea un al doilea H1 printr-un Text Block |
| Ierarhie corectă a titlurilor (H1 → H2 → H3, fără niveluri sărite) | Elementul **Title** per secțiune, cu nivelul de titlu ales per instanță; păstrează nivelurile secvențiale în josul paginii |
| Titlu meta / descriere meta | Nu e un element nativ Avada — se setează din plugin-ul SEO activ pe instalare `[verify ce plugin]`, sau câmpul echivalent Yoast/RankMath dacă există |
| Plasarea cuvintelor cheie per limbă | Text în interiorul elementelor **Text Block** / **Title**, scris în limba țintă a paginii (vezi §4) |
| Text alternativ imagini | Câmpul alt text al elementului **Image** — completează-l mereu, descriind imaginea, nu înghesuind cuvinte cheie |
| Cuprins pentru pagini lungi | Elementul **Table Of Contents** (Design Element) |
| Navigare breadcrumb | Elementul **Breadcrumbs** (Design Element), sau panoul Global Options → Breadcrumbs pentru comportament la nivel de site |
| Linkuri interne | **Button** / linkuri text inline în **Text Block**, plus **Related Posts** (Layout Element, în Layout Sections) și elementele **Recent Posts** / **Blog** pentru a evidenția conținut similar |

## 2. Heading hierarchy discipline

**EN** — Treat heading levels as a document outline, not a font-size picker:
- Exactly one **Title** element at Heading 1 per page — usually the page's main headline in the hero/page-title-bar area.
- Each major **Container** section gets one Heading 2 **Title** as its section heading.
- Sub-points within a section use Heading 3, and so on — never jump from H1 to H3.
- Do not pick a heading level purely for its visual size; use **Typography** → Headings H1–H6 (Global Options, chapter 03) to control the look of a given level, and keep the *level* tied to document structure.

**RO** — Tratează nivelurile de titlu ca pe un contur de document, nu ca pe un selector de mărime a fontului:
- Exact un element **Title** la Heading 1 per pagină — de regulă titlul principal din zona hero/page-title-bar.
- Fiecare secțiune majoră de **Container** primește un **Title** la Heading 2, ca titlu de secțiune.
- Sub-punctele dintr-o secțiune folosesc Heading 3 ș.a.m.d. — nu sări niciodată de la H1 la H3.
- Nu alege un nivel de titlu doar pentru mărimea vizuală; folosește **Typography** → Headings H1–H6 (Global Options, capitolul 03) pentru aspectul unui nivel dat, și păstrează *nivelul* legat de structura documentului.

## 3. AI / answer-engine visibility (AEO / GEO)

**EN** — Answer engines (ChatGPT, Perplexity, AI Overviews, Claude, etc.) extract facts, not page rank. Structure content so it is easy to lift cleanly:

- **Entity signals** — state brand name, founders/team, services, and location plainly and consistently across the site (not just in one hidden "About" paragraph). Use the **Person** element for named team members, and keep the business name/location consistent in Title and Text Block copy.
- **FAQ Element** — use the dedicated **FAQ Element** (not generic Toggles) for question-and-answer content. Per `research-notes.md` §0, the FAQ Element is separate from Toggles specifically because it is schema-friendly and tied to the FAQ post type. Toggles = generic accordion UI; FAQ Element = structured Q&A meant to be machine-read.
- **Concise, question-led content** — write section headings as the actual question a user (or an AI model) would ask ("How much does X cost?", "What is included in Y?"), then answer it in the first sentence or two beneath, in **Text Block**. Answer engines favor content that states the answer immediately, then elaborates.
- **Clear definitions** — when introducing a term specific to the business or industry, define it in one plain sentence before elaborating. This gives extractive systems a clean answer span to quote.
- **Structured, extractable content** — prefer **Table**, **Checklist**, and **Pricing Table** elements over long unstructured paragraphs when presenting comparable facts (pricing tiers, feature lists, steps) — structured markup is easier for both search crawlers and LLMs to parse and quote accurately.

**RO** — Motoarele de răspuns (ChatGPT, Perplexity, AI Overviews, Claude etc.) extrag fapte, nu rank de pagină. Structurează conținutul astfel încât să poată fi preluat curat:

- **Semnale de entitate** — precizează clar și consecvent numele brandului, fondatorii/echipa, serviciile și locația pe tot site-ul (nu doar într-un paragraf ascuns de "Despre noi"). Folosește elementul **Person** pentru membrii numiți ai echipei și păstrează numele afacerii/locația consecvente în textul din Title și Text Block.
- **Elementul FAQ** — folosește elementul dedicat **FAQ** (nu Toggles generic) pentru conținut întrebare-răspuns. Conform `research-notes.md` §0, elementul FAQ este separat de Toggles tocmai pentru că e prietenos cu schema și legat de tipul de conținut FAQ. Toggles = accordion UI generic; elementul FAQ = Q&A structurat, gândit să fie citit de mașini.
- **Conținut concis, condus de întrebări** — scrie titlurile de secțiuni ca întrebarea reală pe care un utilizator (sau un model AI) ar pune-o ("Cât costă X?", "Ce include Y?"), apoi răspunde în prima frază sau două de dedesubt, în **Text Block**. Motoarele de răspuns favorizează conținutul care oferă răspunsul imediat, apoi detaliază.
- **Definiții clare** — când introduci un termen specific afacerii sau industriei, definește-l într-o frază simplă înainte de a detalia. Asta oferă sistemelor extractive un fragment de răspuns curat de citat.
- **Conținut structurat, extractibil** — preferă elementele **Table**, **Checklist** și **Pricing Table** în locul paragrafelor lungi nestructurate când prezinți fapte comparabile (niveluri de preț, liste de funcționalități, pași) — markup-ul structurat e mai ușor de parsat și citat corect atât de crawlere de căutare, cât și de LLM-uri.

## 4. Schema notes

**EN**
- The **FAQ Element** is tied to a FAQ post type and is described in research-notes.md as "schema-friendly" — it is the correct native path for FAQ rich-snippet-style structured content. Exact schema markup output/behavior: `[verify]` against the FAQ Element's documentation page at build time.
- Other schema types (Organization, LocalBusiness, Product, BreadcrumbList, Article, etc.) are **not confirmed as native Avada element output** in research-notes.md. Treat any such schema need as `[verify]` — it is typically handled by the site's SEO plugin (Yoast, RankMath, or similar) rather than by an Avada element. Name the specific plugin only if confirmed active on the project; otherwise write `[verify SEO plugin in use]`.
- Do not claim an Avada element emits a specific schema.org type unless that is confirmed in research-notes.md or the cited official page.

**RO**
- Elementul **FAQ** e legat de un tip de conținut FAQ și e descris în research-notes.md ca fiind "schema-friendly" — este calea nativă corectă pentru conținut structurat de tip FAQ rich-snippet. Markup-ul/comportamentul exact al schemei: `[verify]` în documentația elementului FAQ la momentul implementării.
- Alte tipuri de schema (Organization, LocalBusiness, Product, BreadcrumbList, Article etc.) **nu sunt confirmate ca output nativ al unui element Avada** în research-notes.md. Tratează orice astfel de nevoie ca `[verify]` — de regulă e gestionată de plugin-ul SEO al site-ului (Yoast, RankMath sau similar), nu de un element Avada. Numește plugin-ul specific doar dacă e confirmat activ pe proiect; altfel scrie `[verify plugin SEO folosit]`.
- Nu afirma că un element Avada emite un anumit tip schema.org dacă nu e confirmat în research-notes.md sau în pagina oficială citată.

## 5. Bilingual keyword strategy

**EN** — On a bilingual build (English UI, Romanian body copy — see chapter 10), keyword research and on-page optimization are done **per language, separately**:
- Maintain **separate keyword sets** for the Romanian body copy and any English body copy — do not translate an English keyword list literally and assume it carries search intent/volume in Romanian.
- Each language version of a page gets its own H1, meta title, and meta description, each optimized for that language's keyword set.
- Element and option names stay English regardless (chapter 10 language rule) — this section is only about the **client-facing copy** written inside Title/Text Block/FAQ elements.
- If the site is genuinely multilingual (two live language versions via WPML/Polylang), also read chapter 10 §on multilingual plugins before finalizing structure — hreflang/URL-structure specifics are `[verify]`, plugin-dependent.

**RO** — Într-un build bilingv (interfață engleză, text în română — vezi capitolul 10), cercetarea de cuvinte cheie și optimizarea on-page se fac **per limbă, separat**:
- Menține **seturi de cuvinte cheie separate** pentru textul în română și pentru orice text în engleză — nu traduce literal o listă de cuvinte cheie din engleză presupunând că păstrează intenția de căutare/volumul în română.
- Fiecare versiune de limbă a unei pagini primește propriul H1, titlu meta și descriere meta, optimizate pentru setul de cuvinte cheie al acelei limbi.
- Numele de elemente și opțiuni rămân engleze oricum (regula de limbă din capitolul 10) — această secțiune se referă doar la **textul vizibil clientului** scris în elementele Title/Text Block/FAQ.
- Dacă site-ul e cu adevărat multilingv (două versiuni de limbă live prin WPML/Polylang), citește și secțiunea din capitolul 10 despre plugin-uri multilingve înainte de a finaliza structura — detaliile hreflang/structură URL sunt `[verify]`, dependente de plugin.

## Source
- Cite for element behavior: https://avada.com/documentation/avada-builder-elements/ (mod. 2026-03-18 per research-notes.md).
- Cite for layout/section structure decisions: chapter `02` (Page Layout Patterns).
- Schema/meta specifics beyond the FAQ Element: `[verify]` against the SEO plugin active on the project — not covered by research-notes.md.
