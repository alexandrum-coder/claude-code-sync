# Reguli — limbaj „planificat” vs. „făcut” și afirmații de absență

### R-118 — Munca viitoare nu se scrie în formulări care se pot citi ca terminată, iar raportul separă prin cifre ce e făcut de ce rămâne, inclusiv ce rămâne în sarcina lui D.
- **De ce:** o listă sub un titlu ambiguu sugerează că lucrurile există deja, iar rămășițele nelistate devin o datorie ascunsă.
- **Cum se verifică:** fiecare element declarat făcut e confirmat pe disc sau în sistem; numărul artefactelor existente se compară cu cel planificat; raportul final listează obiectele rămase, cu starea citită din sursă.
- **Cum corectează D:** caută artefactele declarate, nu le găsește și cere reformularea, cu cifre separate pe „făcut” și „rămas”.

### R-119 — Un lucru se declară terminat sau setat numai după ce starea lui finală a fost recitită din sursă; răspunsul unei cereri, un panou sau o stare parțială nu ajung.
- **De ce:** un răspuns gol sau un panou nu arată dacă efectul s-a produs, iar o stare raportată greșit înseamnă un livrabil greșit sau refaceri inutile pe un sistem public în producție.
- **Cum se verifică:** raportul distinge „setat și recitit” de „panoul arată”; starea obiectului e citită după acțiune și după reîncărcare.
- **Cum corectează D:** cere retragerea raportului dat pe stare parțială și raportare fără exagerări.

### R-120 — Un document datat poartă data citită din sistem în momentul scrierii, iar dacă execuția diferă de planificare, textul spune pentru ce zi era planificat.
- **De ce:** numele unui bloc de lucru nu e data reală, iar o dată presupusă se corectează apoi în multe locuri.
- **Cum se verifică:** `date` rulat înainte de orice dată scrisă; data din antet e egală cu cea de sistem.
- **Cum corectează D:** cere corectarea datei în toate locurile.

### R-121 — O afirmație fără observație directă în spate nu se prezintă ca fapt, ci poartă marcajul „NEVERIFICAT” până la probă.
- **De ce:** textul care sună sigur ascunde golul de dovezi, iar cititorul nu poate deosebi faptul verificat de presupunere.
- **Cum se verifică:** o căutare a marcajului în document găsește toate afirmațiile fără dovadă, iar numărul lor e raportat; raportul separă „măsurat” de „presupus”.
- **Cum corectează D:** cere marcajul, proba sau scoaterea afirmației.

### R-122 — Ce rezultă din deducție (citirea codului, numele unei componente, un document de proiect, o presupunere declarată ca atare) rămâne ipoteză până la testul observat în condițiile reale, iar un ecran nevăzut nu se descrie.
- **De ce:** un drept sau o funcție pot exista pe hârtie fără cale în interfață și invers, iar descrierea fără dovadă ajunge în documentul livrat și se propagă.
- **Cum se verifică:** captură sau text din ecranul real, din contul rolului care va folosi procedura; pasul fără dovadă spune ce se verifică, nu cum arată.
- **Cum corectează D:** decide ce intră în materiale după ce vede dovada; cere marcarea ca ipoteză sau scoaterea descrierii.

### R-123 — O cauză nedovedită nu se declară: se listează ce s-a exclus prin verificare, cauza rămâne neexplicată, iar o teorie infirmată se consemnează ca infirmată.
- **De ce:** o ipoteză prezentată ca fapt orientează greșit remedierea, iar una plauzibilă, neconsemnată ca infirmată, consumă ture de lucru.
- **Cum se verifică:** lista excluderilor, cu dovada fiecăreia; eticheta „NEVERIFICAT” lângă cauza presupusă; testul care a infirmat teoria e notat.
- **Cum corectează D:** cere retragerea cauzei declarate sau reformularea ca ipoteză.

### R-124 — Un test se raportează la puterea lui reală: dacă nu putea infirma ipoteza sau nu a ajuns la componenta vizată e neconcludent, nu negativ, iar limitele lui se declară.
- **De ce:** condițiile deja populate, un filtru intermediar sau o verificare slabă prezentată drept tare dau o siguranță falsă; o dovadă care nu se poate obține curat se declară ca limită, nu se falsifică.
- **Cum se verifică:** formularea „neconcludent” sau nota despre limite e în raport; testul e repetat pe calea reală și corelat cu codul; tipul verificării (cod de stare sau sumă de control) e numit.
- **Cum corectează D:** cere refacerea testului în condiții curate sau declararea limitei.

### R-125 — Nu se promite și nu se formulează mai mult decât arată dovada: un rezultat, o cale de revenire, o dată, o proveniență sau poziția altcuiva.
- **De ce:** efectele secundare ale sistemului pot schimba rezultatul promis, un câmp poate însemna altceva decât pare, iar o poziție exagerată a celeilalte părți poate strica relația.
- **Cum se verifică:** obiectul e citit după creare; promisiunea are o probă; sursa exactă a datei e numită; formularea e comparată cu citatul din sursă.
- **Cum corectează D:** cere retragerea promisiunii sau reformularea.

### R-126 — Când două surse se contrazic, contradicția se consemnează cu ambele locuri și nu se rezolvă prin presupunere sau alegere tăcută; dacă una are dovadă executabilă, se ia aceea și se raportează.
- **De ce:** o presupunere ia forma unui fapt, ajunge nevăzută în livrabil și poate altera o decizie care nu aparține executantului.
- **Cum se verifică:** contradicția apare marcată „de confirmat” sau „NEVERIFICAT”, cu cele două surse numite și motivul.
- **Cum corectează D:** decide explicit varianta sau cere testul din contul potrivit.

### R-127 — Aceeași denumire în două documente poate desemna lucruri diferite, iar două denumiri diferite pot fi amândouă reale; se verifică ce desemnează fiecare înainte de a le unifica sau de a scoate una.
- **De ce:** subiecte distincte se contopesc sub un singur nume, iar un termen real scos pe nedrept produce modificări greșite.
- **Cum se verifică:** definiția fiecărui termen e citită din sursa lui; documentele poartă note de delimitare.
- **Cum corectează D:** cere separarea subiectelor sau formularea care numește ambele denumiri.

### R-128 — O notă de blocare sau o ipoteză moștenită dintr-un plan se compară cu starea de acum și cu ultima încercare, înainte de a propune ceva pe baza ei.
- **De ce:** starea blocată la prima încercare poate fi rezolvată între timp, iar un plan sau un handoff poate duce eroarea mai departe, nepusă la îndoială.
- **Cum se verifică:** cea mai recentă dovadă e citită direct (fișierul pe disc, rezultatul ultimei încercări, materialul însuși).
- **Cum corectează D:** arată dovada și cere retragerea recomandării sau a notei.

### R-129 — „Nu există” se scrie numai după epuizarea spațiului de căutare în sistemul însuși, iar o analiză anterioară nu ține loc de interogare.
- **De ce:** prezența cere o singură potrivire, absența cere epuizarea; un document anterior poate fi chiar sursa erorii, care se propagă în handoff-uri și în textele trimise în exterior, iar o afirmație de absență care contrazice documentația e un semnal să se caute mai departe.
- **Cum se verifică:** interogare directă pe fiecare termen: liste, adrese candidate, lanțul de legături urmărit până la capăt, pagina derulată, panourile desfăcute; interogările încercate sunt notate.
- **Cum corectează D:** arată o dovadă care infirmă afirmația și cere retragerea ei, cu refacere pe baza interogării.

### R-130 — Când căutarea nu găsește nimic, se scrie „nu l-am găsit în [locurile verificate]”, nu „nu există”, căutarea se oprește, iar trimiterile la o sursă lipsă se preiau exact și se marchează „NEVERIFICAT”.
- **De ce:** formularea cu locuri păstrează adevărul și lasă ușa deschisă corecției, iar căutarea repetată a unei surse absente nu produce dovezi.
- **Cum se verifică:** fiecare enunț de absență are alături lista locurilor; nota de lipsă indică o singură căutare făcută, cu data și termenul; decizia care acoperă cazul e citată.
- **Cum corectează D:** cere reformularea cu lista locurilor și scoaterea oricărei trimiteri prezentate ca verificată fără sursă.

### R-131 — Un rezultat gol dovedește absența numai dacă citirea a reușit, deci întâi se exclud eroarea, încărcarea neterminată, lipsa contextului cerut și pagina de control anti-robot.
- **De ce:** o eroare suprimată, o pagină nerandată sau un răspuns automat arată la fel ca lipsa conținutului.
- **Cum se verifică:** a doua citire după pauză, cu lungime nenulă; existența uneltei e verificată și eroarea citită, nu suprimată; numărul din sursa de date e comparat cu cel din interfață; adresa e confirmată într-un browser real.
- **Cum corectează D:** cere recitirea cu parametrii corecți înainte de orice afirmație de absență.

### R-132 — Un rezultat gol dintr-o căutare filtrată nu dovedește absența până nu se verifică domeniul: filtrul, starea, limba, dosarul sau scopul implicit, inclusiv starea locală care le restrânge tăcut.
- **De ce:** lista implicită poate ascunde categorii întregi, iar un gol fals consumă cereri și produce concluzii greșite.
- **Cum se verifică:** fiecare cerere numește explicit parametrii; aceeași interogare rulează separat pe fiecare domeniu, iar numărul întors e comparat cu cel cerut.
- **Cum corectează D:** cere repetarea căutării pe domeniul complet.

### R-133 — O potrivire zero nu dovedește absența până nu se verifică tiparul: se caută forme alternative și fragmente scurte, iar tiparul se probează pe un element cunoscut.
- **De ce:** textul extras poate avea caractere comasate, cuvinte rupte, diacritice sau o structură diferită de cea presupusă.
- **Cum se verifică:** aceeași căutare pe două forme, cu rezultatele comparate; tiparul găsește elementul cunoscut; numărul de pagini sau de fișiere acoperite e verificat.
- **Cum corectează D:** cere repetarea căutării și retragerea afirmației de absență.

### R-134 — Înainte de a declara absent un atribut sau o valoare, se citește forma brută a elementului, fiindcă absent, gol și scris greșit sunt stări diferite.
- **De ce:** o valoare corectă poate fi ruptă de un singur caracter sau serializată ca șir gol, iar diagnosticul greșit duce la o corecție greșită.
- **Cum se verifică:** fragmentul complet e tipărit și citit, nu doar rezultatul potrivirii; valoarea brută e comparată cu cea așteptată.
- **Cum corectează D:** cere afișarea sursei brute, precizarea stării reale și corecția minimă.

### R-135 — O afirmație despre întindere sau despre ce lipsește dintr-o listă se sprijină pe mulțimea completă, nu pe un eșantion sau pe prima pagină.
- **De ce:** un eșantion ales nu reprezintă setul, iar o paginare incompletă sau într-o ordine instabilă omite și dublează elemente.
- **Cum se verifică:** rândurile colectate sunt comparate cu totalul declarat de sistem; numărul identificatorilor unici e egal cu numărul elementelor primite.
- **Cum corectează D:** cere retragerea afirmației și refacerea inventarului.

### R-136 — Un control care nu apare pe ecran nu e absent din sistem până nu e căutat după text, în toate stările și pe calea reală de utilizare.
- **De ce:** controlul poate fi pliat, ascuns, invizibil, într-un meniu separat sau prezent numai într-o anumită stare, iar o metodă de interacțiune care eșuează tăcut se citește ca absență și ajunge în documentele pentru utilizatori.
- **Cum se verifică:** căutare după text în toată structura paginii, inclusiv în elementele ascunse; citire în fiecare stare și pe toate secțiunile; interacțiune reală, cu starea recitită după fiecare încercare.
- **Cum corectează D:** respinge afirmația și cere reluarea verificării pe calea reală.

### R-137 — Înainte de a declara lipsă o funcție sau de a construi manual un substitut, se verifică toate ecranele care ar putea-o oferi și setarea care o activează.
- **De ce:** o funcție oprită arată identic cu una inexistentă, iar un plan construit pe lipsa ei o ocolește degeaba.
- **Cum se verifică:** ecranele relevante sunt enumerate, cu comenzile fiecăruia; starea reală a comutatorului e citită din sursă.
- **Cum corectează D:** arată ecranul care are funcția și cere reluarea pe calea nativă.

### R-138 — Existența unui obiect se stabilește prin identificator, din registrul de mapare sau prin citire directă, nu după numele fișierului, după o listă derivată sau după o căutare.
- **De ce:** numele de pe disc poate fi arbitrar, o listă derivată măsoară altceva, iar contoarele, listele și căutările vin din surse care pot rămâne în urmă.
- **Cum se verifică:** identificatorul e găsit în registru și fișierul indicat e deschis; obiectul e citit direct după identificator; contorul e comparat cu numărul de rânduri.
- **Cum corectează D:** arată elementele care există deja și cere refacerea listei.

### R-139 — Înainte de a cere ceva din exterior sau de a marca o informație „de confirmat”, informația se caută în proiect.
- **De ce:** un marcaj spune doar că informația lipsea la redactare, nu cine o deține, iar o listă umflată trimisă în exterior arată că executantul nu își cunoaște propriile date.
- **Cum se verifică:** `grep` pe termen în tot proiectul; în exterior pleacă numai restul real.
- **Cum corectează D:** cere căutarea în proiect și scoaterea marcajului dacă valoarea există.

### R-140 — O limită („nu se poate”, „nu are”) se afirmă numai după un test minimal și după căutarea unei alternative.
- **De ce:** un test mic poate infirma imposibilul, un inventar indirect poate rata o capacitate reală, iar o altă cale sau o regulă generală poate închide cazul declarat inevitabil.
- **Cum se verifică:** testul mic e reprodus; calea alternativă e executată, iar rezultatul ei citit; regula generală e încercată pe cazurile neacoperite.
- **Cum corectează D:** cere retragerea afirmației de limită.

### R-141 — „E stricat” sau „sistemul nu poate” se scrie numai după ce se exclude propria metodă și se compară cu un loc unde funcția merge.
- **De ce:** o eroare poate veni dintr-o setare, dintr-un argument greșit, dintr-o sondă indirectă, din clientul de test sau din citirea altei forme decât cea văzută de utilizator, iar o afirmație negativă greșită ajunge în documente și în cereri către client.
- **Cum se verifică:** apel minimal reușit, după citirea semnăturii reale; comanda oficială de diagnostic; comparație element cu element; reproducere în condițiile utilizatorului; suma de control a rezultatului.
- **Cum corectează D:** corectează afirmația într-un rând, cere reproducerea înainte de orice reparație și reluarea lucrului.

### R-142 — O concluzie falsă se corectează printr-o notă datată, cu cauza și lista afirmațiilor care cad, iar o corecție globală pornită dintr-o concluzie de absență se aplică numai după reverificarea ei.
- **De ce:** afirmațiile false rămân citate în alte documente, iar o supracorecție strică documente deja bune.
- **Cum se verifică:** nota datată enumeră ce se retrage; concluzia e reverificată în mediul real înainte de modificările în masă.
- **Cum corectează D:** cere corectarea notei și restaurarea a ceea ce s-a scos pe nedrept.
