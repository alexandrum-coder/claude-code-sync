# Sursa ideilor de autoverificare și de lucru cu agenți

**Sursa:** episod public de podcast, fragment de 1 min 38 s pentru C-1…C-6. Subtitrările automate pot avea greșeli de recunoaștere, deci ideile de mai jos sunt reformulate, nu citate. Marcajele de timp sunt cele din episod.

## Ideile

| # | Timp | Idee |
|---|---|---|
| C-1 | 16:03 | Agentul de cod se folosește mai ales pentru a orchestra alți agenți și pentru a scrie cod. Rolul omului s-a mutat de la citirea codului la folosirea agenților ca să înțeleagă ce se întâmplă. |
| C-2 | 16:12 | Un feature nou începe cu o discuție cu AI-ul și cu un plan. Scopul este încrederea că planul duce la un feature funcțional. |
| C-3 | 16:23 | Cel mai important punct: AI-ul trebuie să aibă mijloacele de a-și verifica singur munca. |
| C-4 | 16:29 | În staging există utilizatori de test pentru fiecare stare relevantă (de exemplu cont de organizație sau cont obișnuit, cu fonduri sau fără, cu un proces de înscriere terminat sau neterminat). AI-ul se autentifică cu ei și parcurge platforma ca un tester cu toate cazurile pregătite. |
| C-5 | 16:55 | Exemplu: un flux de înscriere a fost scurtat, iar datele se preiau acum automat dintr-un document scanat. Înainte, omul intra manual, găsea eroarea (o valoare citită greșit din document) și scria un prompt. Acum agentul primește un utilizator de test și o imagine de test, intră singur, preia datele, dă de eroare și repetă ciclul până își validează singur munca. |
| C-6 | 17:29 | Rezultat: ce i se prezintă omului este deja funcțional și finisat, fără surpriza „nu merge deloc” la predare. |
| C-7 | 15:00 | Fiecare om din echipă are skill-uri definite pentru tipul lui de muncă (facturare, operațiuni, mesajele utilizatorilor, CRM), iar skill-urile se împart între colegi. |
| C-8 | 18:00 | Aplicația se construiește astfel încât agenții să poată face cât mai mult: acces securizat la baza de date, la metricile de înregistrare și la cât mai mult context. |
| C-9 | 19:00 | Prin MCP, agentul interoghează baza de date și cere singur precizări (ce cohortă, ce segment). Cohortele sunt definite dinainte, iar rezultatul unei măsuri depinde de cine intră în calcul. |

Ideile C-7…C-9 vin din transcrierea completă a aceluiași episod, care are marcaje numai la minut. Drepturile minime și acordul clientului din `R-CLIP-6` sunt condiția pusă de D, nu spusele invitatului.

## Maparea pe verificări

| Regulă | Mod | Din | Unde se verifică |
|---|---|---|---|
| R-CLIP-1 | preflight, blocantă | C-3, C-4, C-5 (partea de cod: mediu separat, conturi pe stări, agentul reia singur) | `checklist-preflight.md`, „R-CLIP-1: metoda de autoverificare este scrisă” |
| R-CLIP-2 | preflight, blocantă | C-4 | `checklist-preflight.md`, „R-CLIP-2: cazurile de test sunt enumerate pe roluri și stări” |
| R-CLIP-3 | checkpoint | C-5, C-6 | `checklist-checkpoint.md`, „R-CLIP-3: ciclul de autoverificare a trecut înainte de raport” |
| R-CLIP-4 | preflight, blocantă | C-4 și regulile de siguranță ale utilizatorului | `checklist-preflight.md`, „R-CLIP-4: ciclul de autoverificare rămâne în limite” |
| R-CLIP-5 | preflight, numai cod | C-2 | `checklist-preflight.md`, „R-CLIP-5: planul funcției este scris înainte de cod” |
| R-CLIP-6 | preflight, numai cod și date | C-8, C-9 și condiția lui D | `checklist-preflight.md`, „R-CLIP-6: accesul agentului la date și metrici este controlat” |
| R-CLIP-7 | preflight, numai cod și date, cel mult WARN | C-7 | `checklist-preflight.md`, „R-CLIP-7: skill-ul existent este verificat înainte de unul nou” |

C-1 dă contextul (agentul verifică, omul decide) și nu are o verificare proprie.
