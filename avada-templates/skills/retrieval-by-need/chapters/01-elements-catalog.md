---
id: "01"
title_en: Native Elements Catalog
title_ro: Catalog de elemente native
load_when_en: Pick the right native Avada element for a section.
load_when_ro: Alegi elementul nativ Avada potrivit pentru o secțiune.
task_types: [new-page, landing-lead-gen, rebuild-audit-page, header-footer-layouts, woocommerce-shop, custom-code-justification]
depends_on: []
---

# 01 — Native Elements Catalog

> Verified counts (avada.com/documentation/avada-builder-elements/, mod 2026-03-18): **78 Design**, **38 WooCommerce**, **15 Layout**, **23 Form**, **7 Inline** elements. "1,000+ element options" across the set.
> **Plugin-gating caveat (verbatim rule):** some elements only appear if the matching plugin is installed (Convert Plus, Gravity Forms, Events Calendar, LayerSlider, Slider Revolution, WooCommerce Design Elements), if enabled in Avada Builder Options, or if you are in the right Builder context (Layout Elements only in Layout Sections; Form Elements only in Form Builder). Always label these "requires `<plugin>`".

## (a) Structural elements / Elemente structurale

| Element | Role / Rol | Use for / Folosește pentru | Key options | Rule / Regulă |
|---|---|---|---|---|
| **Container** | Major section wrapper / wrapper principal de secțiune | Hero, content bands, full-width or boxed zones, background sections | Width, min-height, background color/image/video, padding, margin, border, flex alignment, visibility, responsive settings | Every major page section starts with a Container. / Fiecare secțiune majoră a paginii începe cu un Container. |
| **Column** | Divides a Container into content zones / împarte Container-ul în zone de conținut | 1/2/3/4-col layouts, cards, text+image, service grids | Column Width, order, alignment, spacing, background, border, responsive visibility/order | Never build a custom grid when Columns can do it. Default: Medium inherits Large; Small goes Full Width by default (both configurable). / Nu construi un grid custom când Columns pot rezolva. Implicit: Medium moștenește Large; Small devine Full Width implicit (ambele configurabile). |
| **Nested Columns** | Secondary structure inside a Column / structură secundară în interiorul unei Column | Complex cards, icon+text groups, CTA clusters | Same responsive behavior as Column, nested one level | Keep it simple — don't over-nest if one Container + Columns suffices. / Păstrează simplu — nu suprastructura dacă un singur Container + Columns e suficient. |

Only **Margins, Padding** are per-responsive-size on Container. On Column: **Column Width, Column Order, Column Spacing, Margins, Padding** are per-size (Responsive Option Sets break the Large→Medium→Small cascade when needed).

## (b) Design elements by purpose / Elemente Design grupate pe scop

### Content & typography / Conținut și tipografie
Title, Text Block, Tagline Box, Dropcap (inline, see §e).

| Element | Role | Rule |
|---|---|---|
| Title | H1–H6 / visual headings | One H1 per page; rest hierarchical (H2 for sections). |
| Text Block | Main text content, paragraphs, SEO copy | Content must be editable in Avada Builder, never hardcoded in a PHP template. |
| Tagline Box | Short highlighted statement/CTA strip with icon | Good for mini-CTA bands between sections. |

### Media, galleries, sliders / Media, galerii, slidere
Image, Gallery, Image Carousel, Media Slider, Avada Slider, Slider Revolution ("requires Slider Revolution"), Layer Slider ("requires LayerSlider").

| Element | Role | Rule |
|---|---|---|
| Image | Static image | Require descriptive alt text for SEO/accessibility. |
| Gallery | Image gallery | Portfolio/photo galleries, product shots. |
| Image Carousel | Rotating image set | Logos, testimonials, product highlights. |
| Media Slider | Mixed media slider | Rotating mixed image/video content. |
| Avada Slider | Native hero/content slider | Avoid a hero slider if it hurts clarity/performance (per old-pack rule, retained). |
| Layer Slider / Slider Revolution | 3rd-party advanced sliders | requires LayerSlider / requires Slider Revolution. |

### Social proof / Dovezi sociale
| Element | Role | Rule |
|---|---|---|
| Testimonials | Client quotes, reviews | Layout options for text, author, avatar, company. |
| Person | Team member profile | Photo, name, role, bio, social links. |
| Star Rating | Numeric/star rating display | Pair with Testimonials or Reviews sections. |

### Conversion / Conversie
| Element | Role | Rule |
|---|---|---|
| Button | Primary/secondary CTA | Use the Button Element, never a custom `<a class="btn">`. |
| Content Boxes | Icon/image + title + text card | Prefer for services/benefits/process cards over custom HTML. |
| Flip Boxes | Two-sided flip card (front/back content) | Good for feature reveal or before/after messaging. |
| Icon | Isolated visual symbol | Benefits, features, contact micro-icons. |
| Checklist | Bulleted list with check icons | Advantages, deliverables, package inclusions. |
| Pricing Table | Native pricing plan display | EXISTS as a native Design Element (`pricing-table-element`) — do not hedge with "if available." |
| Counter Boxes | Animated numeric metrics | Years of experience, clients, projects, results. |
| Progress Bar | Percentage/progress indicator | Skills, stats, completion state. |
| Countdown | Countdown timer | Launches, limited offers, event urgency. |
| Tagline Box | Short highlighted CTA strip | See content group above; also fits conversion bands. |
| Modal | Popup triggered by button/link | Quick forms, extra detail, lead magnets. Don't hide essential content behind it. |

### Interactive / Interactiv
| Element | Role | Rule |
|---|---|---|
| Tabs | Category-split content | Use when users compare categories, not for SEO-critical content that must be visible immediately. |
| Toggles | Generic accordion | Expandable detail, terms, generic Q&A-style content. |
| FAQ Element | Dedicated FAQ post type, schema-friendly | Use for true FAQ sections (distinct from Toggles — FAQ Element ties to FAQ post type + structured data). |
| Image Hotspots | Clickable points over an image | Product diagrams, interactive infographics. |
| Image Before & After | Before/after image slider comparison | Renovation, transformation, results comparison. |

### Data / dynamic / Date / dinamic
| Element | Role | Rule |
|---|---|---|
| Blog | Blog post listing | Blog index, resources. |
| Post Cards | Card-style post display | Related posts, curated article grids. |
| Recent Posts | Latest posts widgetized list | Sidebars, footers, "latest from the blog." |
| Portfolio | Project/work display | Case studies, portfolio grids. |
| Post Slider | Rotating post display | Featured articles/case studies band. |

### Navigation / utility / Navigare / utilitare
Menu, Menu Anchor, Search, Breadcrumbs, Table Of Contents, Section Separator, Separator.

| Element | Role | Rule |
|---|---|---|
| Menu | Nav menu render | Typically inside Header/Footer Layout Sections. |
| Menu Anchor | In-page jump target | One-page sites, in-page TOC links. |
| Search | Search field/box | Header, sidebar, dedicated search page. |
| Breadcrumbs | Path trail | Also configurable in Global Options → Breadcrumbs (legacy) or via Layout. |
| Table Of Contents | Auto-built page/post outline | Long-form content, SEO/AEO-friendly navigation. |
| Section Separator | Decorative section divider (shapes/waves) | Visual transition between Containers. |
| Separator | Plain line/space divider | Use native separator/spacing, never empty divs. |

### Embeds / maps / Integrări / hărți
| Element | Role | Rule |
|---|---|---|
| Video | Embedded/self-hosted video | Presentations, demos, video testimonials. |
| YouTube | YouTube embed | Dedicated YouTube element (distinct generic Video element also exists). |
| Vimeo | Vimeo embed | Dedicated Vimeo element. |
| Google Map | Location map | Contact/location sections. |
| Open Street Map | Alternate map provider | Same use as Google Map, non-Google alternative. |
| Audio | Audio embed/player | Podcasts, audio testimonials. |
| Code Block | Raw code/snippet display | Documentation, syntax display (pairs with Syntax Highlighter element for code coloring). |

## (c) Form elements (list — detail in chapter 05)

Avada **Form Builder** is a custom post type; forms are built with these 23 Form Elements, usable only inside the Form Builder context:

Checkbox Field, Consent Field, Date Field, Email Field, Form Step, Hidden Field, Honeypot Field, Image Select Field, Notice, Number Field, Password Field, Phone Number Field, Radio Field, Range Field, Rating Field, reCAPTCHA Field, Select Field, Submit/Button, Text Field, Textarea Field, Time Field, Turnstile Field, Upload Field.

**Rule:** use Avada Form before any 3rd-party form plugin. GDPR/spam: Consent Field + Privacy & Consent design element, reCAPTCHA Field, Turnstile Field (Cloudflare), Honeypot Field. Mailing integrations configured in Global Options → Forms (Mailchimp, HubSpot) — no separate "Newsletter element" exists. Full detail: chapter 05.

## (d) Layout elements (list — detail in chapter 09)

15 Layout Elements, usable **only inside Avada Layout Sections** (Header/Footer/Page Title Bar/Content Sections), not on normal pages:

Archives, Author, Column, Comments, Container, Content, Featured Images Slider, Pagination, Post Card Archives, Post Card Cart, Post Card Image, Post Meta, Project Details, Related Posts, Woo Archives.

**Rule:** build header/footer/single-post/archive/product templates as Avada Layouts + Layout Sections using these elements — not by editing theme files. Full detail: chapter 09.

## (e) Inline elements

Used inside text/other elements, not as standalone blocks:

Dropcap, Highlight, Inline Dynamic Data, Modal Text/HTML, One Page Text Link, Popover, Tooltip.

| Element | Use |
|---|---|
| Dropcap | Stylized first letter of a paragraph. |
| Highlight | Inline text highlight/emphasis styling. |
| Inline Dynamic Data | Pull dynamic values (e.g., post/site data) inline in text. |
| Modal Text/HTML | Inline trigger opening a modal with text/HTML content. |
| One Page Text Link | Inline anchor link for one-page navigation. |
| Popover | Inline hover/click popover content. |
| Tooltip | Inline hover tooltip. |

## (f) WooCommerce elements (38) — list only, detail in chapter 06

Woo Add To Cart, Additional Info, Cart Coupons, Cart Shipping, Cart Table, Cart Totals, Checkout Billing, Checkout Order Review, Checkout Payment, Checkout Shipping, Checkout Tabs, Customer Order Details, Featured Products Slider, Filter Active, Filter By Attribute, Filter By Brand, Filter By Category, Filter By Price, Filter By Rating, Mini Cart, Notices, Order Additional Info, Order Details, Order Downloads, Order Table, Price, Product Carousel, Product Grid, Product Images, Rating, Related Products, Reviews, Short Description, Shortcodes, Sorting, Stock, Tabs, Up/Cross-sells.

**All 38 require WooCommerce active** ("requires WooCommerce"). Used inside Avada Layouts (Single Product, Product Archive/Shop, Cart, Checkout, My Account templates) — see chapter 06 for the full WooCommerce Builder workflow.

## Quick selection table / Tabel de selecție rapidă

| Section need / Nevoie secțiune | Native Avada element |
|---|---|
| Hero | Container + Column(s) + Title + Text Block + Button (+ Image or Avada Slider if justified) |
| Services grid | Columns/Nested Columns + Content Boxes (or Icon + Title + Text Block per card) |
| FAQ | FAQ Element (schema-friendly) or Toggles (generic accordion) |
| Testimonials | Testimonials element (+ Image Carousel or Post Slider for rotation) |
| Metrics / key numbers | Counter Boxes (+ Progress Bar for skill/percentage-style metrics) |
| CTA band | Container (contrast background) + Title + Text Block + Button, or Tagline Box |
| Contact / lead capture | Avada Form (+ Consent Field, reCAPTCHA/Turnstile Field for GDPR/spam) |
| Pricing | Pricing Table |
| Gallery | Gallery (+ Image Carousel or Media Slider for rotation) |
| Team | Person element in Columns |
| Logos / trust bar | Image Carousel (or Columns of static Image elements) |

## RO — Rezumat catalog

**Structural:** Container (wrapper secțiune), Column (zone de conținut), Nested Columns (structură secundară în coloană). Regulă: fiecare secțiune majoră începe cu un Container; nu construi grid custom dacă Columns pot rezolva.

**Design (grupare pe scop):**
- *Conținut/tipografie:* Title (H1 unic, restul ierarhic H2+), Text Block (editabil în Builder, nu hardcodat), Tagline Box.
- *Media/galerii/slidere:* Image (alt text obligatoriu), Gallery, Image Carousel, Media Slider, Avada Slider, Layer Slider (requires LayerSlider), Slider Revolution (requires Slider Revolution).
- *Dovezi sociale:* Testimonials, Person, Star Rating.
- *Conversie:* Button (elementul nativ, nu `<a>` custom), Content Boxes, Flip Boxes, Icon, Checklist, Pricing Table (nativ, fără ezitare "dacă e disponibil"), Counter Boxes, Progress Bar, Countdown, Tagline Box, Modal (nu ascunde conținut esențial în el).
- *Interactiv:* Tabs (pentru comparare categorii, nu conținut SEO critic), Toggles (acordeon generic), FAQ Element (post type FAQ dedicat, schema-friendly), Image Hotspots, Image Before & After.
- *Date/dinamic:* Blog, Post Cards, Recent Posts, Portfolio, Post Slider.
- *Navigare/utilitare:* Menu, Menu Anchor, Search, Breadcrumbs, Table Of Contents, Section Separator, Separator.
- *Integrări/hărți:* Video, YouTube, Vimeo, Google Map, Open Street Map, Audio, Code Block.

**Form (23 elemente)** — doar în Form Builder; detaliu în capitolul 05. Regulă: Avada Form înaintea oricărui plugin extern de formulare.

**Layout (15 elemente)** — doar în Layout Sections (header/footer/page title bar/content); detaliu în capitolul 09.

**Inline (7 elemente):** Dropcap, Highlight, Inline Dynamic Data, Modal Text/HTML, One Page Text Link, Popover, Tooltip — folosite în interiorul textului/altor elemente.

**WooCommerce (38 elemente)** — toate necesită WooCommerce activ ("requires WooCommerce"); listă completă mai sus, detaliu în capitolul 06.

**Atenție la gating pe plugin:** unele elemente apar doar dacă plugin-ul asociat e instalat (Convert Plus, Gravity Forms, Events Calendar, LayerSlider, Slider Revolution, WooCommerce Design Elements), dacă sunt activate în Avada Builder Options, sau dacă ești în contextul corect de Builder (Layout Elements doar în Layout Sections; Form Elements doar în Form Builder). Etichetează întotdeauna aceste cazuri "requires `<plugin>`".
