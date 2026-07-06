# 00 - Avada Build Rules pentru Claude

## Obiectiv
Construieste website-uri WordPress folosind capabilitatile native Avada: Avada Builder, Containers, Columns, Design Elements, Layout Elements, Global Options, Layouts, Library si Global Elements.

## Reguli obligatorii
- Foloseste elemente native Avada inainte de orice custom code.
- Nu inventa functionalitati Avada care nu sunt mentionate in documentatia oferita.
- Nu crea HTML/CSS/JS custom daca acelasi rezultat se poate obtine cu un element, optiune, container, coloana sau setare Avada.
- Structureaza fiecare pagina in Containers > Columns > Elements.
- Pentru design recurent, foloseste Avada Library si Global Elements.
- Pentru header, footer, content templates si post/product templates, foloseste Avada Layouts si Layout Sections.
- Pentru culori, fonturi, spacing, butoane, headings si layout general, foloseste Global Options.
- Pentru mobile, foloseste Responsive Options si setari separate pentru Large / Medium / Small, acolo unde Avada permite.
- Foloseste child theme, hooks, filters sau PHP doar pentru cerinte care nu pot fi rezolvate nativ.
- Pentru fiecare decizie, explica elementul Avada folosit si motivul.

## Ce NU trebuie sa faci
- Nu genera o tema WordPress custom de la zero.
- Nu propune Elementor, Divi, Gutenberg blocks sau pluginuri externe daca Avada poate rezolva cerinta.
- Nu scrie CSS pentru butoane, cards, griduri, spacing sau responsive daca exista setari Avada.
- Nu hardcoda texte in template-uri PHP daca pot fi administrate din Avada Builder.
- Nu folosi shortcode-uri custom decat daca sunt cerute explicit.
- Nu recomanda modificarea directa a fisierelor temei Avada parinte.

## Ordine de decizie
Cand primesti o cerinta, gandeste in ordinea aceasta:
1. Exista un element nativ Avada pentru aceasta functie?
2. Se poate face cu Container, Column, Design Element sau Layout Element?
3. Se poate controla prin Global Options sau Element Options?
4. Se poate salva/reutiliza prin Library / Global Element?
5. Este nevoie de Layout Section sau conditional layout?
6. Doar daca raspunsul este nu, propune custom CSS/JS/PHP in child theme.

## Output obligatoriu pentru fiecare pagina
Pentru fiecare pagina returneaza:
1. Scopul paginii
2. Structura sectiunilor
3. Container / Column layout pentru fiecare sectiune
4. Elementele Avada folosite in fiecare sectiune
5. Setari Avada recomandate pentru desktop/tablet/mobile
6. Continutul text propus
7. Global Options necesare
8. Library / Global Elements recomandate
9. Checklist de implementare in Avada Builder
10. Ce custom code este necesar, daca este cazul, si de ce nu se poate face nativ

## Format recomandat de raspuns
Foloseste formatul:

### Page: [Nume pagina]

#### Section 1: [Nume sectiune]
- Goal:
- Container settings:
- Columns:
- Native Avada elements:
- Content:
- Responsive notes:
- Reusable/global?:

#### Implementation checklist
- [ ] Creeaza pagina
- [ ] Adauga container
- [ ] Configureaza coloane
- [ ] Adauga elemente native
- [ ] Seteaza responsive
- [ ] Salveaza sectiunile recurente in Library

