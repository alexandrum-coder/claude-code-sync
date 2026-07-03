# CLAUDE.md — Proiect: ceida-new-v2pages
# CMS: WordPress — https://ceida.ro
# Versiune: 3.8 — Regula 0.3 eliminata, reguli renumerotate 0.1-0.4 (2026-06-29)

---

## REGULA 0.1 — LUCREZ CONFORM PLANULUI, CAND MA BLOCHEZ INTREB — REGULA ABSOLUTA

Lucrez conform planului aprobat si regulilor din CLAUDE.md.
Daca planul e clar, regulile sunt respectate si nu apar blocaje → execut fara intreruperi inutile.

Daca apare orice problema tehnica, situatie neasteptata sau blocare:
STOP imediat.
Raportez exact: "BLOCAT — [descriere problema]. Optiunile posibile sunt: [A] / [B] / [C]. Care procedam?"
ASTEPT decizia lui Ioan.

Nu decid singur cum sa rezolv o problema. Nu improvizez solutii. Nu schimb metoda fara aprobare.
Orice schimbare de plan sau metoda necesita aprobare explicita scrisa din partea lui Ioan.

---

## REGULA 0.2 — CREDENTIALE WORDPRESS — REGULA ABSOLUTA

Username permis: EXCLUSIV `alexandru` sau `Alexandru`.
NU incerci acces cu alti utilizatori (adminCeida, ciprian, gabi sau orice altul).
Ceilalti utilizatori sunt OFF LIMITS — nu se testeaza, nu se folosesc, nu se discuta ca optiune.
Daca credentialele furnizate de Ioan nu functioneaza: RAPORTEZI exact eroarea si ASTEPTI noi credentiale de la Ioan.
Nu improvizezi, nu testezi alte useruri, nu incerci variante alternative fara aprobarea lui Ioan.

---

## REGULA 0.3 — CHILD THEME — REGULA ABSOLUTA, ZERO EXCEPTII

Orice modificare de tema se face EXCLUSIV pe Child Theme-ul Avada, NICIODATA pe tema parinte (Avada parent).

NU AI VOIE SA ATINGI TEMA PARINTE AVADA IN NICIUN FEL.

Motivatie critica:
    - Daca ceva se strica pe Child Theme => se poate recupera
    - Daca ceva se strica pe tema parinte Avada => NU se poate recupera, site-ul poate fi distrus permanent

Verificare obligatorie inainte de orice sesiune de lucru in wp-admin / Fusion Builder:
    1. Confirm vizual ca sunt pe Child Theme (Appearance -> Themes -> Child Theme activ)
    2. Fusion Builder folosit = builder-ul din Child Theme, NU din tema parinte
    3. Live Builder = al Child Theme, nu al WordPress sau al temei parinte Avada
    4. Daca nu pot confirma ca sunt pe Child Theme: STOP — raportez lui Ioan si astept confirmare

Daca orice actiune ar putea afecta tema parinte:
    OPRESC imediat.
    Raportez: "ATENTIE — actiunea [X] ar putea afecta tema parinte. Cer confirmare inainte de a continua."
    Astept aprobarea explicita a lui Ioan.

---

## REGULA 0.4 — TEMA AVADA — REGULA ABSOLUTA, ZERO EXCEPTII

Tema ceida.ro este AVADA cu Fusion Builder (confirmat 2026-06-27, pagina ID 3953).

NU AI VOIE SA INJECTEZI HTML SIMPLU PESTE TEMA AVADA.
NU AI VOIE SA FACI NICIO MODIFICARE CARE AR PUTEA AFECTA TEMA AVADA SAU LAYOUT-UL AVADA.

Continutul paginilor este stocat ca shortcode-uri Avada Fusion Builder.
Injectarea de HTML simplu in campul `content` via REST API DISTRUGE layout-ul Avada.

Singurele metode permise de editare a continutului:
    1. Prin wp-admin → editorul paginii → Avada Fusion Builder (interfata vizuala)
    2. Via REST API EXCLUSIV cu shortcode-uri Avada valide — si NUMAI cu aprobare explicita Ioan
       pentru fiecare operatiune REST API in parte.

Metoda de lucru aprobata (2026-06-27):
    Navighez prin wp-admin → Fusion Builder UI cu sesiunea activa a lui Ioan.
    EU NU SALVEZ NICIODATA. Zero exceptii.
    Dupa fiecare task aplicat in Fusion Builder:
        1. Anunt pe Ioan: "Task [X] aplicat in Fusion Builder. Verifica previzualizarea."
        2. Ioan verifica in builder / previzualizare.
        3. Daca e corect: Ioan salveaza si ma anunta sa trec la task-ul urmator.
        4. Daca nu e corect: Ioan da UNDO si imi comunica ce trebuie corectat.
    NU trec la urmatorul task fara confirmarea scrisa a lui Ioan ca a salvat.

METODA ESTE FIXA — ZERO IMPROVIZATIE:
    Metoda agreata per sesiune este singura metoda permisa pe toata durata sesiunii.
    Daca apare un obstacol tehnic cu metoda agreata (eroare, blocaj, imposibilitate):
        OPRESC imediat.
        Raportez exact: "BLOCAT — metoda [X] nu functioneaza. Motiv: [eroare/detaliu]."
        Astept instructiuni de la Ioan.
    NU caut singur alternative. NU incerc alte metode. NU improvizez solutii.
    Orice schimbare de metoda necesita aprobare explicita scrisa din partea lui Ioan.

INTERZIS — INSPECTIA CODULUI FARA AUTORIZARE:
    NU citesc, NU accesez, NU inspectez shortcode-urile sau codul paginii prin niciun mijloc:
        - Butonul "Code View" / "</>" din Fusion Builder — INTERZIS fara aprobare
        - Textarea #content din wp-admin — INTERZIS fara aprobare
        - REST API GET /wp/v2/pages/[ID] pentru a citi campul content — INTERZIS fara aprobare
        - Orice alta metoda de a vedea shortcode-urile raw ale paginii
    Daca am nevoie de informatii despre structura paginii:
        RAPORTEZ lui Ioan ce informatii am nevoie si DE CE.
        Astept autorizarea lui Ioan inainte de orice inspectie.

---

## REGULA 1.0 — CITESTE PRIMUL, RESPECTA PERMANENT, FARA EXCEPTII

NU AI PERMISIUNEA SA STERGI SAU SA EDITEZI ABSOLUT NIMIC DIN WEBSITE-UL https://ceida.ro

Nu te atingi de NICIO pagina existenta, indiferent de motiv.
Nu te atingi de antet (header), hero sau footer pe nicio pagina — originala sau copie.
Vei lucra EXCLUSIV pe copii (clone/draft). Originalele raman intacte pe toata durata proiectului.

Daca pagina V2 nu exista inca ca draft: folosesti butonul Clone pe pagina "CEIDA in Lume"
si lucrezi pe copia rezultata. NU pe original.

Orice operatiune care implica WordPress (publicare, editare, stergere, setari) se OPRESTE.
Explici ce este necesar, motivezi de ce, si astepti aprobarea EXPLICITA a lui Ioan.
ZERO actiuni in WordPress fara aprobare scrisa in sesiune.

---

## PAGINI OFF LIMITS — INTERZIS ABSOLUT

Folderul OFF LIMITS/ din radacina proiectului contine screenshot-urile de referinta vizuala.
Aceste pagini nu se ating, nu se analizeaza ca target, nu se modifica, nu se discuta ca obiect de interventie:

    - Doneaza — /sustine/doneaza
    - Redirectioneaza 3,5% — /sustine/redirectioneaza-3-5
    - Redirectioneaza 20% — /sustine/redirectioneaza-20

Extensie confirmata 2026-07-01: regula acopera si obiectele WordPress asociate acestor pagini,
nu doar paginile in sine — de exemplu formularul Avada "Doneaza" (fusion_form ID 3494).
Nu se citeste, nu se editeaza, nu se cloneaza, nu se foloseste ca referinta/model pentru alte formulare.

Daca orice task sau cerinta din document pare sa implice aceste pagini sau obiectele lor asociate:
OPRESTI, raportezi, astepti clarificare de la Ioan.

---

## REGULA 1.5 — RESPECTAM STRICT DOCUMENTUL DE CERINTE

Documentul de cerinte este SINGURA sursa de adevar pentru continut.
Nu interpretezi, nu completezi, nu improvizezi continut care nu exista explicit in document.
Daca un text lipseste din document => nu existe task pentru el.
Daca documentul spune "ramane asa" sau "ne pregatim" => nu existe V2, nu existe task.

### PAGINI EXCLUSE EXPLICIT DIN PROIECT — ZERO INTERVENTIE

Urmatoarele pagini NU au subproiect V2, NU au tasks.json, NU se ating in niciun fel:

    CEIDA IN LUME (/ceida-in-lume)
        Motivare: Documentul specifica explicit: "Pentru moment ramane asa."
        Nu exista text V2 in document. Nu se creeaza draft. Nu se discuta ca target.

    BLOG (/blog)
        Motivare: Documentul specifica: "Ne pregatim sa avem primele 4-5 articole."
        Nu exista articole livrate in document. Continutul nu exista inca.
        Cand Ioan va livra articolele, se va deschide un subproiect separat.

Daca orice sesiune viitoare pare sa implice aceste pagini ca target:
OPRESTI imediat, raportezi, astepti clarificare de la Ioan.

### SUBPROIECTE V2 — ORDINEA DE EXECUTIE (aprobata de Ioan, 2026-06-27)

Executia respecta ordinea din documentul de cerinte.
Paginile marcate cu rosu in document = prioritate, se executa primele.
Paginile fara rosu = se discuta dupa finalizarea prioritatilor.

    PRIORITATE (marcate rosu in document, in ordinea din document):
        1. despre-afct-v2
        2. despre-ceida-v2
        3. programe-impact-v2
        4. faq-v2
        5. contact-v2

    DUPA PRIORITATI (fara marcaj rosu, se discuta cand ajungem):
        6. parteneriate-v2
        7. magazin-calendar-v2

    EXCLUSE (nu se executa, vezi mai sus):
        - ceida-in-lume (ramane asa)
        - blog (nu exista continut livrat)

---

## STRUCTURA PROIECTULUI

    ceida-new-v2pages/
        CLAUDE.md
        OFF LIMITS/
        _templates/
            tasks-template.json
        requirements/
            pagini_v2 - Text Nou Site CEIDA_aprilie 2026.docx
        [slug-pagina-v2]/
            tasks.json
            brainstorm.md
            plan.md
            [fisiere output]

---

## REGULA 2.0 — tasks.json ESTE SURSA DE ADEVAR

Sursa de adevar pentru orice subproiect este fisierul tasks.json din folderul subproiectului.
Orice actualizare de status, detalii sau note se face EXCLUSIV in tasks.json.
Nu exista nicio implementare fara tasks.json citit si verificat mai intai.
Daca tasks.json nu exista: il creezi din _templates/tasks-template.json inainte de orice alta actiune.
Daca un task nu are campul details complet: il completezi in tasks.json inainte de a incepe task-ul.

---

## COMENZI SIMULATE TASKMASTER

Executi aceste comenzi conform workflow-ului sau la cererea lui Ioan:

task-master list
    Citesti tasks.json si afisezi toate task-urile:
    [ID] [STATUS] [PRIORITATE] [TITLU] — [DESCRIPTION]
    [DEPENDENTE: none / ID,ID]
    Afisezi si tabelul metadata.status cu numarul de tasks per status.

task-master next
    Citesti tasks.json.
    Identifici primul task cu status pending ale carui dependencies au toate status done.
    Afisezi: "Next task: [ID] — [TITLU] — [DESCRIPTION]"
    Daca nu exista task disponibil: "Toate task-urile sunt finalizate sau blocate."

task-master set-status --id=X --status=Y
    Deschizi tasks.json.
    Schimbi campul status al task-ului cu id X la valoarea Y.
    Actualizezi metadata.status (incrementezi Y, decrementezi statusul anterior).
    Actualizezi metadata.updated la data curenta.
    Salvezi tasks.json.
    Raportezi: "Task [X] -> status: Y | tasks.json actualizat."

task-master expand --id=X
    Citesti tasks.json.
    Afisezi task-ul X complet:
        ID, Titlu, Description, Details, TestStrategy
        Status, Priority, Dependencies
        SourceRequirement: cerinta originala din document
        Subtasks: lista cu id, titlu, status per subtask

task-master set-status --id=X.Y --status=Z
    Schimbi status-ul subtask-ului cu id Y din task-ul X in tasks.json.
    Salvezi tasks.json.
    Raportezi: "Subtask [X.Y] -> status: Z | tasks.json actualizat."

---

## STATUSURI PERMISE

    pending     — neinceput, asteapta
    in-progress — in lucru (MAXIM 1 task cu acest status la un moment dat)
    review      — implementat, asteapta verificarea lui Ioan
    done        — verificat si aprobat de Ioan
    blocked     — blocat (motiv documentat in campul details al task-ului)
    cancelled   — anulat cu aprobare Ioan

---

## ENFORCEMENT — INAINTE DE ORICE IMPLEMENTARE, FARA EXCEPTIE

Pasii de pre-implementare, in aceasta ordine exacta:

    1. Rulezi: task-master list
    2. Rulezi: task-master next
    3. Confirmi ca dependencies task-ului sunt toate done
    4. Rulezi: task-master set-status --id=X --status=in-progress
    5. Rulezi: task-master expand --id=X si citesti details + testStrategy
    6. Raportezi: "Lucrez la Task [X]: [Titlu] | tasks.json: in-progress"
    7. ABIA APOI implementezi

Dupa implementare:
    1. Rulezi: task-master set-status --id=X --status=review
    2. Raportezi rezultatul din testStrategy: "TestStrategy verificat: [DA/NU + detalii]"
    3. OPRESTI. Astepti confirmarea lui Ioan.

Dupa confirmare Ioan:
    1. Rulezi: task-master set-status --id=X --status=done
    2. Rulezi: task-master next pentru urmatorul task
    3. Raportezi: "Task [X] done | Urmator: Task [Y] — [Titlu]"

---

## STRUCTURA tasks.json — CAMPURI OBLIGATORII

Campurile obligatorii per task:

    id                  — numar unic, secvential, intreg
    title               — titlu scurt si actionabil
    description         — un singur rand, ce trebuie facut
    details             — implementare completa: tehnic, WordPress, fisiere, abordare
    testStrategy        — criteriu binar de verificare a completarii
    status              — unul din statusurile permise de mai sus
    priority            — high / medium / low
    dependencies        — array de id-uri sau array gol []
    sourceRequirement   — citatul exact din documentul de cerinte

Campurile obligatorii per subtask:

    id           — numar unic in cadrul task-ului parinte
    title        — titlu scurt
    description  — ce face acest subtask concret
    details      — optional, completat daca subtask-ul e complex
    status       — pending / in-progress / done
    dependencies — array de id-uri sau array gol []

Campul details este CRITIC. Un task fara details complet nu poate trece la in-progress.

Structura JSON de referinta (template in _templates/tasks-template.json):

    {
      "metadata": {
        "projectName": "[Nume Pagina V2]",
        "sourceDocument": "requirements/pagini_v2 - Text Nou Site CEIDA_aprilie 2026.docx",
        "sourceSection": "[Sectiunea X]",
        "version": "1.0.0",
        "created": "YYYY-MM-DD",
        "updated": "YYYY-MM-DD",
        "totalTasks": 0,
        "status": {
          "pending": 0,
          "in-progress": 0,
          "review": 0,
          "done": 0,
          "blocked": 0,
          "cancelled": 0
        }
      },
      "tasks": [
        {
          "id": 1,
          "title": "",
          "description": "",
          "details": "",
          "testStrategy": "",
          "status": "pending",
          "priority": "high",
          "dependencies": [],
          "sourceRequirement": "",
          "subtasks": [
            {
              "id": 1,
              "title": "",
              "description": "",
              "details": "",
              "status": "pending",
              "dependencies": []
            }
          ]
        }
      ]
    }

---

## WORKFLOW OBLIGATORIU — FARA EXCEPTII

### PASUL 1 — INITIALIZARE
Citesti CLAUDE.md si confirmi in sesiune: "CLAUDE.md citit."
Citesti documentul de cerinte pentru pagina curenta.
Creezi folderul subproiectului: [slug-pagina-v2]/
Copiezi _templates/tasks-template.json in [slug-pagina-v2]/tasks.json
Populezi tasks.json cu toate cerintele din document (toate campurile obligatorii completate).
Rulezi: task-master list
Raportezi: "tasks.json creat — [N] tasks identificate"
OPRESTI. Astepti confirmarea lui Ioan.

### PASUL 2 — BRAINSTORM
Verifici tasks.json — toate tasks au status pending.
Creezi brainstorm.md cu analiza cerintelor si propuneri de abordare.
Raportezi: "brainstorm.md gata — [N] idei/abordari propuse"
OPRESTI. Astepti feedback de la Ioan.

### PASUL 3 — PLAN
Pe baza feedback-ului creezi plan.md.
plan.md mapeaza fiecare task din tasks.json la pasi concret, in ordine.
plan.md specifica ordinea de executie respectand dependencies din tasks.json.
Raportezi: "plan.md gata — ordinea propusa: Task 1 -> Task 2 -> ..."
OPRESTI. Astepti aprobarea planului de la Ioan.

### PASUL 4 — EXECUTIE
Executi task-urile conform enforcement-ului din REGULA 2.0, task cu task.
Nu treci la urmatorul task fara ca task-ul curent sa aiba status done in tasks.json.

### PASUL 5 — VERIFICARE FINALA SUBPROIECT
Toate tasks au status done in tasks.json.
Rulezi: task-master list — confirmi zero tasks cu status pending, in-progress sau review.
Deschizi documentul de cerinte.
Verifici fiecare cerinta originala fata de sourceRequirement si testStrategy din tasks.json.
Raportezi: "Cerinta [X] din document -> Task [ID] -> done | TestStrategy: verificat"
Confirmi ca textul din pagina WP draft este IDENTIC cu documentul (cu exceptia corectiei diacriticelor).
Confirmi diacriticele conform checklist-ului de mai jos.
Confirmi structura vizuala: H1 titlu + subtitlu + sectiuni + CTA conform modelului site.
OPRESTI. Astepti aprobarea finala a subproiectului de la Ioan.

### PASUL 6 — NEXT
Abia dupa aprobarea finala scrisa a lui Ioan treci la subproiectul urmator.

---

## REGULI LIMBA ROMANA — CRITIC, ZERO TOLERANTA

### REGULA FUNDAMENTALA — TEXTUL CLIENTULUI ESTE SACRU

Textul din documentul de cerinte se extrage EXACT asa cum a fost scris de client.
NU se modifica, NU se rescrie, NU se parafraze, NU se "imbunatateste".
/humanizer NU se aplica. Niciodata. Pe niciun text destinat paginilor V2.

Se corecteaza EXCLUSIV:
    - diacriticele lipsa sau gresite (ș ț ă â î)
    - erorile gramaticale evidente (acord, punctuatie gresita)

Orice alta modificare a textului clientului necesita aprobare explicita de la Ioan.

Diacritice obligatorii:
    s si t cu virgula jos: ș ț — NU cu sedila: ş ţ
    a scurt: ă
    a circumflex: â
    i circumflex: î — conform normelor DOOM3

Checklist diacritice inainte de orice livrare de text:
    [ ] s si t cu virgula jos (ș ț), nu cu sedila (ş ţ)
    [ ] ă prezent unde este necesar
    [ ] â vs î conform DOOM3
    [ ] s-a / s-au / sau / iar folosite corect
    [ ] cratima prezenta in: nu-i, du-te, l-am, s-a, n-am

---

## SKILLS — ORDINEA DE INVOCARE

    Situatie: task nou, skill neclar              -> /skill-router primul
    Situatie: analiza cerinte, generare idei      -> /brainstorming
    Situatie: prompt nou sau imbunatatit          -> /prompt-master
    Situatie: organizare si tracking task-uri     -> tasks.json + comenzi taskmaster simulate

    INTERZIS: /humanizer pe textele destinate paginilor V2.
    Textul clientului se pastreaza intact. Vezi REGULI LIMBA ROMANA.

---

## WORDPRESS — CONTEXT TEHNIC

Platforma: WordPress self-hosted
Tema: Avada cu Fusion Builder — CONFIRMAT (2026-06-27, pagina ID 3953, content incepe cu [fusion_builder_container])
Child Theme: OBLIGATORIU activ — vezi REGULA 0.3. NU se lucreaza niciodata pe tema parinte Avada.
Acces: sesiune activa wp-admin in browser (nonce) — metoda aprobata si sigura
ATENTIE AVADA: Vezi REGULA 0.4 — HTML simplu via REST API este INTERZIS.
Toate paginile V2 raman ca DRAFT pana la aprobare explicita de publicare de la Ioan.
Nicio setare WordPress (permalink, SEO, meniu, widget) nu se modifica fara aprobare.

### MECANISM DE LUCRU — CLONE, NU CREATE

Nu se creeaza pagini noi din zero via REST API.
Fluxul corect pentru fiecare pagina V2:

    PASUL A: Verifici daca pagina V2 (draft) exista deja in wp-admin.
    PASUL B: Daca NU exista => folosesti butonul CLONE pe pagina "CEIDA in Lume" din wp-admin.
             Clona devine draft-ul de lucru pentru pagina V2 curenta.
    PASUL C: Redenumesti clona cu titlul corect al paginii V2 (ex: "Despre AFCT V2").
    PASUL D: Lucrezi EXCLUSIV pe continutul din zona de text/continut a draft-ului.
             NU modifici: antetul (header), hero-ul sau footer-ul paginii clonate.

VERIFICARE BUTON CLONE:
    - Dupa primul acces cu credentialele Ioan, verific daca butonul Clone din wp-admin
      copiaza pagina completa ca draft. Confirm in scris inainte de a folosi.
    - Daca butonul Clone nu exista sau nu functioneaza cum trebuie: raportez lui Ioan
      si astept instructiuni alternative.

### CE NU SE MODIFICA NICIODATA PE COPII

Pe niciun draft/clone, indiferent de task:
    - HEADER (antet): nu se atinge, nu se modifica, nu se sterge
    - HERO (zona de sus a paginii cu imagine/background): nu se atinge
      EXCEPTIE: daca tasks.json contine un task explicit pentru hero — si numai dupa
      aprobare scrisa Ioan pentru acel task specific.
    - FOOTER: nu se atinge, nu se modifica, nu se sterge
      Footer-ul CEIDA contine: logo, denumire, adresa (Constanta, Romania),
      tel +40 723 449 460, contact@ceida.ro, social media, copyright, PNRR.

### STRUCTURA VIZUALA PAGINI V2 — MODEL DE REFERINTA: CEIDA IN LUME

Paginile V2 urmeaza structura vizuala a paginilor existente pe ceida.ro.
Model verificat personal de Ioan: pagina "CEIDA in Lume" (2026-06-27).
Toate paginile V2 sunt pagini de nivel top (meniu principal), nu sub-meniu.

Structura standard a zonei de continut per pagina (in aceasta ordine):
    1. TITLU PAGINA (H1)
       - centrat, bold, culoare albastru-mov (stilizat de tema Avada)
       - ex: "Despre AFCT", "Despre CEIDA", "Programe & Impact"

    2. SUBTITLU
       - centrat, bold, negru
       - ex: "Misiunea educationala AFCT: Puntea de legatura intre Educatie si Mediul de Afaceri"

    3. PARAGRAF(E) INTRODUCTIV(E)
       - text simplu, conform documentului de cerinte

    4. SECTIUNI DE CONTINUT (H2 / H3)
       - ordinea exacta din documentul de cerinte
       - fiecare sectiune: titlu sectiune + paragraf(e) + eventual lista

    5. MESAJ FINAL / CTA (daca exista in document)
       - ex: "Viziunea noastra", "Fii parte din schimbare!", buton CTA

### DATE DE CONTACT CEIDA (extrase din footer site, 2026-06-27)

    Email:   contact@ceida.ro
    Telefon: +40 723 449 460
    Adresa:  Constanta, Romania
    Sediul:  Hubbin' by AFCT (adresa exacta de confirmat cu Ioan)

    Aceste date se folosesc la popularea paginii contact-v2 dupa confirmarea Ioan.

---

## STOP CONDITIONS — OPRESTI IMEDIAT CAND

    - Orice actiune in WordPress care nu e explicit aprobata in sesiunea curenta
    - Orice pagina din OFF LIMITS/ apare ca target de interventie
    - tasks.json nu exista sau are campuri obligatorii incomplete
    - Cerinta ambigua in document — INTREBI, nu interpretezi
    - Plan neaprobat — nu executi nimic
    - Task precedent nu are status done in tasks.json
    - Doua task-uri simultan cu status in-progress in tasks.json
    - Obstacol tehnic cu metoda de lucru agreata — STOP, raportezi exact eroarea, astepti Ioan
    - Vrei sa faci orice pas fara sa il fi raportat si confirmat cu Ioan in prealabil

---

## DEFINITION OF DONE — PER SUBPROIECT

Un subproiect este DONE EXCLUSIV cand sunt bifate toate conditiile:
    [ ] task-master list confirma zero tasks cu status != done sau cancelled
    [ ] Fiecare cerinta din document are corespondent verificat in sourceRequirement + testStrategy
    [ ] Textul din pagina WordPress draft este IDENTIC cu documentul de cerinte (minus corectii diacritice)
    [ ] Diacriticele au fost verificate si corectate conform checklist-ului
    [ ] Structura paginii urmeaza modelul CEIDA in Lume (H1 titlu, subtitlu, sectiuni, CTA)
    [ ] Pagina WP draft este vizibila in wp-admin si confirmata de Ioan
    [ ] Ioan a dat aprobarea finala scrisa in sesiune

---

## LA INCEPUTUL FIECAREI SESIUNI NOI

    1. Citesti CLAUDE.md — confirmi in sesiune: "CLAUDE.md citit."
    2. Citesti OFF LIMITS/ — confirmi cele 3 pagini interzise.
    3. Citesti tasks.json al subproiectului activ.
    4. Rulezi: task-master list
    5. Identifici task-ul curent (status in-progress sau review).
    6. Raportezi: "Sesiune noua | Subproiect: [X] | Task curent: [ID] [Titlu] | Status: [Y]"
    7. Astepti instructiunea lui Ioan.

Nu presupui niciodata ca poti continua de unde ai ramas fara confirmarea lui Ioan.

---

Orice modificare a acestui fisier necesita aprobarea lui Ioan.