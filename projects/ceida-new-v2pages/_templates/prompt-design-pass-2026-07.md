# Prompt sesiune nouă — Design pass paginile V2 (referință: Despre Noi)

Continuăm proiectul ceida-new-v2pages la /Users/pixelpoetry/Claude Cowork/ceida-new-v2pages/.

Citește CLAUDE.md-ul proiectului + memoria ta (`project_ceida-v2-pages.md`, secțiunea „STATUS SNAPSHOT") înainte de orice altceva. Confirmă „CLAUDE.md citit."

## Context

7 subproiecte V2 există, fiecare cu tasks.json propriu. Stare la 2026-07-01: despre-afct-v2 (3953), despre-ceida-v2 (3964), programe-impact-v2 (3968) și parteneriate-v2 (4019) au conținut complet, draft, în așteptarea aprobării finale a lui Ioan. faq-v2 (3978) și contact-v2 (4012) sunt DONE și **excluse** din sarcina asta. magazin-calendar-v2 nu a fost început — nu-l atingi.

## Task

Referință de stil: **https://ceida.ro/despre-noi/** (pagină live, existentă). Analizezi stilul și design-ul ei — hero, tipografie, imagini, layout — și aduci îmbunătățiri la cele **4 pagini**: despre-afct-v2, despre-ceida-v2, programe-impact-v2, parteneriate-v2.

Pentru fiecare pagină:
1. **Hero** în stilul folosit pe Despre Noi (nu copiezi textul lor, doar stilul/structura vizuală — titlul/subtitlul rămân cele deja stabilite pentru fiecare pagină V2)
2. **Imagini descriptive** — preiei sau generezi imagini relevante pentru conținutul specific al fiecărei pagini (nu imagini generice)
3. **Îmbunătățiri layout, font, stil** — aliniate cu design-ul de pe Despre Noi

## Constrângeri — regulile absolute din CLAUDE.md rămân valabile

- REGULA 0.1-1.5 complet: hero-ul e ATINS explicit în task-ul ăsta (aprobare pre-acordată pentru hero pe cele 4 pagini), dar orice altă ambiguitate → STOP, întrebi.
- Nu inventezi text nou de conținut (body copy) — doar elemente vizuale (hero/imagini/stil). Dacă un hero are nevoie de un rând de text nou nespecificat în document, întrebi înainte.
- OFF LIMITS: pagina Doneaza + formularul ei (fusion_form 3494), Redirecționează 3.5%/20% — zero atingere, zero folosire ca referință.
- Nu salvezi niciodată tu (`.fusion-builder-save-page`, `#save-post`, `#publish` etc.) — vezi memoria `feedback_avada-live-builder-never-autosave`. Aplici în Live Builder, Ioan verifică, Ioan salvează.
- Pentru orice control ascuns (hover-only, ex. „Load" pe template-uri Avada) — click real (`click_at_xy`), nu `.click()`/dispatchEvent (memoria `project_ceida-v2-pages` are exemple).
- Diacritice corecte (ș ț cu virgulă, nu sedilă) pe orice text nou introdus.
- Verifică live-safety la fiecare pagină: paginile astea sunt drafturi izolate, dar dacă vreo resursă (formular, categorie, imagine din Media Library folosită și pe pagini live) e partajată cu ceva live — STOP, aplici aceeași logică de izolare ca la FAQ/Contact (dubla-etichetă sau duplicare resursă) înainte să continui.

## Proces

1. Deschide https://ceida.ro/despre-noi/ (Live Builder + frontend), analizează structura heroului, tipografia, stilul imaginilor, spacing-ul.
2. Invocă skill-ul `brainstorming` (proces, înaintea oricărei implementări) pentru a genera opțiuni de abordare per pagină.
3. Pentru evaluare/producție design, verifică și invocă după caz: `/impeccable`, `/emil-design-eng`, `/motion-choreography`, `/adaptive-interfaces`, plus orice alt skill relevant din lista disponibilă (ex. `design-taste-frontend`, `high-end-visual-design`, `interface-design`, `interaction-design`, `12-principles-of-animation`) — alegi tu ce se potrivește per etapă, nu le rulezi mecanic pe toate.
4. Pentru fiecare din cele 4 pagini: creează/actualizează `[slug]/plan-design.md` cu propunerea (hero + imagini + layout), apoi structurează în tasks noi în `[slug]/tasks.json` (task nou per pagină, nu rescrii tasks-urile de conținut existente — adaugi la coadă, dependențe pe task-urile de conținut deja `done`).
5. Raportezi planul complet pentru toate 4 paginile, aștepți aprobarea mea înainte de orice aplicare în builder.
6. După aprobare, aplici pagină cu pagină în Live Builder (browser-harness), raportezi, eu verific și salvez.

## Output

Markdown/prose pentru planuri, tasks.json pentru tracking, aplicare directă în builder pentru execuție. Checkpoint după fiecare pagină finalizată: `✅ [pagina] — hero+imagini+layout aplicate, aștept Save`.

## Done-when

Toate 4 paginile au hero nou (stil Despre Noi) + imagini descriptive relevante + layout/font/stil îmbunătățit, aplicate și salvate de mine, cu aprobarea mea finală scrisă per pagină.
