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

## Taskuri de cod și de date de aplicație

Partea de cod din `R-CLIP-1` și verificările `R-CLIP-5`, `R-CLIP-6` și `R-CLIP-7` se aplică numai unui task care scrie sau modifică cod (inclusiv migrări, scripturi și configurația aplicației) ori citește sau scrie date de aplicație (baza de date, metrici, exporturi, conturi de utilizatori). Natura taskului se stabilește din plan, cu `fișier:linie`, înainte de primul rând de verificare.

La orice alt task, aceste rânduri apar în raport cu PASS și dovada `nu se aplică: <natura taskului>, <fișier:linie>`. Un task care nu se poate încadra din plan primește la aceste rânduri NEVERIFICAT, cu întrebarea pentru D.

## Verificări blocante (autoverificare)

### R-CLIP-1: metoda de autoverificare este scrisă

Planul spune ce cont sau rol de test se folosește, pe ce date de test, ce stări se acoperă și ce dovadă observabilă înseamnă „merge”. Dovada se citește după reîncărcare, în rezultatul final, nu într-un indicator intermediar. Dovada de folosire de către om (deschiderea în programul lui, aspectul) se cere numai când D a numit un criteriu de folosire. (R-89, R-90, R-61)

La un task de cod sau de date de aplicație, metoda mai cuprinde:

- un mediu de test separat de producție, numit (adresă, bază sau clonă), pe care rulează ciclul;
- câte un cont de test pentru fiecare stare importantă a aplicației enumerată la `R-CLIP-2` (de exemplu rol, plată făcută sau nu, înregistrare terminată sau nu), cu sursa listei numită: fișier de seed, fixture sau document, fără parole în plan;
- faptul că agentul folosește singur conturile, fără ca un om să se autentifice pentru el, și reia ciclul de reparare și testare până când funcția trece toate cazurile, în limitele `R-CLIP-4`.

Dovada este `fișier:linie` din plan pentru fiecare punct, plus existența sursei listei de conturi (`ls` sau `stat`). Starea conturilor pe sistemul de test nu se cere în preflight. O verifică agentul care execută, la primul pas al ciclului, iar rândul o trece la condiții, nu la rezultat.

Dacă metoda lipsește, dovada observabilă nu este numită sau, la un task de cod ori de date de aplicație, lipsește mediul de test separat sau nu există niciun cont de test: **STOP**. Dacă conturile există, dar agentul nu le poate folosi singur (de exemplu cod de autentificare trimis pe telefonul unui om) sau planul nu spune că ciclul se reia până trece: **WARN**, deci **GO-CU-CONDIȚII**, cu lipsa numită.

### R-CLIP-2: cazurile de test sunt enumerate pe roluri și stări

Nu doar drumul fericit. Cazurile acoperă cel puțin rol cu drepturi limitate vs. rol cu drepturi depline, anonim vs. logat, cu cache vs. fără și, la aplicațiile care le au, plată făcută vs. nefăcută și înregistrare terminată vs. neterminată. O stare care nu se aplică, cu justificare scrisă, e acoperită. (R-115, R-213, R-98)

Dacă nu există nicio enumerare: **STOP**. Dacă enumerarea există, dar lasă o stare relevantă neacoperită fără justificare: **GO-CU-CONDIȚII**, cu starea lipsă numită.

### R-CLIP-4: ciclul de autoverificare rămâne în limite

Ciclul rulează numai pe clone sau în staging, din contul de test, în bugetul de cereri (cel mult 20, oprire la primul răspuns de tip `429`) și fără trimiteri pe formulare vii. (R-61, R-62, R-59, R-194, R-198)

Dacă planul prevede ciclul pe producție, peste buget sau cu trimiteri reale: **STOP**. Dacă limitele sunt respectate, dar bugetul sau contul de test nu sunt scrise explicit: **GO-CU-CONDIȚII**.

## Verificări pentru lucrul cu agenți pe cod și date

Se aplică numai după secțiunea „Taskuri de cod și de date de aplicație”. Sursa lor este în `clip.md`.

### R-CLIP-5: planul funcției este scris înainte de cod

Pentru funcția nouă sau schimbată, planul spune, înaintea primului pas care scrie cod: ce face funcția, ce fișiere sau module atinge, ce cazuri trebuie să treacă și după ce se vede că merge. Planul e discutat cu D sau aprobat de el, cu urmă în registrul de decizii. (R-02, R-16)

Dovada este `fișier:linie` din plan pentru secțiunea funcției și pentru intrarea din registru, plus ordinea pașilor: niciun pas de cod înaintea secțiunii.

- Taskul cere cod și planul nu descrie funcția, sau pune scrierea codului înaintea descrierii: **FAIL**.
- Descrierea există, dar nu are urmă de discuție sau aprobare: **WARN**.

### R-CLIP-6: accesul agentului la date și metrici este controlat

Când agentul citește sau scrie date de aplicație ori metrici (prin MCP, conexiune la bază, export sau panou), planul numește:

- calea de acces și faptul că e securizată (cont dedicat agentului, fără parole în plan);
- drepturile minime: numai citire, dacă taskul nu cere scriere, și numai tabelele, schemele sau metricile de care are nevoie;
- acordul scris al clientului pentru datele lui, cu sursa: document, mail sau clauză din contract, cu dată și domeniu;
- definițiile scrise ale măsurilor folosite: cine intră în calcul, ce cohortă, ce segment, ce perioadă.

Acordul trebuie să acopere tot ce face taskul cu datele clientului, inclusiv scrierile ciclului de autoverificare într-o clonă care conține datele lui. Un acord „numai citire” nu acoperă trimiterile de test care scriu în acea clonă. Drepturile și acordul se dovedesc din documentul numit, citit în această rulare, nu prin conectarea la bază. Un acord afirmat în plan fără sursă citibilă e NEVERIFICAT, de confirmat de D. Datele exclusiv de test sau sintetice nu cer acordul clientului, dacă planul spune asta cu `fișier:linie`.

- Taskul atinge date de client și lipsește acordul clientului sau toată verificarea: **FAIL**.
- Drepturile nu sunt limitate (scriere sau administrare fără motiv scris) la date de client: **FAIL**. La date care nu sunt ale unui client: **WARN**.
- Lipsesc definițiile măsurilor folosite sau calea de acces nu e numită: **WARN**.

### R-CLIP-7: skill-ul existent este verificat înainte de unul nou

Planul spune ce skill-uri existente pentru tipul acesta de muncă au fost căutate în biblioteca comună și care se folosește. Un skill nou se definește pe tipul de muncă, nu pe proiect, și se pune în biblioteca comună a echipei. (R-01)

Dovada este `fișier:linie` din plan. Dacă skill-ul numit trebuie să existe, i se verifică fișierul cu `ls`.

- Planul nu spune ce skill a fost căutat, sau creează un skill nou fără să fi căutat unul existent: **WARN**. Această verificare nu dă FAIL.

## Verdict

- Orice FAIL la o verificare blocantă dă STOP sau GO-CU-CONDIȚII, cum este precizat mai sus.
- La `R-CLIP-5`, `R-CLIP-6` și `R-CLIP-7` se aplică regula de mai jos: FAIL dă STOP, WARN dă GO-CU-CONDIȚII.
- Orice alt FAIL dă STOP; WARN și NEVERIFICAT dau GO-CU-CONDIȚII, cu condiția numită.
- GO numai când toate rândurile sunt PASS, cu dovadă.
