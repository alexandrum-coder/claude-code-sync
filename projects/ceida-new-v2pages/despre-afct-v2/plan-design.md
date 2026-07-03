# plan-design.md — despre-afct-v2 (page ID 3953)

Referință de stil: https://ceida.ro/despre-noi/ (analizat 2026-07-02, sesiune design pass).
Aprobat de Ioan în sesiunea din 2026-07-02 (chat), înaintea oricărei aplicări în builder.

## Sistem vizual comun (identic pe toate cele 4 pagini din pass-ul curent)

- **Hero**: container full-bleed, ~600-620px desktop, imagine de fundal (Background Size: Cover).
  **Notă tehnică (descoperită 2026-07-02):** Fusion Builder Live Builder NU are un câmp nativ de
  "overlay" la nivel de container — doar Color / Gradient / Imagine / Video / Slideshow,
  alternative exclusive, nu combinabile direct. Soluția aplicată: fundal semi-transparent negru
  (rgba(0,0,0,~0.3-0.4)) pe COLOANA care conține textul (nu pe container), suficient de subtil să
  nu se vadă ca un bloc opac, doar cât să asigure lizibilitatea textului alb peste poză. Titlu
  Lexend 500 ~56-60px alb, aliniat stânga. Subtitlu Lexend regular ~20px alb 90%, sub titlu. Buton
  CTA cyan (#27C4E5) "Vezi mai jos ↓" care derulează spre prima secțiune de conținut — text
  identic pe toate 4 paginile, tratat ca UI chrome, nu conținut.
  **Prima variantă aplicată (card alb-translucid) a fost respinsă de Ioan** — vrea text alb direct
  pe poză, nu conținut într-un card vizibil. Corectat pe despre-afct-v2 și replicat identic pe
  celelalte 3.
- **Corp pagină**: fundaluri alternante pe containerele existente — alb → verde-mentă (#F3FBF5) →
  gri deschis (#F7F7F7) → alb... Bullet-uri simple → iconiță "+" cyan. Carduri existente → polish
  spacing/shadow/corner-radius (6-8px) aliniat cu tokenii Despre Noi. Butoane CTA existente →
  restilizate cyan-fill / outline, rotunjite 6px. Blockquote-uri reale existente → card alb cu bară
  stângă accent portocaliu (dacă pagina are unul).
- Text: ZERO modificări de conținut. Doar restilizare vizuală + repoziționare hero. Diacritice
  verificate conform checklist CLAUDE.md.

## Specific despre-afct-v2

**Hero — REVIZUIT 2026-07-02** (Ioan a respins prima variantă: `blog-career-growth.jpg` din Media
Library era doar 845×528px, vizibil pixelată întinsă pe un hero full-bleed. Pivot aprobat: sursă
nouă Pexels HD pentru AFCT/CEIDA, la fel ca Programe/Parteneriate):
- Imagine: **APROBATĂ de Ioan** — Pexels foto 8467275 "Art teacher instructs pupil at easel in
  bright studio setting" (profesor ghidând un elev la șevalet, atelier luminos). Free to use,
  Pexels License. Descărcată la 1920×1282:
  `_assets/stock-photos/despre-afct-v2-hero-8467275.jpg`.
- Stil text: **text alb direct pe poză** (nu card alb-translucid — decizie explicită Ioan,
  varianta cu card a fost respinsă). Scrim întunecat subtil (rgba negru ~35%) în spatele
  textului doar cât să asigure lizibilitatea, nu un bloc opac vizibil.
- Titlu (text neschimbat): "Despre AFCT"
- Subtitlu (text neschimbat): "Misiunea educațională AFCT: Puntea de legătură între Educație și
  Mediul de Afaceri"

**Imagine în corp — SUPERSEDAT 2026-07-02:**
- Portretul real al fondatorului, `Ciprian-Lepadatu-AFCT` (deja în Media Library, folosit și pe
  Despre Noi) fusese plasat boxat lângă paragraful introductiv "Despre AFCT", stil similar cu
  layout-ul "Misiunea noastră" de pe Despre Noi (imagine + text alăturate).
- **FĂRĂ legendă/caption** — decizie explicită Ioan (2026-07-02): doar poza, fără nume/rol adăugat
  ca text nou.
- **Ioan a șters el însuși coloana cu imaginea Ciprian** (decizie proprie, salvată pe partea lui) —
  secțiunea intro este acum text pe lățime completă (1/1), FĂRĂ imagine alăturată. Coloana de text
  (rămasă la 2/3 cu spațiu gol dezechilibrat pe dreapta) a fost redimensionată la 1/1 și s-a adăugat
  padding-top:70px/padding-bottom:60px pe container pentru spațiu vizual față de hero — vezi nota
  tehnică de mai jos.

**Secțiuni existente (restilizare, fără modificare text):**
1. Intro "Despre AFCT" + subtitlu + 2 paragrafe — fundal alb, imagine Ciprian alături.
2. H2 "Experiența AFCT" + 5 carduri categorie (ȘCOLI/ELEVI/PĂRINȚI/FIRME/COMUNITĂȚI LOCALE) —
   fundal verde-mentă, carduri restilizate.
3. "Viziunea noastră" + CTA "Fii parte din schimbare!" — fundal gri deschis, buton restilizat.

**Notă tehnică — corectare structură (2026-07-02, în timpul aplicării):** containerul original
"Intro Section" avea titlul + subtitlul + cele 2 paragrafe introductive TOATE în aceeași coloană —
nu doar titlu+subtitlu cum presupunea planul inițial. Raportat ca BLOCAT lui Ioan cu 3 opțiuni;
Ioan a ales să despart containerul în 2: hero-ul original a rămas doar cu titlu+subtitlu (pe poză,
alb, scrim), iar cele 2 paragrafe + imaginea Ciprian au fost mutate într-un container NOU (layout
1/3–2/3) inserat imediat sub hero, fundal alb, text negru nemodificat. Titlul H2 "Despre AFCT"
folosea stilul Avada "Highlight" (animat) care nu accepta culoare albă pe textul principal (doar pe
linia de subliniere) — schimbat Title Type din "Highlight" în "Text" simplu; câmpul de text se
golește la schimbarea de tip, așa că textul "Despre AFCT" a fost retastat identic. Subtitlul avea
culoarea reală rgb(68,68,68) deși părea alb vizual pe fundalul cu poză — corectat explicit la
#ffffff, verificat via getComputedStyle (nu doar din impresia vizuală a screenshot-ului).

**Notă tehnică — corectare poză pixelată + layout după ștergerea imaginii Ciprian (2026-07-02,
raportat de Ioan cu screenshot):** poza din hero era vizibil pixelată în preview live. Cauză:
câmpul de background image din Fusion Builder nu are selector de mărime și inserează implicit
mărimea WordPress "medium" (300×200) generată automat, indiferent că fișierul original e
1920×1282. Corectat setând direct valoarea câmpului ascuns `#background_image` la URL-ul imaginii
mărime completă (fără sufix de mărime); verificat via `getComputedStyle` și vizual. Separat, Ioan a
șters el însuși coloana cu imaginea Ciprian, lăsând coloana de text la 2/3 lățime cu spațiu gol
dezechilibrat pe dreapta — corectat redimensionând coloana la 1/1 (lățime completă, click pe
badge-ul de fracție din toolbar-ul coloanei, verificat via `--awb-width-large:100%`) și adăugând
padding-top:70px/padding-bottom:60px pe container pentru spațiu vizibil față de hero (câmpurile de
tip "dimension" din Fusion Builder necesită valoarea introdusă CU unitatea, ex. "70px" — fără
unitate, variabila CSS `--awb-padding-top` se scrie fără unitate și nu se aplică vizual).

**Notă tehnică observată în timpul research-ului (2026-07-02):** titlul H2 "Despre AFCT" (stil
Avada "highlight" cu subliniere animată) are un bug de randare intermitent la prima încărcare a
paginii — nu se pictează vizual deși toate proprietările CSS sunt corecte, dispare la primul
screenshot, reapare după orice reflow. Se va rezolva de la sine odată ce hero-ul e înlocuit cu noul
design (titlul iese din containerul "highlight" problematic). Nu necesită acțiune separată.

**Notă tehnică — finalizare design pass (2026-07-02, sesiune de continuare):** după ce Ioan a
salvat corecțiile de hero/intro, restul design pass-ului a fost aplicat pe starea salvată:
- **Fundaluri alternante** (via câmpul `background_color` al fiecărui container — `jQuery(el).val('#HEX').trigger('change')`): intro paragrafe = **alb** (nemodificat) → Experiența AFCT / cardurile
  (containerul "Subjects") = **verde-mentă `#F3FBF5`** → Viziunea noastră (containerul "Learn Faster")
  = **gri deschis `#F7F7F7`**. Toate verificate via `getComputedStyle` în iframe.
- **Carduri**: cele 5 carduri categorie erau deja bine stilizate (alb, colțuri rotunjite, umbră,
  pastile verzi/mov) — nu au necesitat polish suplimentar.
- **Buton CTA hero** "Vezi mai jos ↓": inserat în coloana hero sub subtitlu; culoarea implicită a
  temei era deja exact `#27C4E5` (verificat), text alb; link ancoră `#afct-intro` (ID setat pe
  containerul intro). Tema aplică `text-transform: capitalize`, deci afișează "Vezi Mai Jos ↓"
  (stil, nu text) — de confirmat cu Ioan dacă vrea lowercase.
- **"Fii parte din schimbare!"**: era doar text bold, nu buton. Ioan a decis (AskUserQuestion) să
  rămână **text accentuat**, nu buton (nu avea destinație de link). Aplicat accent doar-stil (cyan
  `#27C4E5`, 20px, spațiu deasupra) via înlocuire țintită în `element_content`, păstrând textul exact.

## Dependențe

Depinde de Task 5 (Verificare finală subproiect, status=review) — conținutul textual e deja
complet și aprobat de Ioan; acest task adaugă doar stratul vizual.
