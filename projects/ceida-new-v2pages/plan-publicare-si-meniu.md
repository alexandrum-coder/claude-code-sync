# Plan — Publicare pagini V2 + actualizare Meniu Principal

Status: **CONFIRMAT DE IOAN 2026-07-02 — gata de execuție într-o sesiune nouă.**
Cercetare făcută 2026-07-02 (stare curentă verificată live pe ceida.ro + wp-admin).

## 0. Confirmări explicite primite de la Ioan (2026-07-02)

- **Ordinea finală a meniului** (include "Susține", poziționat între Parteneriate și
  Întrebări Frecvente — vezi secțiunea 1, actualizată):
  `Acasa | Despre Noi | Despre AFCT | Despre CEIDA | Programe & Impact | CEIDA în Lume |
  Parteneriate | Susține | Întrebări Frecvente | Contact`
- **Decizia A** (slug fără "-v2" pe paginile noi) — acceptată ca parte din "confirm planul".
- **Decizia B1** (redenumire slug pagini vechi FAQ/Contact ca să elibereze `/faq/` și
  `/contact/`) — **confirmată EXPLICIT separat** (întrebare dedicată, dat fiind că
  CLAUDE.md are regula absolută "nu te atingi de nicio pagină existentă"). Tratată ca
  excepție aprobată explicit, analog cu excepția de hero din REGULA 1.0.
- **Decizia C** (dropdown "Susține" rămâne) — confirmată, cu poziție exactă precizată de
  Ioan (după Parteneriate, înainte de Întrebări Frecvente) — vezi secțiunea 1.

## 1. Stare curentă (research)

### Pagini V2 — toate NEPUBLICATE încă
| Pagină | ID | Slug | Status curent |
|---|---|---|---|
| despre-afct-v2 | 3953 | `despre-afct-v2` | **Privat** |
| despre-ceida-v2 | 3964 | `despre-ceida-v2` | **Ciornă** |
| programe-impact-v2 | 3968 | `programe-impact-v2` | **Ciornă** |
| Parteneriate V2 | 4019 | `parteneriate-v2` | **Ciornă** |
| FAQ-V2 | 3978 | `faq-v2` | **Ciornă** |
| Contact-V2 | 4012 | `contact-v2` | **Ciornă** |

Important: nefiind publicate, aceste pagini sunt vizibile acum DOAR pentru utilizatori
autentificați ca admin (motiv pentru care testele din sesiunile anterioare au funcționat
la URL-ul canonic) — un vizitator normal ar primi acum pagină inexistentă/privată.

### Meniul principal actual ("Meniu principal (Main Navigation)", menu ID 101)
```
Acasa (pg 3457)
Despre noi (pg 3539)
CEIDA în lume (pg 3559)
Susține  [dropdown, link "#"]
  ├─ Donează (pg 3480)
  ├─ Redirecționează 3.5% (pg 3786)
  └─ Redirecționează 20% (pg 3752)
FAQ (pg 3583, slug `faq`, PUBLICATĂ)
Contact (pg 2981, slug `contact`, PUBLICATĂ)
```

### Meniul principal țintă (confirmat FINAL de Ioan, include Susține)
```
Acasa | Despre Noi | Despre AFCT | Despre CEIDA | Programe & Impact |
CEIDA în Lume | Parteneriate | Susține | Întrebări Frecvente | Contact
```
(Dropdown-ul "Susține" — Donează / Redirecționează 3.5% / Redirecționează 20% — rămâne
neschimbat ca structură internă, doar se repoziționează în listă conform ordinii de mai sus.)

### Verificare conflicte de slug (pentru redenumire fără "-v2")
- `/despre-afct/` → 404 (liber)
- `/despre-ceida/` → 404 (liber)
- `/programe-impact/` → 404 (liber)
- `/parteneriate/` → 404 (liber)
- `/faq/` → **OCUPAT** de pagina veche FAQ (pg 3583, publicată)
- `/contact/` → **OCUPAT** de pagina veche Contact (pg 2981, publicată)

## 2. Decizii (toate confirmate — vezi secțiunea 0)

**A. Slug final al paginilor noi — FĂRĂ "-v2".**
URL-uri finale: `/despre-afct/`, `/despre-ceida/`, `/programe-impact/`, `/parteneriate/`,
`/faq/`, `/contact/`.

**B. Paginile VECHI FAQ (`/faq/`) și Contact (`/contact/`) — decizia B1 confirmată.**
Redenumesc slug-ul paginilor vechi (ex: `faq` → `faq-old-2026`, `contact` →
`contact-old-2026`) și le trec pe "Nepublicat" (nu se șterg, rămân ca arhivă), apoi
eliberez sloganele `faq` / `contact` pentru paginile noi FAQ-V2 și Contact-V2.
**Excepție explicit aprobată de Ioan la regula CLAUDE.md "nu te atingi de nicio pagină
existentă"** — tratată analog cu excepția de hero din REGULA 1.0.

**C. Dropdown-ul "Susține"** — rămâne neschimbat ca structură, repoziționat conform
ordinii finale confirmate (secțiunea 1).

**D. despre-afct-v2 e "Privat" (nu Ciornă ca restul)** — la publicare, se comportă la fel
(devine Public), doar pornea dintr-un status diferit. Nu schimbă planul.

## 3. Plan de execuție — PRIORITIZAT AUTOMATIZAT (browser-harness)

Ordinea contează (unele pași depind de anteriorul):

1. **Redenumire sloganele paginilor vechi** (dacă alegi B1): editez slug-ul FAQ (3583) și
   Contact (2981) din editorul WP, salvez.
2. **Redenumire sloganele paginilor noi** (dacă alegi A): editez slug pe cele 6 pagini V2,
   eliminând "-v2" (FAQ-V2 → `faq`, Contact-V2 → `contact`, restul → fără "-v2").
3. **Publicare** — pentru fiecare din cele 6 pagini: schimb statusul din
   Draft/Privat → Publicat (buton "Publică"/"Editează" status din caseta Publicare a
   editorului WP, sau din lista "Toate paginile" cu Bulk Edit pentru viteză).
4. **Verificare live** — vizitez fiecare URL final (fără autentificare, sesiune curată sau
   mod incognito) ca să confirm că răspunde 200 și arată corect, nu doar pentru admin.
5. **Actualizare meniu** (`wp-admin/nav-menus.php?action=edit&menu=101`):
   a. Adaug 4 pagini noi în meniu (bifez checkbox-urile lor în panoul "Pagini" din stânga,
      click "Adaugă în meniu") — apar la finalul listei.
   b. Redenumesc eticheta de navigare (Navigation Label) a fiecărei, EXACT ca în cererea
      ta: "Despre AFCT", "Despre CEIDA", "Programe & Impact", "Parteneriate".
   c. Reordonez prin drag-and-drop (simulat via evenimente mouse CDP) astfel încât
      structura finală să fie: Acasa → Despre Noi → Despre AFCT → Despre CEIDA →
      Programe & Impact → CEIDA în Lume → Parteneriate → Susține (dropdown, neschimbat)
      → Întrebări Frecvente → Contact.
   d. Redenumesc eticheta itemului FAQ existent → "Întrebări Frecvente" (dacă B1: itemul
      FAQ rămâne legat la aceeași pagină fizică, doar slug-ul ei s-a schimbat pe dinăuntru
      — link-ul din meniu nu trebuie umblat, WP urmărește ID-ul paginii, nu slug-ul).
   e. Salvez meniul.
6. **Verificare finală** — parcurg meniul live (fără edit mode) și dau click pe fiecare
   item, confirmând destinația corectă și ordinea vizuală identică cu cererea ta.

## 4. Cum se leagă manual o pagină nouă în meniu (pentru referință / dacă vrei să o faci tu)

1. WP Admin → **Aspect → Meniuri** (`wp-admin/nav-menus.php`).
2. Din selectorul de sus, alege **"Meniu principal (Main Navigation)"** → Selectează.
3. În coloana stângă "Adaugă elemente de meniu" → panoul **Pagini** → tab "Vezi tot" sau
   "Caută" → bifează checkbox-ul paginii dorite (ex: despre-afct-v2).
4. Click **"Adaugă în meniu"** — pagina apare ca element nou la finalul listei din
   "Structură meniu" (coloana dreaptă).
5. Trage elementul (drag handle, cursorul de "mutare") în poziția dorită în listă — ordinea
   verticală = ordinea din meniul afișat pe site.
6. Click pe săgeata din dreapta elementului ca să extinzi opțiunile lui — acolo poți
   schimba **"Etichetă de navigare"** (textul afișat în meniu, poate diferi de titlul real
   al paginii — exact mecanismul prin care "FAQ" poate deveni "Întrebări Frecvente" fără
   să redenumești pagina însăși).
7. Pentru sub-meniu (dropdown, ca "Susține"): tragi elementul ușor spre dreapta sub
   părintele dorit — devine element de nivel 1 (indentat).
8. Click **"Salvează meniul"** (buton albastru, jos) — esențial, altfel toate modificările
   se pierd la ieșirea din pagină.

## 5. Riscuri / lucruri de care am grijă la execuție

- Nu ating paginile "Acasa", "Despre noi", "CEIDA în lume" — rămân exact cum sunt.
- Redenumirea de slug pe o pagină deja indexată (FAQ, Contact) poate afecta temporar SEO
  dacă Google a indexat vechiul URL — dar cum conținutul NOU preia exact același slug,
  impactul e minim (nu există URL mort, doar conținutul de la acel URL se schimbă).
- Verific fiecare pagină publicată într-o fereastră fără autentificare (incognito/sesiune
  curată) înainte să declar task-ul complet — ca să confirm ce vede efectiv un vizitator,
  nu ce văd eu ca admin.
- Nu șterg nimic definitiv fără aprobare explicită suplimentară (opțiunea B3 rămâne
  neexecutată implicit).
