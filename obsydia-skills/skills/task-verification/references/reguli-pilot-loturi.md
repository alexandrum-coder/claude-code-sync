# Reguli — pilot și loturi

### R-69 — Un lot de scrieri începe cu un pilot pe un singur element, verificat complet după reîncărcare, din sursa reală și cu rolul real, iar restul pornește numai după aprobarea pilotului.
- **De ce:** o greșeală de metodă sau o procedură scrisă prin analogie se repetă identic pe tot lotul, uneori vizibil public; pilotul o scoate la iveală când costă un singur element.
- **Cum se verifică:** recitirea pilotului din sursă, după reîncărcare, și citirea rezultatului public arată valoarea nouă; pilotul e raportat și aprobat explicit înainte de lot.
- **Cum corectează D:** cere oprirea lotului și revenirea la pilot cu dovada recitirii; la o stricăciune publică, cere revenirea imediată la valorile anterioare.

### R-70 — Confirmarea lui D e valabilă numai pentru lotul descris în cerere, iar lotul următor primește o cerere nouă.
- **De ce:** un lot următor poate avea alte obiecte, alte valori și alte riscuri decât cel aprobat.
- **Cum se verifică:** fiecare lot are propria cerere de confirmare, cu lista lui.
- **Cum corectează D:** oprește extinderea și cere o cerere nouă pentru lotul neaprobat.

### R-71 — Scrierile pe un obiect pe care îl pot edita și alții se fac pe rând, fiecare precedată de recitirea datei modificării și a lungimii sau a sumei de control, iar între pilot și restul lotului omul confirmă că nicio sesiune de editare nu e deschisă.
- **De ce:** o sarcină paralelă sau un editor deschis în altă sesiune poate suprascrie tăcut o scriere, din memoria lui, fără nicio eroare, iar conflictul nu se vede din sesiunea curentă.
- **Cum se verifică:** data și suma de control, recitite înainte de fiecare scriere, sunt egale cu ultima valoare cunoscută; confirmarea omului e consemnată; scrierea pornește de la versiunea proaspăt citită.
- **Cum corectează D:** cere oprirea lotului la orice diferență, recitirea stării și refacerea scrierii pierdute.

### R-72 — Copia de siguranță a fiecărui obiect afectat se face și se verifică înaintea primei scrieri a lotului.
- **De ce:** un lot aprobat o singură dată nu are a doua ocazie, o copie făcută după prima scriere preia versiunea nouă, iar o copie aplatizată poate suprascrie tăcut fișierele cu același nume.
- **Cum se verifică:** manifestul de sume de control e verificat și numărul de fișiere e egal cu al originalelor înaintea oricărei scrieri; dacă s-a scris totuși întâi, o notă consemnează proveniența fiecărui fișier recuperat din copii mai vechi.
- **Cum corectează D:** cere copia, oprirea lucrului și refacerea ordinii.

### R-73 — O copie de siguranță declară ce garantează, referință de conținut sau identitate bit cu bit, și se confirmă prin sumă de control față de sursă înainte de a te baza pe ea la restaurare.
- **De ce:** captarea ieșirii poate normaliza conținutul, iar un canal care trunchiază poate corupe copia fără să se vadă.
- **Cum se verifică:** compararea cu sursa printr-o citire fără normalizare; suma de control a copiei de pe disc e egală cu cea calculată la sursă.
- **Cum corectează D:** cere refacerea copiei din sursă, verificată pe sumă de control, înainte de prima scriere.

### R-74 — Scriptul și datele unui lot se validează într-o rulare simulată, pe mașina țintă, înainte de primul pas real.
- **De ce:** un lot rupt la mijloc lasă elemente pe jumătate procesate, fără avertisment, un pas scump consumă buget irecuperabil, iar un script destinat altei mașini nu se poate verifica local.
- **Cum se verifică:** rularea simulată sau testul offline trece, iar forma datelor și numărul potrivirilor sunt citite înaintea pasului real.
- **Cum corectează D:** oprește pasul și cere rularea de probă; dacă lotul s-a rupt, cere restaurarea din copia de siguranță.

### R-75 — Aceeași schimbare de text în mai multe locuri se face cu un singur script pe perechi exacte, care cere exact o potrivire per pereche, pe forma reală a textului din fiecare format, și nu scrie nimic dacă vreuna eșuează.
- **De ce:** scrierea parțială produce o stare incoerentă, iar diferențele de formulare, de caractere sau de codificare fac potrivirile să dea zero, fără eroare.
- **Cum se verifică:** într-o rulare simulată, contorul fiecărei perechi e 1 și caracterele de pe liniile țintă sunt afișate; după rulare, textul vechi se numără pe fiecare format, iar rezultatul se compară cu copia de siguranță.
- **Cum corectează D:** cere oprirea editărilor ad-hoc și refacerea lotului cu verificarea potrivirii unice.

### R-76 — O curățare în lot pe text lucrează numai pe unități întregi (bloc, rând de tabel, secțiune, propoziție completă) și are o poartă care refuză scrierea la tipare de frază ruptă.
- **De ce:** o expresie prea largă rulează fără eroare, dar rupe propoziții, iar stricăciunea se vede abia la citit și poate ajunge în livrabil.
- **Cum se verifică:** unitatea e definită înainte de script; poarta caută fraze rupte, iar rezultatul se compară cu copia de siguranță.
- **Cum corectează D:** cere restaurarea din copia de siguranță.

### R-77 — O verificare de siguranță dintr-un lot se face pe un marcaj unic și destul de îngust, testat înainte de lot, iar o potrivire îndoielnică oprește lotul.
- **De ce:** o frază inserată de o înlocuire anterioară poate declanșa santinela și bloca o scriere corectă, iar o normalizare prea largă elimină părți legitime și verificarea nu mai prinde nimic.
- **Cum se verifică:** proba offline are un scenariu cu un caz de margine; scriptul raportează ce a scris și ce a sărit, iar „nimic scris” pe un element care trebuia modificat se investighează.
- **Cum corectează D:** cere refacerea scriptului cu marcaj unic și rularea lui pe copie.

### R-78 — Când operațiile unui lot se influențează între ele (prefixe, renumerotări, unicitate), ordinea se stabilește înainte, iar numărătorile se refac pe starea curentă după fiecare operație.
- **De ce:** primele modificări pot strica potrivirile următoare, un bloc scurt poate fi prefixul unuia lung, iar un cod mutat se poate ciocni de cel încă folosit, deci numărătoarea făcută dinainte minte.
- **Cum se verifică:** numărul de potriviri așteptat și simularea ordinii, înainte de scriere; raportul operațiilor intrate față de cele propuse, citit din starea finală.
- **Cum corectează D:** cere un plan de ordine, refacerea ordinii și pilot pe un element cu cifrele reale înainte de rest.

### R-79 — Ținta fiecărei scrieri se identifică după o etichetă stabilă, nu după poziție sau număr de ordine, iar identitatea ei și valorile se recitesc imediat înainte de salvare și după acțiune.
- **De ce:** fiecare inserare decalează numerotarea, o acțiune din interfață poate atinge alt obiect fără nicio eroare, iar o salvare pe valori reîncărcate scrie starea veche.
- **Cum se verifică:** eticheta țintei coincide cu cea din plan înainte de fiecare scriere; identificatorul obiectului afectat e citit după acțiune.
- **Cum corectează D:** oprește lotul și cere refacerea listei pe etichete, respectiv anularea și repetarea pe ținta corectă.

### R-80 — O scriere care trebuie să schimbe un singur câmp se verifică prin compararea obiectului întreg înainte și după, iar o cale de salvare care poate renormaliza conținutul se măsoară pe un caz de test înainte de lot.
- **De ce:** o salvare poate renormaliza alte câmpuri sau alte locuri fără să spună, iar scrierea parțială a unei liste poate șterge celelalte rânduri.
- **Cum se verifică:** diferența completă dintre starea citită înainte și cea citită după reîncărcare arată numai câmpul țintă și data modificării; suma de control a cazului de test e măsurată înainte și după.
- **Cum corectează D:** cere diferența, oprirea lotului și revenirea dacă apare orice alt câmp.

### R-81 — Valoarea nouă a unui obiect complex se scrie întreagă, luată din sursa aprobată sau dintr-o copie proaspătă, nu reconstruită din memorie, iar un pas care depinde de un rezultat datat se reface dacă data s-a schimbat.
- **De ce:** la reconstrucție se pierd etichete și excepții, un model copiat poate fi gol, serializarea unui editor poate diferi de fișierul verificat, iar o dependență datată devine invalidă la trecerea peste miezul nopții.
- **Cum se verifică:** suma de control a conținutului scris coincide cu cea a fișierului aprobat; comparația arată că modelul are conținut; data rezultatului anterior coincide cu data de la momentul scrierii.
- **Cum corectează D:** cere reluarea scrierii din fișierul aprobat sau repetarea pasului de citire.

### R-82 — Un lot lung se sparge în pachete mici, sub limita reală de timp a canalului, cu stare scrisă pentru fiecare element, iar după orice întrerupere starea se reconstituie din sursa de adevăr și se reia numai diferența.
- **De ce:** o comandă expirată pierde ce a afișat, deși lucrul poate continua pe server, iar reluarea de la capăt produce dubluri sau rescrie ținte deja făcute.
- **Cum se verifică:** timpul fiecărei cereri din pilot, fișierul de stare și jurnalul loturilor; lista reală de obiecte e citită din sursă, iar diferența față de plan se calculează înainte de orice scriere.
- **Cum corectează D:** cere oprirea la prima expirare sau la o stare ambiguă, raportarea stării exacte, curățarea dublurilor și reluarea numai a diferenței.

### R-83 — Listele de lucru și numărătorile unui lot se generează programatic din sursa canonică, complet, nu se transcriu din ecran și nu se iau dintr-o vizualizare parțială sau derivată.
- **De ce:** o listă transcrisă poate duce la o copie de siguranță pe ținte greșite, o numărătoare pe prima pagină poate crea dubluri, iar o vizualizare derivată își poate ține rezultatul vechi și arată ca un eșec.
- **Cum se verifică:** parcurgerea se oprește când o pagină nu mai aduce identificatori noi; numărul final se compară cu cel declarat de sursă și cu cel al elementelor create.
- **Cum corectează D:** cere recitirea numărului din sursa canonică și refacerea lucrului pe lista corectă.

### R-84 — Înaintea unei munci costisitoare pe un set, se rulează o dată, pe tot setul, un test ieftin care arată ce e deja făcut și ce se poate executa.
- **De ce:** deschiderea fiecărui element consumă o sesiune, un registru poate descrie greșit starea reală, iar fără triaj se irosește munca pe elemente neexecutabile.
- **Cum se verifică:** rezultatul testului e un tabel pe elemente, completat înaintea primului pas costisitor, iar elementele îndoielnice se privesc direct.
- **Cum corectează D:** cere reluarea inventarului cu testul pe tot setul.

### R-85 — După două încercări identice și un control cu același rezultat, nu se mai încearcă a treia oară, ci se raportează.
- **De ce:** reîncercările pe un sistem live adaugă efecte laterale fără să aducă informație nouă.
- **Cum se verifică:** numărul de încercări și controlul sunt consemnate, iar starea sistemului se recitește după a doua încercare.
- **Cum corectează D:** cere oprirea și raportarea cauzei sau a defectului.

### R-86 — Înaintea unui lot pe un sistem live se identifică efectele din afara obiectelor țintă, ca notificările trimise sau navigarea comună, care se dezactivează ori primesc aprobare separată și o fotografie a stării.
- **De ce:** un lot poate trimite mesaje reale către persoane sau poate afecta elemente neașteptate.
- **Cum se verifică:** cererea e construită fără câmpul care declanșează efectul, iar rezultatul e confirmat printr-o dovadă independentă; după fiecare lot, starea se compară cu fotografia.
- **Cum corectează D:** oprește lotul la primul efect neintenționat și cere aprobare separată și revenirea.

### R-87 — O probă pe obiecte reale se anunță, nu se salvează și nu lasă urme: starea partajată se restaurează, iar proba se aruncă și se verifică din exterior.
- **De ce:** o probă salvată modifică un obiect public, modificările nesalvate pot rămâne în suspensie, iar o stare comună, de exemplu clipboardul, poate aparține și altor file ale omului.
- **Cum se verifică:** o cerere fără cont către versiunea publică arată conținutul de dinainte de probă; valoarea restaurată e recitită.
- **Cum corectează D:** cere restaurarea valorii, verificarea publică și, la nevoie, revenirea la copia de siguranță.

### R-88 — Un defect dintr-o copie derivată se repară la sursă, nu în copie.
- **De ce:** prima regenerare sau sincronizare readuce defectul reparat numai în copie.
- **Cum se verifică:** se rulează regenerarea sau sincronizarea, apoi se recitește rezultatul.
- **Cum corectează D:** cere refacerea în sursă.
