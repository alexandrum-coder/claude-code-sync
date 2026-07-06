# 01 - Avada Native Elements Catalog

Acest fisier este un catalog operational, nu o copie completa a documentatiei. Claude trebuie sa-l foloseasca pentru a alege elementele native potrivite.

## Elemente structurale

### Container
Rol: wrapper principal pentru sectiuni de pagina.
Foloseste pentru: hero sections, content bands, rows, zone full-width, zone boxed, sectiuni cu background.
Optiuni importante: width, height/min-height, background color/image/video, padding, margin, border, flex alignment, visibility, responsive settings.
Regula: orice sectiune majora a paginii incepe cu un Container.

### Column
Rol: imparte containerul in zone de continut.
Foloseste pentru: layout 1-col, 2-col, 3-col, cards, text + imagine, grile servicii.
Optiuni importante: width, order, alignment, spacing, background, border, responsive visibility/order.
Regula: nu crea grid custom daca se poate obtine cu Columns.

### Nested Columns / Inner Layout
Rol: structura secundara in interiorul unei coloane.
Foloseste pentru: carduri complexe, zona icon + text, grupuri de CTA.
Regula: pastreaza structura simpla. Nu supracomplica daca un singur Container + Columns este suficient.

## Elemente de continut si design

### Title
Rol: H1-H6 / titluri vizuale.
Foloseste pentru: headline hero, sectiuni, subsectiuni.
Optiuni: heading level, typography, size, alignment, margin, animation.
Regula: H1 o singura data pe pagina, restul ierarhic.

### Text Block
Rol: continut text principal.
Foloseste pentru: paragrafe, descrieri servicii, continut SEO.
Optiuni: typography, alignment, margins, editor content.
Regula: continutul text trebuie sa fie editabil in Avada, nu hardcodat in template PHP.

### Image
Rol: imagine statica.
Foloseste pentru: fotografii, ilustratii, logo-uri, imagini servicii.
Optiuni: source, alt text, alignment, size, border radius, link, lazy loading daca exista in setari.
Regula: cere alt text descriptiv pentru SEO si accesibilitate.

### Button
Rol: CTA principal/secundar.
Foloseste pentru: Contact, Get Quote, Book a Call, Learn More, Download.
Optiuni: link, target, style, size, icon, alignment, colors, hover, margin.
Regula: foloseste Button Element, nu <a class="custom-button">.

### Icon
Rol: simbol vizual izolat.
Foloseste pentru: beneficii, features, contacte, micro-interactiuni.
Optiuni: icon library, size, color, circle/background, link.

### Icon Box
Rol: card scurt cu icon + titlu + text.
Foloseste pentru: servicii, beneficii, valori, procese.
Optiuni: icon, title, content, layout, link, animation.
Regula: pentru carduri de servicii simple, prefera Icon Box in loc de HTML custom.

### Checklist
Rol: lista cu bife / beneficii / features.
Foloseste pentru: avantaje, livrabile, ce include pachetul.
Optiuni: icon, icon color, spacing, typography.

### Separator
Rol: separare vizuala / spatiu / linie.
Foloseste pentru: delimitare sectiuni, pauze intre blocuri.
Optiuni: style, width, color, margin.
Regula: foloseste Separator/spacing nativ, nu div-uri goale.

### Counter / Counter Box
Rol: metrici numerice.
Foloseste pentru: ani experienta, clienti, proiecte, rezultate.
Optiuni: valoare, prefix/suffix, animation, typography.

### Progress Bar
Rol: procent/progres.
Foloseste pentru: skill-uri, statistici, stadiu.

### Testimonials
Rol: social proof.
Foloseste pentru: testimoniale clienti, reviews.
Optiuni: text, autor, avatar, companie, layout.

### Person
Rol: profil membru echipa.
Foloseste pentru: echipa, management, experti.
Optiuni: poza, nume, rol, bio, social links.

### Tabs
Rol: continut impartit pe categorii.
Foloseste pentru: servicii complexe, pachete, explicatii.
Regula: foloseste Tabs cand utilizatorul are nevoie sa compare categorii, nu pentru continut SEO critic care trebuie vizibil imediat.

### Toggles / FAQ
Rol: intrebari frecvente / continut expandabil.
Foloseste pentru: FAQ, detalii suplimentare, termeni.
Regula: ideal pentru sectiunea FAQ.

### Modal
Rol: popup declansat de buton/link.
Foloseste pentru: formulare rapide, detalii extra, lead magnets.
Regula: nu abuza de modal pentru continut esential.

### Slider / Carousel
Rol: continut rotativ.
Foloseste pentru: testimoniale, logo-uri, galerii, hero doar cand are sens.
Regula: evita slider hero daca afecteaza claritatea si performanta.

### Gallery
Rol: galerie imagini.
Foloseste pentru: portofoliu foto, lucrari, produse.

### Video
Rol: video embed/self-hosted.
Foloseste pentru: prezentari, demo, testimonial video.

### Map
Rol: harta locatie.
Foloseste pentru: contact/location.

### Social Links / Sharing
Rol: linkuri social media sau share.
Foloseste pentru: footer, autor, blog, contact.

## Elemente pentru lead generation

### Avada Form
Rol: formular nativ pentru contact, lead, quote request.
Foloseste pentru: contact page, hero CTA, landing pages.
Optiuni: campuri, validare, notificari email, redirect/confirmation, layout.
Regula: foloseste Avada Form inainte de pluginuri externe.

### Newsletter / Email opt-in
Rol: captare email, daca exista integrare disponibila.
Foloseste pentru: footer, lead magnet, blog.

## Elemente dinamice / template

### Post Cards / Blog Elements
Rol: afisare articole, carduri postari, arhive.
Foloseste pentru: blog index, related posts, resources.

### Portfolio Elements
Rol: afisare proiecte/lucrari.
Foloseste pentru: case studies, portofoliu.

### Layout Elements
Rol: elemente speciale pentru template-uri dinamice.
Foloseste pentru: single post, archives, product pages, headers, footers, page title bars.
Regula: cand creezi template-uri globale, foloseste Layouts + Layout Sections.

## Regula de selectie rapida
- Sectiune pagina = Container
- Structura pe coloane = Columns
- Titlu = Title
- Text = Text Block
- CTA = Button
- Beneficii/servicii = Icon Box sau Checklist
- Intrebari frecvente = Toggles / FAQ
- Metrici = Counter
- Dovezi sociale = Testimonials / Logo carousel
- Contact/lead = Avada Form
- Template global = Layouts + Layout Sections
- Reutilizare = Library / Global Elements
