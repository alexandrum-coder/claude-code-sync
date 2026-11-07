---
name: podcast-fisa-obsydia
description: Transformă un podcast de business de pe YouTube într-o fișă de episod verificabilă pentru biblioteca „Obsydia - Canale de dezvoltare”, apoi, după confirmarea utilizatorului, actualizează paginile comune (tipare, sisteme de evaluare, moduri de lucru, agenți, tooluri interne, cărți). Folosește-l când utilizatorul trimite un link de podcast sau episod și cere fișă, extragere, documentare, „podcast nou”, „episod nou”, „adaugă în bibliotecă” sau „ce învățăm din clipul ăsta” pentru Obsydia. Nu-l folosi pentru site-ul Obsydia, pentru RH fRame sau pentru rezumate rapide fără bibliotecă.
---

# Podcast la fișă, pentru Obsydia

Transformi un episod de podcast într-o fișă pe categorii fixe, în care fiecare idee se poate verifica în clip, apoi alimentezi paginile comune ale bibliotecii. Formatul a fost aprobat de utilizator pe primul episod. Îl copiezi, nu îl reinventezi.

## Context fix

- Rădăcina: `/Users/pixelpoetry/Claude Cowork/Tools/Obsydia - Canale de dezvoltare`. Toate căile de mai jos sunt relative la ea. Dacă sesiunea a pornit în alt folder, rulează fiecare comandă după `cd` în rădăcină.
- Specificația: `design-sistem-podcasturi.md`. Modelul de fișă aprobat: `surse/2026-05-31-ideas-chat-valentin-radu/fisa-episod.md`. Citește-le pe amândouă înainte de pasul 4.
- Contextul Obsydia confirmat de utilizator: firmă la început, un singur client, câștigat prin licitație, creștere organică dorită prin site portofoliu și LinkedIn, încă nepuse la punct. Nu adăuga nimic peste asta fără confirmarea utilizatorului.

## Reguli care nu se negociază

- Scrie în română, cu „sunt”. Forma cu â nu apare nicăieri.
- Nu inventa metrici, clienți, rezultate sau fapte despre Obsydia.
- Ideile se reformulează. Validatorul respinge orice secvență de 12 cuvinte copiată din transcriere.
- Numele, cifrele și titlurile vin din subtitrări automate, deci pot fi greșite. Tot ce nu poți verifica primește `[neverificat]`.
- Transcrierea rămâne locală și nu se publică nicăieri.
- Eticheta „Pentru Obsydia” descrie relevanța, nu declanșează nimic. Din `agenti.md` și `tooluri-interne.md` nu se construiește nimic fără o decizie separată a utilizatorului.
- Nu atingi site-ul Obsydia, RH fRame sau alte foldere din afara rădăcinii.
- Nu suprascrii un folder din `surse/` care există deja.

## Pași

După fiecare pas scrie o linie `✅ <ce s-a terminat>`.

### 1. Metadate

```bash
yt-dlp --skip-download --dump-json "<URL>" > "<scratchpad>/yt-<ID>/meta.json"
```

Din JSON iei `title`, `channel`, `upload_date`, `duration` (secunde) și limba. Slug-ul folderului: `AAAA-LL-ZZ-<emisiune>-<invitat>`, cu litere mici, fără diacritice, cu cratime, de exemplu `2026-05-31-ideas-chat-valentin-radu`. Dacă `surse/<slug>/` există, oprește-te și întreabă.

### 2. Subtitrări

```bash
yt-dlp --skip-download --write-auto-subs --sub-langs "<limba>-orig,<limba>" --sub-format vtt -o "<scratchpad>/yt-<ID>/<ID>" "<URL>"
```

`<limba>` e limba vorbită în episod (`ro`, `en`). Preferă varianta `-orig`, pentru că cealaltă poate fi traducere automată. Dacă nu există subtitrări în limba episodului, oprește-te și spune-i utilizatorului.

### 3. Transcriere

```bash
python3 -I scripts/curata_vtt.py "<scratchpad>/yt-<ID>/<ID>.<limba>.vtt" "surse/<slug>/transcriere.txt" 60
shasum -a 256 "surse/<slug>/transcriere.txt"
```

Rezultatul are blocuri de 60 de secunde, fiecare cu marcajul `[0:MM:00]`. Notează hash-ul și numărul de blocuri în `rulari-teste.log`.

### 4. Citește tot episodul

Citește toate blocurile, nu doar un eșantion. Notează segmentele sponsorizate, teaserul de la început și reclamele. Nu le folosești ca sursă și le numești în antetul fișei.

### 5. Scrie `surse/<slug>/fisa-episod.md`

Copiază structura fișei aprobate:

1. Titlu `# Fișa episodului: <emisiune> cu <invitat>`.
2. Antet: invitat și firma lui, link, data publicării, durata, calitatea transcrierii (subtitrări automate, blocuri de 60 de secunde, fără nume de vorbitori, nume deformate observate).
3. Contextul invitatului, din episod: stadiu, mărime, tip de clienți. Contextul Obsydia, exact cum e mai sus.
4. Paragraful „Cum se citește” și segmentele excluse.
5. Opțional, „Ce cântărește cel mai mult pentru Obsydia” `[DEDUS]`: cel mult patru idei, cu motivul.
6. Câte o secțiune `## <Categorie>`, cu exact aceste titluri și în această ordine: Business și strategie; Clienți și vânzări; Produs; Echipă și angajări; Decizii și mod de gândire; Agenți și AI; Tooluri; Cărți și resurse. O categorie poate rămâne fără rânduri dacă episodul nu are nimic pentru ea. Nu inventa rânduri ca s-o umpli.
7. Fiecare secțiune are tabelul:

```markdown
| Minut | Sursă | Ideea | Context | Pentru Obsydia |
|---|---|---|---|---|
| 06:00 | [SPUS] | <idee reformulată> | <în ce condiții a mers la invitat> | acum: <motivul într-o propoziție> |
```

- Minutul e începutul blocului din transcriere (`MM:00`), deci e aproximativ.
- Sursa e `[SPUS]` pentru ce spune invitatul și `[DEDUS]` pentru concluziile tale. Ce spune moderatorul nu e `[SPUS]` al invitatului; precizează asta în Context.
- Eticheta e `acum:`, `mai târziu:` sau `nu:`, urmată de motiv.
- Ideea și Contextul nu rămân goale. Rândurile nu au indentare.
- Acoperă tot episodul: fiecare interval de 10 minute de după minutul 2 are cel puțin un rând `[SPUS]`.
- Două rânduri cu aceeași idee au aceeași etichetă.

### 6. Validează

```bash
python3 scripts/test_verifica_fisa.py
python3 scripts/verifica_fisa.py "surse/<slug>/fisa-episod.md" "surse/<slug>/transcriere.txt" $(grep -c '^\[' "surse/<slug>/transcriere.txt")
```

Al treilea argument e numărul de blocuri din transcriere, nu durata rotunjită în sus. Un episod de 20:01 are 20 de blocuri, iar 21 ar cere idei într-un interval fără transcriere.

Ținta e „Ran 26 tests … OK” și `0 erori`. Corectează fișa, nu validatorul. Adaugă comenzile și rezultatul în `rulari-teste.log`, cu data și ora.

### 7. Verifică sensul

Pentru fiecare rând `[SPUS]`, deschide blocul de la minutul lui și confirmă că invitatul spune asta acolo, sau în blocul vecin. Dacă ai un tool de subagent, cere unui revizuitor independent aceeași verificare. Corectează nepotrivirile de minut și de sens.

### 8. Oprește-te pentru confirmare

Arată-i utilizatorului: calea fișei, numărul de rânduri pe categorii (`[SPUS]` și `[DEDUS]`), rezultatul validatorului, cele mai importante trei idei pentru Obsydia și tot ce e `[neverificat]`. Întreabă dacă fișa e bună. Nu atinge paginile comune până nu primești un „da”.

### 9. Actualizează paginile comune

Doar după confirmare. În fiecare pagină, sursa se scrie `<Nume de familie al invitatului>, min N`.

- `tipare.md`: dacă episodul susține un tipar existent și sursa e independentă (alt invitat, altă firmă), adaugă sursa și treci tiparul la `confirmat`. Dacă îl contrazice, notează contradicția lângă tipar, fără să alegi tu. Tiparele noi intră ca `candidat`. Actualizează rândul „Surse până acum”.
- `sisteme-evaluare.md`: adaugă o fișă nouă doar dacă episodul dă un criteriu sau o listă de verificare folosibilă la o decizie reală. Altfel, completează sursa unei fișe existente.
- `moduri-de-lucru.md`, `agenti.md`, `tooluri-interne.md`, `carti.md`: adaugă rânduri în tabelele existente, cu aceleași coloane. Cărțile sugerate de tine sunt `[DEDUS]` și `[neverificat]`.
- Nu șterge și nu reformula rândurile venite din episoadele anterioare.

Apoi verifică paginile cu acest script, rulat din rădăcină:

```bash
python3 -I - <<'PY'
interzis = "s" + chr(0xE2) + "nt"
for p in ("tipare.md","sisteme-evaluare.md","moduri-de-lucru.md","agenti.md","tooluri-interne.md","carti.md"):
    s = open(p, encoding="utf-8").read()
    print(p, "forma interzisă:", s.lower().count(interzis))
PY
```

Ținta e 0 pe fiecare pagină. Verifică manual că fiecare minut citat pentru episodul nou există în transcrierea lui.

## Când te oprești și întrebi

- Folderul `surse/<slug>/` există deja.
- Episodul nu are subtitrări în limba lui.
- Episodul nu e despre business, sau invitatul nu vorbește din experiență proprie.
- Validatorul nu ajunge la `0 erori` după două runde de corecturi.
- Ai nevoie de un fapt despre Obsydia care nu e în contextul fix.
- Orice pas ar atinge ceva din afara rădăcinii.

## Gata când

- `surse/<slug>/transcriere.txt` și `fisa-episod.md` există, iar hash-ul e notat.
- Testele trec, validatorul dă `0 erori`, iar rezultatul e în `rulari-teste.log`.
- Fiecare rând `[SPUS]` a fost comparat cu blocul lui.
- Utilizatorul a confirmat fișa, iar paginile comune au sursa nouă și forma interzisă apare de 0 ori.
