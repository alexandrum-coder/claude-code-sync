# 04 - Avada Responsive Rules

## Obiectiv
Website-ul trebuie sa fie construit mobile-friendly folosind setarile responsive Avada, nu CSS custom inutil.

## Reguli generale
- Gandeste fiecare sectiune pe Desktop, Tablet si Mobile.
- Verifica ordinea coloanelor pe mobile.
- Redu padding-ul vertical pe mobile.
- Redu dimensiunile H1/H2 pe mobile folosind optiuni responsive.
- Evita imagini prea mari in hero pe mobile.
- Ascunde elemente decorative pe mobile daca incarca inutil pagina.
- CTA-ul principal trebuie sa ramana vizibil si usor de apasat.

## Pattern-uri uzuale

### Hero 2 coloane
Desktop:
- Column 1: text + CTA
- Column 2: imagine/visual
Mobile:
- Column 1 full width
- Column 2 sub text sau ascunsa daca este pur decorativa
- H1 redus
- Butoane full-width daca se potrivesc designului

### Grid servicii 3 coloane
Desktop:
- 3 columns
Tablet:
- 2 columns
Mobile:
- 1 column

### Sectiune cards 4 coloane
Desktop:
- 4 columns
Tablet:
- 2 columns
Mobile:
- 1 column

### Imagine + text
Desktop:
- 50/50 sau 40/60
Mobile:
- imagine deasupra sau sub text in functie de storytelling

## Checklist responsive pentru Claude
Pentru fiecare sectiune, specifica:
- Layout desktop
- Layout tablet
- Layout mobile
- Ordine coloane pe mobile
- Elemente ascunse pe mobile, daca este cazul
- Modificari spacing
- Modificari typography
