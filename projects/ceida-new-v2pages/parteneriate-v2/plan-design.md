# plan-design.md — parteneriate-v2 (page ID 4019)

Referință de stil: https://ceida.ro/despre-noi/ (analizat 2026-07-02, sesiune design pass).
Aprobat de Ioan în sesiunea din 2026-07-02 (chat), înaintea oricărei aplicări în builder.

## Sistem vizual comun

Vezi [despre-afct-v2/plan-design.md](../despre-afct-v2/plan-design.md) secțiunea "Sistem vizual
comun" — identic pe toate cele 4 pagini din pass-ul curent.

## Specific parteneriate-v2

**Imagini — a doua pagină (cu programe-impact-v2) unde Media Library nu are nicio potrivire
tematică** (nimic despre B2B, autorități locale sau voluntariat în biblioteca existentă). Ioan a
aprobat explicit (2026-07-02) sursă nouă: stock cu licență liberă (Unsplash/Pexels), 2 poze,
fiecare cu aprobare explicită pe fișier înainte de descărcare.

**Hero:**
- Imagine: **APROBATĂ de Ioan (2026-07-02)** — Pexels foto 4344114 "People on a Business Meeting"
  (4 profesioniști la masă de conferință, tonuri calde neutre, unghi larg de sus). Free to use,
  Pexels License, fără atribuire necesară. Descărcată local:
  `_assets/stock-photos/parteneriate-v2-hero-4344114.jpg` (1920×1280).
- Titlu (text neschimbat): "PARTENERIATE (B2B, Autorități, Voluntariat)"
- **Fără subtitlu** — decizie deja aprobată anterior de Ioan (subtitlul a fost șters, nu se
  înlocuiește cu text nou, conform REGULA 1.5).

**Imagine în corp:**
- **APROBATĂ de Ioan (2026-07-02)** — Pexels foto 36765717 "Business Team Collaborating in Modern
  Office" (3 colegi discutând pe tabletă, fundal lemn cald). Free to use, Pexels License.
  Descărcată local: `_assets/stock-photos/parteneriate-v2-corp-36765717.jpg` (1920×1080). Plasată
  lângă secțiunea "Pentru Companii".

**Secțiuni existente (restilizare, fără modificare text):**
1. Hero "PARTENERIATE..." + "Pentru Primării: Transformați localitatea într-un hub economic" —
   fundal alb.
2. "Pentru Companii: Formați-vă viitoarea forță de muncă" — fundal verde-mentă, imagine stock #2
   alături.
3. "Pentru Mentori: Experiența ta le poate schimba viața" + accordion 5 perechi obiecție/răspuns
   (`<details>`) — fundal gri deschis; accordion rămâne funcțional, doar restilizat vizual (card
   alb, shadow, spacing) — zero modificare conținut.

**Blocker existent, nelegat de acest task:** cele 3 butoane CTA (Solicită parteneriatul.../Devino
Partener AFCT/Vreau să devin Mentor) au `href="#"`, fără URL real — documentul nu specifică unul.
Rămâne pending decizia lui Ioan (posibil ancorate spre radio-butoanele corespunzătoare din
contact-v2). Restilizarea vizuală a butoanelor (culoare/formă) se aplică oricum, indiferent de URL.

## Dependențe

Depinde de Task 5 (Verificare finală subproiect, status=done — singura dintre cele 4 pagini cu
tasks.json exact la zi).
