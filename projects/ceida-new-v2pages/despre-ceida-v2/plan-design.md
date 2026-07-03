# plan-design.md — despre-ceida-v2 (page ID 3964)

Referință de stil: https://ceida.ro/despre-noi/ (analizat 2026-07-02, sesiune design pass).
Aprobat de Ioan în sesiunea din 2026-07-02 (chat), înaintea oricărei aplicări în builder.

## Sistem vizual comun

Vezi [despre-afct-v2/plan-design.md](../despre-afct-v2/plan-design.md) secțiunea "Sistem vizual
comun" — identic pe toate cele 4 pagini din pass-ul curent (hero full-bleed + overlay + titlu/
subtitlu/CTA, fundaluri alternante, bullet-uri "+", carduri/butoane restilizate, quote-card pentru
blockquote-uri reale).

## Specific despre-ceida-v2

**Hero — REVIZUIT 2026-07-02** (pivot de la Media Library la stock nou Pexels HD, ca la AFCT —
vezi nota din despre-afct-v2/plan-design.md):
- Imagine: **APROBATĂ de Ioan** — Pexels foto 36731538 "Pottery class with instructor guiding
  student" (instructor senior ghidând un elev tânăr la lutul olarului). Free to use, Pexels
  License. Descărcată la 1920×1080: `_assets/stock-photos/despre-ceida-v2-hero-36731538.jpg`.
- Stil text: **text alb direct pe poză** + scrim negru subtil pe coloană (rgba(0,0,0,~0.35)) pentru
  lizibilitate — identic tehnic cu despre-afct-v2, nu card alb.
- Titlu (text neschimbat): "Despre CEIDA"
- Subtitlu (text neschimbat): "Formăm caractere și creștem meseriași!"

**Imagine în corp:**
- **APROBATĂ de Ioan** — Pexels foto 7692557 "A teacher in a pink blazer smiles while guiding a
  student at a desk in an eco-friendly classroom" (profesoară + elevă, sală colorată). Free to
  use, Pexels License. Descărcată la 1920×2880:
  `_assets/stock-photos/despre-ceida-v2-corp-7692557.jpg`. Plasată lângă secțiunea "Podul dintre
  educație și piața muncii".

**Secțiuni existente (restilizare, fără modificare text):**
1. Hero (Despre CEIDA) → Podul dintre educație și piața muncii → Dinamică pentru comunitate —
   fundal alb, a 2-a imagine alături de Podul.
2. Pilonii educaționali CEIDA — Valorile MSCP (grid 4 carduri) — fundal verde-mentă, carduri
   restilizate.
3. Un model educațional pentru Europa + Viziunea Europeană (4 subsecțiuni H3) + Inovație
   Trans-Tematică + De la local la politică publică — fundal gri deschis / alb alternat.
4. **Manifestul CEIDA pentru Tineri** — blockquote real existent ("Nu trebuie să știi tot...") →
   restilizat ca și card-citat (bară stângă portocalie + atribuire), exact pattern-ul "Misiunea
   noastră" de pe Despre Noi. Zero text nou — doar restilizare a blockquote-ului deja existent.
5. Transparență și Încredere — fundal final, buton/CTA dacă există restilizat.

**Notă tehnică — hero aplicat (2026-07-02):** hero-ul construit de la zero cu tehnica corectată
(dovedită pe AFCT). Structura originală "Intro Section" avea titlu + subtitlu + tagline + un bloc
mare de conținut ("Podul dintre educație...") toate în aceeași coloană. Rezolvat prin **clonarea
containerului** (păstrează totul exact, zero copiere/retastare de text client), apoi ștergere
selectivă: prima copie (hero) = Title + subtitlu + tagline; a doua copie (body, alb, id
`ceida-intro`) = doar blocul de conținut. Hero: poză Pexels 36731538 la rezoluție completă (id
Media Library 4028, `background_type=image`, size cover), scrim `rgba(0,0,0,0.35)` pe coloană,
titlu (Title Type schimbat din Highlight în Text, retastat "Despre CEIDA") + subtitlu + tagline
toate albe (verificat getComputedStyle), înălțime ~596px via padding container 150/150 (câmpul
Minimum Height era `display:none` în context, evitat), buton CTA "Vezi mai jos ↓" cyan #27C4E5
centrat cu ancoră `#ceida-intro`. Restul paginii (Subjects/valori, "Un model educațional pentru
Europa") neatins. Fundaluri alternante + carduri + imagine corp = rundă viitoare (acum doar hero).

## Dependențe

Depinde de Task 8 (Verificare finală subproiect). **Notă live:** tasks.json arată toate task-urile
1-8 ca `pending`, dar conform memoriei de proiect (`project_ceida-v2-pages.md`), pagina e de fapt
content-complete, construită 2026-06-29 — tasks.json e cunoscut ca STALE pentru această pagină.
Task-ul nou de design nu corectează retroactiv statusurile vechi (în afara scopului sesiunii
curente); se bazează pe starea reală (content done) confirmată în memorie.
