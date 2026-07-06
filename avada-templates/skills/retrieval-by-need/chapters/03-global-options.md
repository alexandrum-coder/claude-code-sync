---
id: "03"
title_en: Global Options
title_ro: Opțiuni globale
load_when_en: You need site-wide settings — colors, typography, layout width, header/footer, forms, performance, custom CSS.
load_when_ro: Ai nevoie de setări la nivel de site — culori, tipografie, lățime, header/footer, formulare, performanță.
task_types: [new-page, header-footer-layouts, woocommerce-shop, global-styling-branding, responsive-mobile]
depends_on: []
---

# 03 — Global Options / Opțiuni globale

## Access path / Cale de acces
EN: **Avada → Options → Global Options** in the WP Dashboard, or the **Avada Live** sidebar (Toggle Sidebar icon) while editing with Avada Builder.
RO: **Avada → Options → Global Options** din WP Dashboard, sau bara laterală **Avada Live** (iconița Toggle Sidebar) în timpul editării.

Global Options apply site-wide. Set here first; override per-element only when a section genuinely needs to differ.
Global Options se aplică la nivel de site. Setează aici întâi; suprascrie per-element doar când o secțiune chiar trebuie să difere.

## Rule / Regulă
**Native Avada first.** Never write Custom CSS for something a Global Options panel already controls. Custom CSS is the last resort, not the default.
**Native Avada întâi.** Nu scrie Custom CSS pentru ceva ce un panou din Global Options controlează deja. Custom CSS este ultima soluție, nu implicita.

## Panel list (verified — research-notes §3) / Lista panourilor (verificat)
Full verified panel set from avada.com/documentation/avada-global-options/ (mod 2026-03-10):

Layout · Responsive · Colors · Header* · Menu* · Logo · Page Title Bar* · Breadcrumbs · Sliding Bar* · Footer · Sidebar (legacy, off by default) · Background · Typography · Blog · Portfolio · Social Media · Slideshows · Elastic Slider (legacy) · Lightbox · **Forms** · Contact Template · Search · Privacy · Extras · Advanced (Features / Code Fields / Post Types) · Maintenance Mode · Performance · bbPress · WooCommerce · Events Calendar · **Custom CSS** · Avada Builder Elements · Import/Export.

`*` = **legacy panel**. Prefer the modern equivalent (see table below).

## Panels covered in this chapter

### Layout
EN: Site width, content width, boxed vs. wide layout, global container padding, sidebar/no-sidebar defaults. Sets the structural frame every page inherits.
RO: Lățime site, lățime conținut, layout boxed vs. wide, padding global container. Cadrul structural moștenit de toate paginile.

### Responsive
EN: Element Responsive Breakpoints (Large / Medium / Small — pixel values are **user-set**, do not assume defaults), Responsive Typography Sensitivity, Minimum Font Size Factor. Full detail in chapter `04`.
RO: Breakpoints (Large / Medium / Small — valorile în px sunt **setate de utilizator**), sensibilitate tipografie responsive. Detalii complete în capitolul `04`.

### Colors
EN: **Global Color Palette** + **Primary Color**. Define brand colors here as palette entries and reference the palette everywhere (element color pickers pull from it). Do **not** hardcode hex values per element — a palette edit should update the whole site.
RO: **Global Color Palette** + **Primary Color**. Definește culorile de brand aici ca intrări în paletă și folosește paleta peste tot. **Nu** hardcoda hex per element — o schimbare în paletă trebuie să actualizeze tot site-ul.

### Typography
EN: **Global Typography** sets, **Body** typography, **Headings H1–H6**, **Custom Fonts** (self-hosted `.woff` / `.woff2` / `.ttf`). Set the type scale once here; Custom Fonts panel is where you upload licensed/self-hosted font files (pairs with Privacy panel's local Google Fonts mode for GDPR-friendly font loading).
RO: Seturi de **Global Typography**, tipografie **Body**, **Headings H1–H6**, **Custom Fonts** (fonturi self-hosted `.woff`/`.woff2`/`.ttf`). Setează scala tipografică o singură dată aici; panoul Custom Fonts e locul de încărcat fonturi licențiate/self-hosted (împreună cu modul local Google Fonts din panoul Privacy, pentru GDPR).

### Header / Menu / Page Title Bar / Sliding Bar — **legacy**
EN: These four Global Options panels still exist but are **legacy**. Prefer building header, menu, page title bar, and off-canvas panels as **Avada Layouts** (Header Builder / Off-Canvas Builder) instead — see chapter `09`. Use the legacy panels only for a quick global default when no Layout override exists yet.
RO: Aceste patru panouri există dar sunt **legacy**. Preferă construirea header-ului, meniului, page title bar și panoului off-canvas ca **Avada Layouts** (Header Builder / Off-Canvas Builder) — vezi capitolul `09`. Folosește panourile legacy doar ca implicit rapid, cât timp nu există încă un Layout care să suprascrie.

| Legacy panel | Modern replacement |
|---|---|
| Header (Global Options) | Avada Layouts → Header Section / Header Builder |
| Menu (Global Options) | Header Builder / Mega Menu Builder |
| Page Title Bar (Global Options) | Avada Layouts → custom Page Title Bar Section |
| Sliding Bar (Global Options) | Off-Canvas Builder |

### Logo
EN: Logo upload, retina/alternate logo, sizing. Feeds every Layout that includes a Logo-driven header, plus mobile logo behavior.
RO: Încărcare logo, logo retina/alternativ, dimensionare. Alimentează orice Layout cu header bazat pe logo, plus comportament logo pe mobil.

### Footer
EN: Footer widget areas/columns, footer background, copyright area. For a fully custom footer, build a Footer Section via Avada Layouts (chapter `09`); this panel sets the global default.
RO: Zone widget footer/coloane, fundal footer, zonă copyright. Pentru un footer complet custom, construiește o Footer Section prin Avada Layouts (capitolul `09`); acest panou setează implicitul global.

### Background
EN: Site-wide background color/image/pattern behind the boxed layout.
RO: Fundal la nivel de site, în spatele layout-ului boxed.

### Forms
EN: **Forms** panel = Form Styling, **Cloudflare Turnstile**, **Google reCAPTCHA**, **HubSpot**, **Mailchimp** — the integration keys/settings for every Avada Form on the site live here, once, instead of per-form. Full detail in chapter `05`.
RO: Panoul **Forms** = Form Styling, **Cloudflare Turnstile**, **Google reCAPTCHA**, **HubSpot**, **Mailchimp** — cheile/setările de integrare pentru toate formularele Avada de pe site stau aici, o singură dată, nu per formular. Detalii complete în capitolul `05`.

### Blog
EN: Default blog archive/list styling (layout, meta, excerpt length) consumed by the Blog element and blog archive Layouts.
RO: Stil implicit arhivă/listă blog (layout, meta, lungime rezumat), folosit de elementul Blog și de Layouts pentru arhiva de blog.

### Portfolio
EN: Default portfolio archive/grid styling consumed by the Portfolio element.
RO: Stil implicit arhivă/grid portofoliu, folosit de elementul Portfolio.

### Social Media
EN: Site-wide social profile URLs consumed by the Social Links element and Social Sharing element — set once here, reuse everywhere.
RO: URL-urile profilurilor sociale la nivel de site, folosite de elementul Social Links și Social Sharing — setează o dată aici, refolosește peste tot.

### Lightbox
EN: Global lightbox behavior (used by Gallery, Image, Image Carousel, etc. when lightbox is enabled on the element).
RO: Comportament global lightbox (folosit de Gallery, Image, Image Carousel etc. când lightbox e activat pe element).

### Search
EN: Site search behavior/results styling, consumed by the Search element.
RO: Comportament/stil pentru căutarea pe site, folosit de elementul Search.

### Privacy
EN: Privacy bar / consent settings, and local (self-hosted) Google Fonts mode — pairs with Typography's Custom Fonts for GDPR-friendly font loading. General cookie/consent-bar behavior lives here; form-level consent is a separate native mechanism (chapter `05`).
RO: Setări bară de confidențialitate/consimțământ, și mod local (self-hosted) pentru Google Fonts — merge împreună cu Custom Fonts din Typography pentru încărcare fonturi GDPR-friendly. Comportamentul general de cookie/consent stă aici; consimțământul la nivel de formular e un mecanism nativ separat (capitolul `05`).

### Performance
EN: **Dynamic CSS & JS** generation mode, **PWA** options. Pairs with the Avada Performance Wizard. Tune here before reaching for a caching/minify plugin's overlapping settings.
RO: Mod generare **Dynamic CSS & JS**, opțiuni **PWA**. Merge împreună cu Avada Performance Wizard. Ajustează aici înainte de a apela la setări suprapuse dintr-un plugin de cache/minify.

### Advanced
EN: **Features** (enable/disable Avada Builder features), **Code Fields** (tracking code, JS wrapped in `<script>` tags, HTML injected before `</head>` / `</body>`), **Post Types** (enable/disable Portfolio, FAQ, etc. as post types). Code Fields is the sanctioned native place for tracking/analytics snippets — still native Avada, not "custom code" in the last-resort sense, but keep it minimal and documented.
RO: **Features** (activează/dezactivează funcții Avada Builder), **Code Fields** (cod de tracking, JS în tag-uri `<script>`, HTML injectat înainte de `</head>`/`</body>`), **Post Types** (activează/dezactivează Portfolio, FAQ etc. ca tipuri de conținut). Code Fields e locul nativ sancționat pentru tracking/analytics — tot nativ Avada, dar ține-l minimal și documentat.

### Custom CSS
EN: Site-wide CSS override panel. It **exists and is native**, but stays the **last resort** — use it only after Elements → Container/Column → Global/Element Options → Library/Global Element → Layout Section have all been ruled out.
RO: Panou de suprascriere CSS la nivel de site. **Există și e nativ**, dar rămâne **ultima soluție** — folosește-l doar după ce ai exclus Elemente → Container/Column → Global/Element Options → Library/Global Element → Layout Section.

### Import/Export
EN: Exports/imports the entire Global Options set as **JSON**. Use it to migrate a brand configuration between installs or to reuse a client's design system across projects.
RO: Exportă/importă întregul set de Global Options ca **JSON**. Folosește-l pentru a migra o configurație de brand între instalări sau pentru a refolosi sistemul de design al unui client în alte proiecte.

## Other panels (present, not detailed here — see their owning chapter)
- **Maintenance Mode** — site-wide maintenance page toggle.
- **bbPress** — requires bbPress plugin.
- **WooCommerce** — see chapter `06`.
- **Events Calendar** — requires Events Calendar plugin.
- **Avada Builder Elements** — per-element global defaults, e.g. default Column responsive behavior; see chapter `04`.
- **Contact Template** — default page template used for contact-style pages.
- **Extras** — miscellaneous site-wide toggles `[verify]` exact contents against avada.com/documentation/avada-global-options/.

## "Use Global Options instead of Custom CSS" / Folosește Global Options în loc de Custom CSS

| Need / Nevoie | Use this panel, not Custom CSS |
|---|---|
| Brand colors everywhere / Culori de brand peste tot | **Colors** → Global Color Palette + Primary Color |
| Consistent heading sizes/fonts / Dimensiuni și fonturi titluri consistente | **Typography** → Headings H1–H6 |
| Body text font/size/line-height / Font/dimensiune/line-height text | **Typography** → Body |
| Self-hosted brand font / Font de brand self-hosted | **Typography** → Custom Fonts |
| Site width / boxed vs. wide / Lățime site / boxed vs. wide | **Layout** |
| Header/menu look across all pages / Aspect header/meniu pe tot site-ul | Avada Layouts → Header Section (chapter `09`), or legacy **Header**/**Menu** panel as interim default |
| Footer columns/copyright / Coloane footer/copyright | **Footer** panel, or Footer Section via Avada Layouts |
| Form field/button styling site-wide / Stil câmpuri/butoane formular pe tot site-ul | **Forms** → Form Styling |
| Spam protection keys / Chei protecție spam | **Forms** → Cloudflare Turnstile / Google reCAPTCHA |
| Mailing list connection / Conectare listă de email | **Forms** → Mailchimp / HubSpot |
| Tracking/analytics snippet / Cod de tracking/analytics | **Advanced → Code Fields** |
| Cookie/consent bar / Bară cookie/consimțământ | **Privacy** |
| Faster CSS/JS delivery / Livrare CSS/JS mai rapidă | **Performance** → Dynamic CSS & JS |
| Reuse brand config on another install / Refolosire config brand pe altă instalare | **Import/Export** (JSON) |
| Something none of the above covers / Ceva neacoperit de niciunul dintre cele de mai sus | **Custom CSS** — last resort, with written justification |

## RO — Rezumat rapid
Global Options e primul loc de configurat orice lucru la nivel de site: culori (Colors → paletă), tipografie (Typography → Body/Headings/Custom Fonts), lățime layout (Layout), formulare și anti-spam (Forms), performanță (Performance), cod de tracking (Advanced → Code Fields). Header/Menu/Page Title Bar/Sliding Bar sunt **legacy** — pentru proiecte noi, construiește-le ca Avada Layouts (capitolul `09`). Custom CSS există dar rămâne ultima opțiune. Import/Export permite mutarea configurației complete (JSON) între instalări.
