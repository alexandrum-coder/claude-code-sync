---
name: minuta-sedinta-obsydia
description: |
  Redactează minute de ședință în formatul oficial Obsydia (șablon .docx cu antet
  și subsol pe fiecare pagină), pornind de la notițe brute sau de la un transcript.
  Use when the user asks, in Romanian or English, for any of: "minută",
  "minuta sedintei", "redactează o minută", "redacteaza o minuta", "scrie o minută",
  "fă-mi o minută", "fa-mi o minuta", "generează o minută ptr ședință în baza acestor
  notițe", "genereaza o minuta pentru sedinta pe baza notitelor", "am nevoie de o
  minută", "am nevoie de o minuta de sedinta", "minuta ședinței de azi", "minuta
  intalnirii", "proces-verbal de ședință", "PV de ședință", "notă de ședință",
  "raport de ședință", "transformă transcriptul în minută", "fă o minută din
  transcript", "scoate o minută din înregistrare", "rescrie minuta", "corectează
  minuta", "curăță minuta", "reformulează minuta", "verifică minuta față de
  transcript", "compară minuta cu transcriptul", "meeting minutes", "write the
  minutes", "turn these notes into minutes". Also use whenever raw meeting notes,
  a meeting transcript, or an existing draft minute is handed over with the intent
  of producing or fixing an official minute, even if the word "minută" is absent.
---

# Minută de ședință, formatul Obsydia

Produce o minută oficială, livrabilă unui client sau unei autorități publice, pe
șablonul de document Obsydia. Documentul poartă antetul și subsolul Obsydia pe
fiecare pagină, are o structură de secțiuni fixă și un stil de scriere strict.

Regula de fond: **minuta consemnează ce s-a stabilit, nu ce s-a discutat.**

## Tipuri de input

Skill-ul acceptă trei situații. Identifică-o pe cea potrivită înainte de a scrie.

| Input | Nivel de distilare | Ce faci |
|---|---|---|
| Notițe brute, deja structurate pe teme | Mic | Reformulezi fiecare notiță ca decizie. Nu inventezi puncte noi, nu comasezi teme distincte. |
| Transcript de ședință (auto-transcris, cu timestamp-uri, repetiții, digresiuni) | Mare | Extragi doar deciziile, acțiunile și termenele. Elimini negocierea, ezitările, temele abandonate. Un transcript de 40 de minute dă tipic 12-18 subiecte, nu 40. |
| Minută existentă, de rescris sau de verificat față de transcript | Variabil | Păstrezi ordinea și titlurile de secțiuni existente. Modifici doar ce cere utilizatorul. |

Pentru transcripturi auto-transcrise, traduse automat sau degradate: dacă un pasaj
nu se înțelege cu certitudine, **nu îl ghici**. Scrie punctul cu marcajul
`[de verificat]` și semnalează-l separat utilizatorului.

## Structura documentului, obligatorie

Ordinea secțiunilor și titlurile lor nu se schimbă:

1. **Titlu** (centrat, 16 pt, bleumarin `#1A2C54`, bold), forma
   `Minută ședință, <Subiect>`
2. **Bloc de identificare**, câte un rând, eticheta bold:
   - `Proiect:` numele proiectului
   - `Data:` `DD.MM.AAAA`
   - `Ora:` ora de început și durata
   - `Locație:` sala sau platforma
3. **`Participanți:`** urmat de două rânduri de listă, cu prefixele
   `Obsydia Software Solutions:` și `Reprezentanți <Client>:`.
   **Lasă valorile goale.** Lista de participanți se completează întotdeauna
   manual, în Pages, de către utilizator. Nu o completa niciodată, nici din
   transcript, nici din notițe, nici din ședințe anterioare.
4. **Obiectivul ședinței** (titlu de secțiune) — bullets, tipic 2
5. **Subiecte discutate** — listă numerotată; fiecare subiect are un titlu scurt
   bold bleumarin, apoi bullets
6. **Decizii agreate** — listă numerotată, o decizie per rând, frază completă
7. **Acțiuni următoare** — tabel cu trei coloane: `Acțiune | Responsabil | Termen`
8. **Pași următori** — un rând introductiv despre canalul de comunicare, apoi
   listă numerotată cu contactele planificate, în ordinea derulării

Titlurile de secțiuni sunt bold, 13 pt, bleumarin. Numerotările sunt manuale
(`1.  text`), nu stiluri Word de listă, fiindcă șablonul nu definește
`List Bullet`, `List Number` sau `Table Grid`.

Tabelul de acțiuni: antet cu fundal bleumarin `1A2C54` și text alb bold, borduri
subțiri gri `BFBFBF`, lățimi de coloană 10,4 cm / 3,0 cm / 3,6 cm. Responsabilul
este `Obsydia`, numele clientului, ori ambele. Termenul este concret
(`joi dimineața`, `până la finalul acestei săptămâni`, `a doua zi după ședință`)
sau `[de verificat]` când nu a fost stabilit.

## Reguli de scriere, obligatorii

### 1. Fara "s-a solicitat", scrie decizia direct

Aceasta este regula centrală. O minută nu relatează cine ce a cerut; ea
consemnează starea stabilită. Elimină complet, din tot documentul:

`s-a solicitat`, `s-a cerut`, `s-a cerut ca`, `a solicitat`, `ANR a cerut`,
`clientul a cerut`, `s-a stabilit că`, `s-a discutat despre`, `s-a menționat`,
`s-a propus`, `a fost solicitat`, `urmează să se solicite`.

Reformulează la modul indicativ, prezent, cu subiectul egal cu lucrul stabilit:

| Nu | Da |
|---|---|
| ANR a cerut ca noutățile să apară fără imagini | Noutățile apar la nivel de idei și titluri, fără imagini |
| S-a solicitat centrarea hărții | Harta se centrează în pagină |
| S-a stabilit că bannerul nu se înlocuiește | Bannerul multimedia rămâne neschimbat |
| S-au solicitat din partea ANR două elemente | ANR verifică subpunctele din Excel și transmite feedbackul |

Excepție unică: atribuirea rămâne când **cineva execută** o acțiune, nu când
cineva cere ceva. `Obsydia transmite un link de prezentare` este corect.
`Obsydia a cerut un link` nu este.

### 2. Bullets, nu paragrafe narative

Fiecare punct dintr-un subiect este un bullet de o singură idee. Fără paragrafe
de trei sau patru fraze. Dacă un subiect are patru idei, are patru bullets.
Regula se aplică și la `Obiectivul ședinței`.

### 3. Fiecare punct începe cu ce s-a stabilit

Primul cuvânt al bulletului este lucrul stabilit sau actorul care execută, nu
verbul de discuție. `Caruselul ia locul actual al secțiunii Comenzi rapide.`
Nu: `În ședință s-a discutat despre carusel, care...`.

### 4. Interdicții de formatare

- Zero liniuțe lungi și zero liniuțe medii. Folosește virgulă, punct sau două
  puncte.
- Ghilimele drepte `"..."`, nu ghilimele curbe românești.
- Zero emoji, zero iconițe, zero săgeți decorative.
- Diacritice românești corecte peste tot.

### 5. Ce nu se inventează

Nu adăuga conținut care nu apare în notițe, în transcript sau în răspunsurile
utilizatorului. Un termen nestabilit se scrie `[de verificat]`, nu se estimează.
Un nume nesigur se scrie `[de verificat]`, nu se completează din memorie.

## Pasul obligatoriu de humanizare

Înainte de a genera fișierul final, trece integral textul prin skill-ul
`obsydia-skills:humanizer`. Nu este opțional și nu se sare, nici la cererea
"fă repede".

Verificări minime după humanizare, pe textul final:
- fără limbaj promoțional și fără umplutură ("este important de menționat că",
  "merită subliniat faptul că")
- fără voce pasivă inutilă
- fără regula lui trei artificială și fără paralelisme negative
  ("nu doar X, ci și Y")
- fără liniuțe lungi

## Procedura de lucru

1. Citește integral inputul, notițe sau transcript. Nu lucra pe fragmente.
2. Extrage: subiectele, deciziile, acțiunile cu responsabil și termen, pașii
   următori. Marchează cu `[de verificat]` tot ce e incert.
3. Dacă inputul e un transcript și minuta va fi comparată cu o versiune
   existentă, prezintă întâi diferențele factuale ca întrebări cu variante de
   răspuns și așteaptă confirmarea, înainte de a genera fișierul.
4. Scrie textul aplicând regulile de mai sus.
5. Rulează humanizarea.
6. Construiește un fișier JSON cu conținutul și generează documentul:
   ```bash
   python3 scripts/build_minuta.py continut.json "Minuta_Subiect_10.08.2026.docx"
   ```
   Scriptul folosește `assets/sablon-obsydia.docx` ca bază, deci antetul și
   subsolul Obsydia se repetă automat pe fiecare pagină. Cere `python-docx`.
7. Scriptul tipărește la final un raport de verificare: desene în antet și
   subsol, rânduri în tabel, liniuțe lungi, ghilimele curbe, emoji, marcaje
   `[de verificat]`, formulări interzise. Dacă raportul nu se termină cu `OK`,
   corectează textul și regenerează.
8. Livrează fișierul și un rezumat scurt: ce subiecte au ieșit, câte acțiuni,
   ce a rămas `[de verificat]`.

Numele fișierului: `Minuta_Subiect_Cu_Underscore_DD.MM.AAAA.docx`. Pentru o
variantă verificată față de transcript, adaugă sufixul `_Verificata`. Nu
suprascrie niciodată un fișier existent, generează unul nou.

Schema JSON și detaliile exacte de formatare, pentru reconstrucție și fără
script: `references/structura-si-stil.md`.
