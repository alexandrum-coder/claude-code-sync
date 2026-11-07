---
name: task-verification
description: Use at the start of implementing any planned task and at each checkpoint, to verify the plan, the starting state, the decisions, the backup, the pilot, the stop conditions and the self-verification method before work begins, to verify evidence and planned-versus-done language while it proceeds, and to correct failures using the user's recorded past corrections. Three modes - preflight, checkpoint, correct. Returns a fixed-format verdict (GO, GO-CU-CONDIȚII, STOP) with evidence per check.
---

# Verificarea taskurilor planificate

Skill-ul se aplică unui task dintr-un plan scris. Verifică în trei moduri și întoarce întotdeauna verdictul în același format. Regulile vin din `references/INDEX.md` (R-01…R-223), iar corecțiile din trecut din `references/corectii-D.md` (intrări `K-NNN`). Ele nu se modifică de aici.

## Intrare

Calea planului, modul (`preflight`, `checkpoint` sau `correct`) și taskul verificat. Fără plan găsit pe disc, verdictul este STOP.

## Moduri

### `preflight`

Se rulează înainte de prima acțiune a taskului. Citește `references/checklist-preflight.md` și `references/clip.md`.

Verificările obișnuite: planul este cel mai recent pe subiect, starea de pornire este verificată, deciziile sunt închise, există backup, pilotul este definit, condițiile de oprire sunt scrise, fiecare acțiune este clasificată A, B sau C.

Trei verificări sunt blocante: `R-CLIP-1` (metoda de autoverificare scrisă), `R-CLIP-2` (cazurile de test enumerate pe roluri și stări) și `R-CLIP-4` (ciclul de autoverificare rămâne în limite sigure). Lipsa `R-CLIP-1` dă STOP. `R-CLIP-2` și `R-CLIP-4` dau STOP sau GO-CU-CONDIȚII, după cum precizează checklistul.

Un task care scrie sau modifică cod ori lucrează pe date de aplicație mai primește patru verificări. Natura taskului se stabilește din plan, cu `fișier:linie`. La orice alt task, rândurile lor apar cu PASS și dovada „nu se aplică”.

- Partea de cod din `R-CLIP-1`: mediu de test separat de producție, câte un cont de test pentru fiecare stare importantă (rol, plată, înregistrare terminată sau nu), folosite de agent singur, cu ciclul reluat până când funcția merge. Fără mediu separat sau fără niciun cont de test: STOP.
- `R-CLIP-5`: planul funcției este scris și discutat cu D înainte de orice cod. Lipsa lui dă FAIL.
- `R-CLIP-6`: accesul agentului la date și metrici (de exemplu prin MCP) este securizat, cu drepturi minime, acordul scris al clientului pentru datele lui și definiții scrise pentru măsuri. Lipsa acordului sau a verificării la un task care atinge date de client dă FAIL.
- `R-CLIP-7`: înainte de un skill nou se caută skill-ul existent pentru tipul de muncă, iar skill-urile se țin în biblioteca comună a echipei. Dă cel mult WARN.

### `checkpoint`

Se rulează după fiecare pas sau lot terminat. Citește `references/checklist-checkpoint.md` și `references/clip.md`.

Verifică dacă pasul făcut corespunde planului, dacă dovada este reală (citită după reîncărcare), dacă „făcut” nu înseamnă de fapt „planificat”, dacă nu s-a adăugat nimic necerut și dacă aprobarea este pentru lotul acesta. `R-CLIP-3` este verificarea de bază: nimic nu se prezintă utilizatorului înainte ca ciclul de autoverificare să fi trecut.

### `correct`

Se rulează după un `preflight` sau un `checkpoint` cu FAIL sau WARN. Pentru fiecare, caută în `references/corectii-D.md` intrările `K-NNN` cu o situație asemănătoare și aplică forma de corecție din ele, cu regula `R-NN` aferentă.

Limite:

- Poate corecta direct doar planul verificat, handoff-ul și fișierele de lucru ale taskului, toate locale și numite în secțiunea „Fișiere” a taskului.
- Înainte de fiecare editare face o copie `<fisier>.inainte-de-corectie-<AAAAMMDD-HHMM>` lângă original.
- Orice alt fișier existent primește doar un patch propus (categoria C).
- Orice acțiune pe un sistem live sau extern primește doar o propunere în forma categoriei B: obiect, valoare veche, valoare nouă, motiv.
- Decizia nu este a verificatorului: o alegere care aparține utilizatorului ajunge la el ca întrebare grilă, cu recomandarea prima.
- Fiecare corecție aplicată se consemnează în raport: fișier, linia veche → linia nouă, `R-NN`, `K-NNN`.

## Formatul verdictului

Fix, în această formă:

```
VERDICT: GO | GO-CU-CONDIȚII | STOP
| # | Verificare | Rezultat (PASS/WARN/FAIL/NEVERIFICAT) | Dovadă (fișier:linie sau comandă → rezultat) |
Blocante: …  ·  Întrebări pentru D (grilă, recomandarea prima): …
Corecții aplicate (modul correct): | fișier | vechi → nou | R-NN | K-NNN | copie de siguranță |
Corecții propuse, neaplicate (categoria B/C): …
```

Un rezultat PASS cere dovadă. Ce nu a fost observat direct rămâne NEVERIFICAT (R-121), nu PASS.

## Referințe

- `references/checklist-preflight.md`: verificările de pornire, clasificarea A/B/C, cele trei verificări blocante și `R-CLIP-5…7` pentru taskurile de cod și date.
- `references/checklist-checkpoint.md`: verificările de după pas și `R-CLIP-3`.
- `references/clip.md`: sursa ideilor din spatele `R-CLIP-1…7`, cu marcaje de timp.
- `references/INDEX.md`: indexul regulilor R-01…R-223, cu fișierele tematice alături.
- `references/corectii-D.md`: corpusul de corecții `K-NNN`.
