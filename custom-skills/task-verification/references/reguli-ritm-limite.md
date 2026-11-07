# Reguli — ritm și limite pe sisteme externe

### R-192 — Pe un sistem extern, cererile merg secvențial, cu pauză fixă între ele și un număr limitat de reîncercări, iar paralelismul nu se folosește nici la scanările pe tot sistemul.
- **De ce:** rafalele declanșează protecția sistemului, iar blocarea lovește adresa de rețea a omului, nu numai lucrarea în curs.
- **Cum se verifică:** scriptul lotului are o singură coadă de cereri, o pauză fixă și un contor de reîncercări; aceeași scanare rulată serial nu mai dă erori.
- **Cum corectează D:** cere oprirea, reducerea ritmului și trecerea la secvențial.

### R-193 — Înainte de orice lot spre un sistem extern, se anunță numărul de cereri, motivul, ritmul, durata estimată, consumul de până atunci și riscul de blocare, iar lotul pornește numai cu acordul omului.
- **De ce:** o rafală neanunțată poate bloca accesul și poate crea impresia unei căderi, iar un ritm sigur poate însemna ore de lucru, nu minute.
- **Cum se verifică:** înainte de pornire există în scris numărul de cereri, ritmul, durata și acordul primit.
- **Cum corectează D:** oprește lotul și cere un protocol scris și o durată recalculată înainte de reluare.

### R-194 — Prima cerere dintr-o sesiune e o sondă, iar la primul semnal real de blocare, fie el la sondă sau în lot, se oprește tot ce trimite cereri, se raportează și se reia numai după o pauză și cu acordul omului, fără reîncercări și fără altă unealtă care să ocolească limita.
- **De ce:** o limitare poate dura ore după cauza ei, iar insistența după primul semnal duce la blocare completă.
- **Cum se verifică:** răspunsul primei cereri e citit înainte de lot; după oprire nu mai rulează niciun proces și nu mai e deschisă nicio resursă care trimite cereri.
- **Cum corectează D:** cere oprirea imediată și raportarea, nu continuarea.

### R-195 — Condiția de oprire a unui lot se scrie dinainte, pe status și pe conținut, separând semnalele reale de răspunsurile așteptate prin construcție și de un răspuns lent izolat, iar cererile care declanșează limitări prin proiectare se pun ultimele.
- **De ce:** o regulă naivă oprește lotul la prima verificare reușită, una prea laxă nu oprește când trebuie, iar o limitare prin proiectare pusă devreme blochează restul lotului.
- **Cum se verifică:** lista răspunsurilor așteptate și pragul de răspunsuri lente la rând sunt scrise înainte de lot; scriptul testează explicit codul de limitare și corpul răspunsului; ordinea din plan pune cererile limitate la final.
- **Cum corectează D:** cere reformularea condiției de oprire și reordonarea lotului.

### R-196 — O respingere mult mai rapidă decât un răspuns normal se tratează ca o cotă epuizată, deci nu se reîncearcă și nu se ocolește cu resurse noi, ci se spune omului, care decide, iar o altă cale se propune numai dacă nu pornește trafic nou spre sistem.
- **De ce:** cota ține de cont, nu de resursă, iar încercările repetate sau ocolirile o irosesc și pot bloca adresa.
- **Cum se verifică:** durata răspunsului e măsurată, răspunsul serviciului e citat, iar după oprire nu mai pleacă nicio cerere nouă spre sistem.
- **Cum corectează D:** cere oprirea și decide dacă așteaptă, schimbă planul sau trece pe altă cale.

### R-197 — Pe un sistem public în producție lucrează o singură sesiune, firele paralele rămân pe disc până le vine rândul, iar paralelul se face numai la cererea explicită a omului.
- **De ce:** firele pleacă de pe aceeași adresă și cererile lor se adună, iar agenții care trec prin aceeași sesiune nu aduc viteză, ci se calcă între ei.
- **Cum se verifică:** înainte de pornire se listează sesiunile și procesele active, iar ce nu e al tău nu se atinge și se întreabă omul.
- **Cum corectează D:** oprește lucrul pe sistem până se stabilește o singură sesiune.

### R-198 — Contorul de cereri se ține pe zi, nu pe sesiune, și include tot, adică cererile deja făcute, verificările „rapide” și ce trimit singure uneltele, iar plafonul zilnic se semnalează separat de aprobarea unui lot, depășirea rămânând decizia omului.
- **De ce:** o estimare care ignoră cererile deja trimise sau pe cele ascunse dă un anunț fals, iar o reluare a contextului nu resetează consumul real.
- **Cum se verifică:** jurnalul are totalul zilei, iar anunțul arată suma dintre cererile făcute și cele noi, comparată cu plafonul.
- **Cum corectează D:** cere retragerea anunțului, recalcularea cu tot cu cererile ascunse și decide continuarea.

### R-199 — O resursă care consumă buget cât stă deschisă se deschide numai după „ok”, numai una și în forma cea mai simplă care dă răspunsul, se închide imediat după citire și nu rămâne deschisă cât se așteaptă un răspuns.
- **De ce:** deschiderea costă mai multe cereri, iar un ecran lăsat deschis trimite singur semnale periodice, până depășește plafonul fără nicio acțiune vizibilă.
- **Cum se verifică:** jurnalul are ora deschiderii, costul măsurat și timpul cât a stat deschisă; la final nu mai rămâne deschisă nicio resursă și nu mai apare nicio cerere periodică.
- **Cum corectează D:** cere închiderea resursei și reluarea numai după „ok”.

### R-200 — Înainte de a cheltui o cerere se verifică ce se poate afla gratuit, adică datele de pe disc, tipul și adresa obiectului și dacă ținta se mai rezolvă, iar o cerere nouă se face numai dacă răspunsul schimbă decizia.
- **De ce:** s-au pierdut cereri pe obiecte de tip greșit și pe date deja salvate, iar o țintă dispărută poate face inutil un lot întreg.
- **Cum se verifică:** căutarea pe disc și rezultatul interogării de nume sunt consemnate înainte de lot.
- **Cum corectează D:** cere citirea datelor existente și reducerea lotului.

### R-201 — Sub un buget de cereri, citirile se grupează într-un export sau o interogare agregată, iar tot ce trebuie din răspuns se salvează pe disc înainte de închiderea resursei.
- **De ce:** cererile mici consumă repede bugetul și cresc riscul de blocare, iar o resursă închisă prea devreme pierde cererea plătită.
- **Cum se verifică:** numărul de cereri e mai mic decât numărul de obiecte citite, iar fișierul salvat conține datele înainte de închidere.
- **Cum corectează D:** cere gruparea și repetarea numai a cererii pierdute, cu extragerea înainte de închidere.

### R-202 — Numai citirile idempotente se reîncearcă automat, iar la un rezultat necunoscut, un eșec raportat sau un răspuns „inexistent” de la o unealtă de stare nu se relansează nimic până când o a doua sursă nu arată ce s-a întâmplat, retrimiterea unei scrieri rămânând decizia lui D.
- **De ce:** o cerere poate reuși chiar dacă răspunsul a expirat, iar o unealtă de stare poate greși, deci o relansare creează dubluri sau pierde din vedere o ieșire deja completă.
- **Cum se verifică:** scriptul separă citirile cu reîncercări de scrierile fără reîncercări; înainte de orice a doua încercare, obiectul sau ieșirea sunt listate și numărate pe sursă.
- **Cum corectează D:** cere eliminarea reîncercării de pe scriere, a dublurilor create și numărarea înainte de relansare.

### R-203 — La un timeout sau la un pas care durează, nu se repetă cererea, ci se așteaptă pe o condiție, printr-o interogare a stării, nu printr-o pauză lungă și fixă.
- **De ce:** repetarea consumă bugetul fără beneficiu, iar o pauză fixă ocupă tura fără să spună dacă lucrarea s-a terminat.
- **Cum se verifică:** starea e citită prin interogare, iar bucla se termină pe condiția de finalizare; jurnalul nu are cereri repetate pentru același pas.
- **Cum corectează D:** cere oprirea reîncercărilor.

### R-204 — O eroare de rețea sau un răspuns de blocare nu e o constatare despre conținut și nu intră în raport până nu e reluat serial, cu pauză, pe o cale care arată conținutul real.
- **De ce:** concurența și protecția sistemului produc erori care arată exact ca un defect, deci raportul iese fals acolo unde totul e în regulă.
- **Cum se verifică:** obiectele cu eroare sunt reluate serial, răspunsul conține conținutul real, nu o pagină de provocare, iar raportul are numai ce a rămas eșuat după reluare.
- **Cum corectează D:** cere retragerea raportului fals și refacerea verificării într-un ritm redus.

### R-205 — Lucrările riscante pe un sistem în producție se programează în afara orelor de trafic, cu „ok” pentru sesiune și pentru fiecare scriere, câte o scriere odată și cu revenirea pregătită.
- **De ce:** o scriere greșită la ore de trafic atinge utilizatori reali, iar fără revenire pregătită nu poate fi anulată repede.
- **Cum se verifică:** planul conține ora ferestrei, aprobările și calea de revenire pentru fiecare scriere.
- **Cum corectează D:** cere mutarea în fereastra de trafic redus și „ok”-uri separate.

### R-223 — Un prompt de reluare sau un plan pe un sistem în producție poartă cu el limitele de frecvență și interdicția de a bloca sistemul.
- **De ce:** dacă limitele stau numai în memoria sesiunii, sesiunea următoare le pierde și poate bloca sistemul.
- **Cum se verifică:** textul promptului sau al planului conține limitele și condiția de oprire.
- **Cum corectează D:** cere adăugarea limitelor și a avertismentului în prompt, înainte de pornire.
