# Sursa ideilor de autoverificare

**Sursa:** episod public de podcast, fragment de 1 min 38 s. Subtitrările automate pot avea greșeli de recunoaștere, deci ideile de mai jos sunt reformulate, nu citate. Marcajele de timp sunt cele din episod.

## Ideile

| # | Timp | Idee |
|---|---|---|
| C-1 | 16:03 | Agentul de cod se folosește mai ales pentru a orchestra alți agenți și pentru a scrie cod. Rolul omului s-a mutat de la citirea codului la folosirea agenților ca să înțeleagă ce se întâmplă. |
| C-2 | 16:12 | Un feature nou începe cu o discuție cu AI-ul și cu un plan. Scopul este încrederea că planul duce la un feature funcțional. |
| C-3 | 16:23 | Cel mai important punct: AI-ul trebuie să aibă mijloacele de a-și verifica singur munca. |
| C-4 | 16:29 | În staging există utilizatori de test pentru fiecare stare relevantă (de exemplu cont de organizație sau cont obișnuit, cu fonduri sau fără, cu un proces de înscriere terminat sau neterminat). AI-ul se autentifică cu ei și parcurge platforma ca un tester cu toate cazurile pregătite. |
| C-5 | 16:55 | Exemplu: un flux de înscriere a fost scurtat, iar datele se preiau acum automat dintr-un document scanat. Înainte, omul intra manual, găsea eroarea (o valoare citită greșit din document) și scria un prompt. Acum agentul primește un utilizator de test și o imagine de test, intră singur, preia datele, dă de eroare și repetă ciclul până își validează singur munca. |
| C-6 | 17:29 | Rezultat: ce i se prezintă omului este deja funcțional și finisat, fără surpriza „nu merge deloc” la predare. |

## Maparea pe verificări

| Regulă | Mod | Din | Unde se verifică |
|---|---|---|---|
| R-CLIP-1 | preflight, blocantă | C-3, C-4 | `checklist-preflight.md`, „R-CLIP-1: metoda de autoverificare este scrisă” |
| R-CLIP-2 | preflight, blocantă | C-4 | `checklist-preflight.md`, „R-CLIP-2: cazurile de test sunt enumerate pe roluri și stări” |
| R-CLIP-3 | checkpoint | C-5, C-6 | `checklist-checkpoint.md`, „R-CLIP-3: ciclul de autoverificare a trecut înainte de raport” |
| R-CLIP-4 | preflight, blocantă | C-4 și regulile de siguranță ale utilizatorului | `checklist-preflight.md`, „R-CLIP-4: ciclul de autoverificare rămâne în limite” |

C-1 și C-2 dau contextul (planul vine înaintea execuției; agentul verifică, omul decide) și nu au o verificare proprie.
