---
id: "07"
title_en: Child Theme & Hooks
title_ro: Child theme și hooks
load_when_en: Custom development is genuinely required — child theme, action/filter hooks, PHP, when native Avada truly can't do it.
load_when_ro: Este nevoie reală de dezvoltare custom — child theme, hooks, PHP, când Avada nativ chiar nu poate.
task_types: [rebuild-audit-page, custom-code-justification]
depends_on: ["01"]
---

# 07 — Child Theme & Hooks

> Load this chapter only when custom code is genuinely on the table. Read chapter `00` (decision order) and `01` (elements catalog) first — most "custom code" requests die at step 1 or step 2.

## 0. Restate the gate before writing any code

**EN** — Custom code (child theme CSS/JS/PHP) is the **last resort**. It is only justified after all five prior steps in the decision order have been walked, in order, and each one has failed for a stated reason:

1. **Element** — no native Avada Design/Form/Layout/Inline Element covers it (chapter 01).
2. **Container / Column** — Container/Column/Nested Columns settings cannot achieve the layout or behavior.
3. **Global / Element Options** — no Global Options panel or element Options panel setting covers it.
4. **Library / Global Element** — this isn't a reuse problem; saving/syncing a block doesn't solve it.
5. **Layout Section** — this isn't a template-location problem; an Avada Layout + Layout Section with Conditions doesn't solve it.
6. **Only now** — custom code, with written justification (what, why steps 1–5 failed, where the code lives, rollback plan).

Never skip straight to step 6. Never propose custom code "because it's faster" — that is a maintenance and update-safety anti-pattern, not a valid justification.

**RO** — Codul custom (CSS/JS/PHP în child theme) este **ultima soluție**. Este justificat doar după ce toți cei cinci pași anteriori din ordinea de decizie au fost parcurși, în ordine, iar fiecare a eșuat pentru un motiv precizat:

1. **Element** — niciun Element nativ Avada (Design/Form/Layout/Inline) nu acoperă cerința (capitolul 01).
2. **Container / Column** — setările Container/Column/Nested Columns nu pot obține layout-ul sau comportamentul dorit.
3. **Global / Element Options** — nicio setare din Global Options sau din panoul Options al elementului nu acoperă cerința.
4. **Library / Global Element** — nu este o problemă de reutilizare; salvarea/sincronizarea unui bloc nu rezolvă cerința.
5. **Layout Section** — nu este o problemă de locație de template; un Avada Layout + Layout Section cu Conditions nu rezolvă cerința.
6. **Abia acum** — cod custom, cu justificare scrisă (ce anume, de ce au eșuat pașii 1–5, unde se pune codul, plan de rollback).

Nu sări niciodată direct la pasul 6. Nu propune cod custom "pentru că e mai rapid" — este un anti-pattern de mentenanță și siguranță la update, nu o justificare validă.

## 1. Child theme rule

**EN**
- **Never edit the parent Avada theme files.** Every persistent PHP/CSS/JS customization goes into an **Avada child theme** (or, for site-wide CSS/JS snippets only, the Global Options → Advanced → Code Fields / Custom CSS panel — see §3).
- A child theme survives parent theme updates; direct parent edits are wiped on the next Avada update.
- Structure: child theme `functions.php` for PHP logic (hooks, custom shortcodes if explicitly requested, API integrations), a child `style.css` / enqueued stylesheet for CSS that must ship as a file (versioned, cacheable) rather than live in Global Options.
- Keep the child theme minimal. Every addition should map to one justified requirement from §0.

**RO**
- **Nu edita niciodată fișierele temei părinte Avada.** Orice customizare persistentă PHP/CSS/JS se pune într-un **child theme Avada** (sau, doar pentru fragmente CSS/JS la nivel de site, în panoul Global Options → Advanced → Code Fields / Custom CSS — vezi §3).
- Un child theme supraviețuiește update-urilor temei părinte; editările directe în părinte sunt șterse la următorul update Avada.
- Structură: `functions.php` din child theme pentru logică PHP (hooks, shortcode-uri custom dacă sunt cerute explicit, integrări API), un `style.css`/stylesheet încărcat (enqueued) din child pentru CSS care trebuie livrat ca fișier (versionat, cacheable) și nu ține de Global Options.
- Păstrează child theme-ul minimal. Fiecare adăugare trebuie să corespundă unei cerințe justificate din §0.

## 2. Hooks system — conceptual only

**EN** — Avada exposes a **hooks system**: **action hooks** (run code at a point, e.g., around header/footer/content/before-after page areas) and **filters** (modify a value/output before it's used). Avada's own hook names commonly use the `avada_*` and `fusion_*` prefixes.

**Do not list or invent specific hook names in this chapter or in any deliverable.** No exact hook name is verified in `research-notes.md`. Whenever a task needs an actual hook name:
1. Tell the reader to look it up at the official reference: **https://avada.com/documentation/avada-hooks-actions-and-filters/**.
2. Mark the specific name `[verify]` until confirmed there.
3. Never guess a plausible-sounding name and present it as fact — a wrong hook name silently does nothing and is hard to debug.

**RO** — Avada expune un **sistem de hooks**: **action hooks** (execută cod într-un anumit punct, ex. în jurul zonelor header/footer/conținut/before-after page) și **filters** (modifică o valoare/un output înainte de a fi folosit). Numele de hook-uri Avada folosesc de regulă prefixele `avada_*` și `fusion_*`.

**Nu enumera și nu inventa nume de hook-uri specifice** în acest capitol sau în orice livrabil. Niciun nume exact de hook nu este verificat în `research-notes.md`. Când o cerință are nevoie de un nume real de hook:
1. Trimite cititorul la referința oficială: **https://avada.com/documentation/avada-hooks-actions-and-filters/**.
2. Marchează numele specific `[verify]` până e confirmat acolo.
3. Nu ghici niciodată un nume plauzibil și nu-l prezenta ca fapt — un nume de hook greșit nu face nimic, silențios, și e greu de depanat.

## 3. Prefer built-in code panels over new files

**EN** — Before creating a child-theme file for a small tweak, check whether **Global Options → Advanced → Code Fields** or the **Custom CSS** panel already covers it:

| Need | Native panel | When a child theme file is still needed |
|---|---|---|
| Tracking/analytics snippet, JS in `<head>`/before `</body>` | Global Options → Advanced → Code Fields | Never — Code Fields is the correct place |
| Site-wide CSS override | Global Options → Custom CSS | Only if CSS must ship as a versioned/cached file, or depends on conditional PHP logic |
| One-off inline tweak on a single element | Element's own Custom CSS / Class/ID options (if present on that element) | Rarely — prefer the element option first |
| PHP logic, hooks/filters, custom shortcode, API integration | — (no Global Options equivalent) | Yes — child theme `functions.php` |
| WooCommerce behavior change with no native Woo Element/Layout option | — | Yes, only after chapter 06's native Woo Builder path is ruled out |

Rule: **Code Fields / Custom CSS panels before a new child-theme file**, and **a child-theme file before touching the parent theme** — never the reverse.

**RO**

| Nevoie | Panou nativ | Când e totuși nevoie de fișier în child theme |
|---|---|---|
| Cod de tracking/analytics, JS în `<head>`/înainte de `</body>` | Global Options → Advanced → Code Fields | Niciodată — Code Fields e locul corect |
| Suprascriere CSS la nivel de site | Global Options → Custom CSS | Doar dacă CSS-ul trebuie livrat ca fișier versionat/cacheable, sau depinde de logică PHP condițională |
| Ajustare punctuală pe un singur element | Opțiunile proprii ale elementului (Custom CSS / Class/ID, dacă există pe elementul respectiv) | Rar — preferă întâi opțiunea elementului |
| Logică PHP, hooks/filters, shortcode custom, integrare API | — (fără echivalent în Global Options) | Da — `functions.php` din child theme |
| Modificare de comportament WooCommerce fără opțiune nativă Woo Element/Layout | — | Da, doar după ce calea nativă Woo Builder din capitolul 06 e exclusă |

Regulă: **panourile Code Fields / Custom CSS înaintea unui fișier nou în child theme**, iar **un fișier în child theme înaintea atingerii temei părinte** — niciodată invers.

## 4. Custom-code audit table

**EN** — Use this table format for every custom-code proposal. It forces the native-alternative check to be visible and reviewable.

| Proposed custom code | Requirement it solves | Native Avada alternative checked | Still justified? Why |
|---|---|---|---|
| Example: custom PHP filter to change WooCommerce cart line-item markup | Show a custom "gift wrap" note per cart line | Woo Elements (Cart Table, Cart Totals) checked — no option exposes per-line custom markup injection | Yes — no Woo Element/Layout option covers arbitrary per-line markup; filter hook is the minimal-footprint fix `[verify exact hook]` |
| Example: custom CSS grid for a 5-column image mosaic | Irregular mosaic grid, not a uniform column count | Nested Columns checked — supports regular column splits, not the exact irregular mosaic requested | Partially — try Nested Columns with mixed widths first; only fall back to custom CSS for the specific irregular cells that remain unsolved |
| Example: child-theme functions.php snippet to auto-populate a form field from a URL parameter | Pre-fill Avada Form field from ad campaign UTM | Avada Form Builder (chapter 05) checked — no native URL-parameter-to-field mapping found in research-notes | Yes, tentatively — `[verify]` against Form Builder docs before committing; if a native option exists, use it instead |

Fill one row per proposal. Reject or revise any row where the "native alternative checked" column is empty or unconvincing.

**RO** — Folosește acest format de tabel pentru fiecare propunere de cod custom. Obligă verificarea alternativei native să fie vizibilă și verificabilă.

| Cod custom propus | Cerința rezolvată | Alternativa nativă Avada verificată | Încă justificat? De ce |
|---|---|---|---|
| Exemplu: filtru PHP custom pentru markup-ul liniei de coș WooCommerce | Afișare notă "ambalaj cadou" per linie de coș | Woo Elements (Cart Table, Cart Totals) verificate — nicio opțiune nu permite injectare de markup custom per linie | Da — nicio opțiune Woo Element/Layout nu acoperă markup arbitrar per linie; hook-ul de filtru e soluția cu impact minim `[verify hook exact]` |
| Exemplu: grid CSS custom pentru mozaic de imagini pe 5 coloane | Grid mozaic neregulat, nu un număr uniform de coloane | Nested Columns verificat — suportă împărțiri regulate pe coloane, nu exact mozaicul neregulat cerut | Parțial — încearcă întâi Nested Columns cu lățimi mixte; recurge la CSS custom doar pentru celulele neregulate care rămân nerezolvate |
| Exemplu: fragment functions.php în child theme pentru pre-completare câmp formular din parametru URL | Pre-completare câmp Avada Form din UTM de campanie | Avada Form Builder (capitolul 05) verificat — nicio mapare nativă parametru URL → câmp găsită în research-notes | Da, provizoriu — `[verify]` în documentația Form Builder înainte de a implementa; dacă există o opțiune nativă, folosește-o în loc |

Completează un rând per propunere. Respinge sau revizuiește orice rând unde coloana "alternativă nativă verificată" e goală sau neconvingătoare.

## 5. Risk, rollback, and documentation checklist

**EN**
- [ ] Change lives in child theme (or a Code Fields/Custom CSS panel) — never in the parent theme.
- [ ] Backup taken before the change ships.
- [ ] Written justification recorded (which native steps 1–5 were checked, and why each failed).
- [ ] Any hook/filter used is documented with a link to the official hooks reference page (name marked `[verify]` if not yet confirmed there).
- [ ] Code kept minimal — one change, one purpose.
- [ ] Rollback path stated (disable snippet / revert child theme file / remove Code Fields entry).
- [ ] Update-safety check: change does not depend on undocumented parent theme internals beyond the documented hooks/filters.

**RO**
- [ ] Modificarea e în child theme (sau într-un panou Code Fields/Custom CSS) — niciodată în tema părinte.
- [ ] Backup făcut înainte de livrare.
- [ ] Justificare scrisă înregistrată (ce pași nativi 1–5 au fost verificați și de ce fiecare a eșuat).
- [ ] Orice hook/filtru folosit e documentat cu link către pagina oficială de referință hooks (nume marcat `[verify]` dacă nu e încă confirmat acolo).
- [ ] Codul e minimal — o modificare, un scop.
- [ ] Planul de rollback e precizat (dezactivare fragment / revert fișier din child theme / eliminare intrare din Code Fields).
- [ ] Verificare siguranță la update: modificarea nu depinde de intern nedocumentat al temei părinte, dincolo de hooks/filters documentate.

## Source
- Cite for hook names and child-theme setup specifics: https://avada.com/documentation/avada-hooks-actions-and-filters/ (mod. Mar–Apr 2026 per research-notes.md).
- All specific hook names in this chapter are intentionally omitted — `[verify]` at the URL above before using any hook name in a deliverable.
