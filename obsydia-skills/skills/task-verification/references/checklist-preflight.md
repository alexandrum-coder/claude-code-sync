# Checklist preflight

Se rulează înainte de prima acțiune a taskului. Fiecare rând primește PASS, WARN, FAIL sau NEVERIFICAT, cu dovadă. Trimiterile `R-NN` trimit la `INDEX.md`.

## Clasificarea acțiunilor

- **A:** citire și fișiere noi locale. Merg fără întrerupere.
- **B:** scriere pe un sistem live sau extern. Cere aprobare pentru fiecare lot și prezentarea obiectului, a valorii vechi, a valorii noi și a motivului (R-39, R-45).
- **C:** editarea unui fișier existent, git, publicare, acțiuni ireversibile. Cere confirmare de fiecare dată (R-37, R-38).

O aprobare dintr-o categorie nu se extinde la alta (R-45, R-46). În preflight se verifică numai că planul prevede confirmarea: o acțiune C are un punct de confirmare numit sau o aprobare a lui D pentru setul ei exact, în registrul de decizii. Confirmarea reală se verifică la checkpoint.

## Verificări obișnuite

1. **Planul există și este cel mai recent pe subiect.** Există pe disc; un plan sau handoff mai nou îl anulează pe cel vechi. (R-181, R-29)
2. **Starea de pornire este verificată** pe disc sau prin citire, nu luată din handoff sau din plan. (R-16, R-19, R-182)
3. **Contul și rolul activ** sunt dovedite dintr-o sursă proaspătă înainte de orice scriere. (R-27, R-55)
4. **Deciziile sunt închise** de utilizator, ca întrebări grilă cu recomandarea prima, înainte de prima fază. Un registru de decizii cu variante, recomandare și răspunsul lui D e dovadă suficientă. Un criteriu de acceptare se cere închis numai când D sau planul a numit unul fără dovadă observabilă. (R-02, R-149)
5. **Există backup**, verificat cu sumă de control, făcut înainte de prima scriere. (R-33, R-72, R-73)
6. **Pilotul este definit:** un singur element, verificat complet după reîncărcare, înainte de restul lotului. (R-69)
7. **Condițiile de oprire sunt scrise** dinainte, pe status și pe conținut. (R-195, R-08)
8. **Fiecare acțiune este clasificată A, B sau C**, după definițiile de mai sus. (R-45)
9. **Ritmul și bugetul de cereri** spre sisteme externe sunt anunțate și acceptate. (R-193, R-198)
10. **Data de sistem** este citită cu comanda, nu dedusă din numele planului. (R-26)

## Verificări blocante (autoverificare)

### R-CLIP-1: metoda de autoverificare este scrisă

Planul spune ce cont sau rol de test se folosește, pe ce date de test, ce stări se acoperă și ce dovadă observabilă înseamnă „merge”. Dovada se citește după reîncărcare, în rezultatul final, nu într-un indicator intermediar. Dovada de folosire de către om (deschiderea în programul lui, aspectul) se cere numai când D a numit un criteriu de folosire. (R-89, R-90, R-61)

Dacă metoda lipsește sau dovada observabilă nu este numită: **STOP**.

### R-CLIP-2: cazurile de test sunt enumerate pe roluri și stări

Nu doar drumul fericit. Cazurile acoperă cel puțin rol cu drepturi limitate vs. rol cu drepturi depline, anonim vs. logat, cu cache vs. fără. O stare care nu se aplică, cu justificare scrisă, e acoperită. (R-115, R-213, R-98)

Dacă nu există nicio enumerare: **STOP**. Dacă enumerarea există, dar lasă o stare relevantă neacoperită fără justificare: **GO-CU-CONDIȚII**, cu starea lipsă numită.

### R-CLIP-4: ciclul de autoverificare rămâne în limite

Ciclul rulează numai pe clone sau în staging, din contul de test, în bugetul de cereri (cel mult 20, oprire la primul răspuns de tip `429`) și fără trimiteri pe formulare vii. (R-61, R-62, R-59, R-194, R-198)

Dacă planul prevede ciclul pe producție, peste buget sau cu trimiteri reale: **STOP**. Dacă limitele sunt respectate, dar bugetul sau contul de test nu sunt scrise explicit: **GO-CU-CONDIȚII**.

## Verdict

- Orice FAIL la o verificare blocantă dă STOP sau GO-CU-CONDIȚII, cum este precizat mai sus.
- Orice alt FAIL dă STOP; WARN și NEVERIFICAT dau GO-CU-CONDIȚII, cu condiția numită.
- GO numai când toate rândurile sunt PASS, cu dovadă.
