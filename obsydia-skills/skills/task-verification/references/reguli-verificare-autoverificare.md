# Reguli — verificare și autoverificare

### R-89 — Verifici efectul unei acțiuni în rezultatul final, așa cum îl primește destinatarul, nu într-un indicator intermediar.
- **De ce:** o numărătoare, o prezență în sursă sau o imagine mică pot da rezultate false în ambele sensuri, fiindcă defectul stă în locul pe care indicatorul nu îl vede.
- **Cum se verifică:** rezultatul final e deschis, randat sau interogat direct, iar raportul spune ce s-a citit și de unde.
- **Cum corectează D:** cere refacerea verificării pe rezultatul real, cu dovadă.

### R-90 — Un mesaj de succes, un cod de răspuns, o valoare returnată sau o valoare afișată nu dovedesc efectul, deci recitești conținutul din sursă după reîncărcare, inclusiv la propriile scrieri.
- **De ce:** sistemul poate raporta reușita și poate pierde tăcut conținutul, o pagină de refuz poate veni cu cod de succes, iar o valoare tastată într-un câmp nu e încă o valoare salvată.
- **Cum se verifică:** valoarea sau lungimea conținutului, citită din sursă după reîncărcare și comparată cu ce s-a scris.
- **Cum corectează D:** cere repetarea scrierii și a verificării după reîncărcare.

### R-91 — După un eșec aparent sau un timeout al unei acțiuni cu efect, nu reiei acțiunea până nu citești starea reală a sistemului.
- **De ce:** eroarea poate fi în citirea răspunsului, nu în operație, iar reluarea oarbă creează dubluri.
- **Cum se verifică:** obiectul căutat după identificator sau în listă, într-o invocare separată, înainte de orice reluare.
- **Cum corectează D:** oprește lucrul, cere reconstituirea stării și aprobă curățarea dublurilor.

### R-92 — Înainte să crezi o măsurătoare sau să scrii, confirmi că lucrezi pe obiectul vizat, în zona vizată.
- **De ce:** o pagină de eroare, o altă listă sau o zonă vecină dau cifre plauzibile, iar absența unui element poate însemna doar că te afli în alt loc.
- **Cum se verifică:** adresa, titlul sau identificatorul obiectului măsurat, citite odată cu măsurătoarea.
- **Cum corectează D:** cere refacerea măsurătorii pe obiectul corect.

### R-93 — Orice cifră raportată poartă unitatea, mulțimea numărată și condițiile numărării, iar numărarea se face pe elementele reale sau pe evidența oficială, nu dedusă.
- **De ce:** două cifre diferite pot fi corecte pe mulțimi diferite, iar un identificator maxim, un contor de ecran sau o numărare după text dau cifre false.
- **Cum se verifică:** cifra însoțită de „numărat peste …”, reprodusă cu aceleași condiții, de preferat prin două moduri de numărare.
- **Cum corectează D:** cere să se spună peste ce mulțime s-a numărat și corectarea raportului.

### R-94 — Testezi instrumentul de verificare pe un caz cunoscut bun și pe unul cunoscut rău înainte să crezi verdictul lui.
- **De ce:** un tipar greșit, o intrare de formă greșită sau o sondă care răspunde uniform produc un eșec fals sau un „zero” fals, identice cu cele reale.
- **Cum se verifică:** instrumentul rulat pe ambele cazuri, cu rezultate diferite și previzibile, inclusiv pe fiecare formă cunoscută a defectului.
- **Cum corectează D:** arată cazul scăpat și cere corectarea instrumentului.

### R-95 — O potrivire automată nu e un verdict, deci citești contextul fiecărei potriviri înainte să o clasifici, să o raportezi sau să o înlocuiești.
- **De ce:** un termen general prinde subiecte fără legătură, un termen interzis poate apărea într-o frază care îl neagă, iar o înlocuire globală poate falsifica o înregistrare a trecutului.
- **Cum se verifică:** liniile citite una câte una, cu clasificarea notată (afirmație despre prezent, înregistrare a trecutului, instrucțiune activă), înainte de prezentarea listei sau de scriere.
- **Cum corectează D:** cere refacerea listei pe liniile citite.

### R-96 — Verifici o schimbare diferențial, față de o copie luată înainte, și dovedești separat funcția nouă și faptul că restul n-a fost atins.
- **De ce:** un control absolut produce alarme care ascund regresiile reale, o alarmă pe ceva deja existent nu e corupție nouă, iar o salvare poate rescrie tăcut alte părți.
- **Cum se verifică:** același control pe copia inițială, diferența limitată la ținta intenționată și reperele „înainte, după, după revenire”.
- **Cum corectează D:** retrage alarma falsă și cere comparația explicită, cu raportul diferențelor.

### R-97 — Un control trecut acoperă numai axa lui, deci livrabilul final se citește și se privește și pentru axele necontrolate.
- **De ce:** un control de ton nu spune nimic despre adevărul afirmațiilor, un text curat nu dovedește o imagine curată, iar un document se poate contrazice singur.
- **Cum se verifică:** fiecare modalitate a livrabilului (text, imagine, aspect) deschisă și citită integral, cu dovada primară alături.
- **Cum corectează D:** arată defectul scăpat și cere rescrierea secțiunii și extinderea controlului.

### R-98 — Descrii o comandă, un ecran sau un pas numai după ce l-ai văzut pe tipul exact de obiect, din contul rolului căruia îi e destinat materialul.
- **De ce:** interfața și comportamentul diferă după obiect și rol, cunoștințele generale și codul nu prezic instalarea concretă, iar un pas imposibil urmat literal îl face pe cititor să-și piardă munca.
- **Cum se verifică:** contul sesiunii confirmat, comanda văzută pe obiectul vizat și dovada propriei observații atașată fiecărui pas.
- **Cum corectează D:** cere scoaterea afirmației și refacerea ei cu dovada din mediul real.

### R-99 — După ce schimbi o valoare, o denumire sau un artefact partajat, cauți și verifici toate locurile care depind de el.
- **De ce:** rezumatele, valorile derivate, trimiterile și documentele care refolosesc artefactul se decorelează tăcut, iar o înlocuire poate transforma o variantă greșită în una corectă.
- **Cum se verifică:** lista dependențelor inverse, verificată loc cu loc, și numărarea formei vechi pe tot proiectul, cu rezultat zero.
- **Cum corectează D:** cere lista dependențelor și trecerea peste mulțimea completă.

### R-100 — Atribui o cauză numai după ce ai separat-o prin cazuri de control și ai confirmat-o printr-o intervenție observată, iar o discrepanță o explici, nu o ascunzi ajustând instrumentul.
- **De ce:** straturi suprapuse se confundă cu un singur defect, un eșec poate veni din propria cerere, iar un comportament intermitent poate avea un al doilea mecanism.
- **Cum se verifică:** cazuri de control cu rezultat opus, plus efectul observat după schimbarea cauzei presupuse.
- **Cum corectează D:** cere retragerea concluziei și refacerea diagnosticului.

### R-101 — Stabilești identitatea unui obiect din conținutul sau din identificatorul lui, nu din nume, poziție sau vecinătate.
- **De ce:** fiecare sursă are altă convenție de denumire, iar vecinătatea leagă obiectul de elementul alăturat, ceea ce produce afirmații false.
- **Cum se verifică:** identitatea citită din interiorul obiectului și confruntată cu lista de referință.
- **Cum corectează D:** cere refacerea potrivirii pe conținut.

### R-102 — Nu ghicești parametri, adrese, coduri sau valori și nu te bazezi pe o descriere, ci le citești din sursa autoritară și deschizi ținta înainte să o citezi.
- **De ce:** un parametru necunoscut poate fi ignorat în tăcere, un cod de formă validă trece prin generator, iar o adresă plauzibilă poate răspunde cu eroare.
- **Cum se verifică:** definiția citată din sistem și testarea fiecărei ținte citate, cu rezultatul notat.
- **Cum corectează D:** cere scoaterea sau corectarea citării.

### R-103 — Testezi prin execuție o instrucțiune sau o recomandare înainte să o aplici sau să o transmiți, iar un audit extern îl filtrezi față de deciziile lui D.
- **De ce:** un pas de corectare poate fi incomplet, o recomandare poate fi contrazisă de măsurătoare, iar un audit nu cunoaște deciziile luate în conversație.
- **Cum se verifică:** rezultatul rulării consemnat și fiecare corectură confruntată cu instrucțiunile explicite ale lui D.
- **Cum corectează D:** aprobă abaterea raportată și păstrează numai corecturile care nu contrazic decizia.

### R-104 — Citești starea reală dintr-o sursă de stare, nu din etichetă, din aspect sau dintr-un indicator istoric.
- **De ce:** eticheta unui control poate descrie acțiunea, reprezentarea vizuală poate rămâne în urmă, iar un contor vechi nu arată ce e viu acum.
- **Cum se verifică:** starea citită din modelul sau din datele sistemului și comparată cu ce se afișează.
- **Cum corectează D:** cere refacerea inventarului din starea reală.

### R-105 — Compari numai valori citite cu aceeași metodă, în aceleași condiții, iar criteriul de egalitate îl alegi după cum tratează sistemul datele.
- **De ce:** două metode de citire pot diferi fără ca datele să se fi schimbat, iar un sistem care normalizează face ca egalitatea strictă să dea fals.
- **Cum se verifică:** aceeași metodă pe ambele părți și criteriul de egalitate scris lângă rezultat.
- **Cum corectează D:** cere refacerea comparației cu o singură metodă.

### R-106 — O verificare contează numai dacă a rulat integral și îi citești codul și erorile, nu ultima linie de ieșire.
- **De ce:** erorile ascunse lasă un rezultat gol, o intrare sărită nu se vede, iar un lanț oprit sau un cod citit de la altă comandă raportează altceva decât crezi.
- **Cum se verifică:** iterații egale cu intrările, canalul de erori vizibil și codul de ieșire al comenzii verificate.
- **Cum corectează D:** cere reluarea verificării cu tot rezultatul vizibil.

### R-107 — Înainte să tragi o concluzie dintr-o listă sau să afirmi câte cazuri sunt afectate, parcurgi mulțimea întreagă și numeri separat rândurile cu valori lipsă sau ambigue.
- **De ce:** o listă citită parțial duce la concluzia falsă „lipsește”, un eșantion ales ascunde un defect sistematic, iar un filtru pe un singur câmp scapă cazurile fără valoare.
- **Cum se verifică:** toate paginile numărate, structura citită înainte de filtru și rândurile fără valoare raportate separat.
- **Cum corectează D:** cere extinderea filtrului și aprobă curățarea dublurilor create.

### R-108 — Verifici o corespondență în ambele sensuri și o afirmație în ambele direcții.
- **De ce:** un control într-un singur sens lasă defecte, iar o afirmație despre prezență poate fi opusul realității.
- **Cum se verifică:** a doua trecere în sens invers, cu rezultat zero, și ambele locuri citite în sistem.
- **Cum corectează D:** cere extinderea verificării și corectarea documentului.

### R-109 — Validezi un artefact înainte de publicare, rulând efectiv comanda sau parserul lui și deschizând ce a produs, inclusiv după o copiere sau o regenerare.
- **De ce:** un defect de sintaxă îl poate împiedica să se încarce fără nicio eroare, o configurație care se citește bine poate cădea la pornire, datele din intrarea unui generator nu ajung sigur în ieșire, iar o corecție făcută în copia generată dispare la regenerare.
- **Cum se verifică:** comanda exactă rulată, cu ieșirea citită, documentul produs deschis, iar corecția prezentă în sursă și după regenerare.
- **Cum corectează D:** cere dovada rulării și repararea înainte de publicare.

### R-110 — O înlocuire în lot are o poartă care refuză scrierea când numărul de potriviri diferă de cel așteptat, iar fiecare loc modificat se recitește.
- **De ce:** o potrivire exactă poate cădea tăcut pe un caracter diferit sau poate atinge locul greșit, iar o potrivire unică poate rupe fraza.
- **Cum se verifică:** numărul de potriviri pe fiecare pereche, citit înainte de scriere, și diferența față de original conținând numai modificarea dorită.
- **Cum corectează D:** cere reluarea cu textul exact citit din sursă și cu mai mult context.

### R-111 — Când două documente proprii se contrazic sau o procedură pare greșită, arbitrul e dovada primară, verificată cu data ei, iar contradicțiile le cauți pe subiect în toate livrabilele.
- **De ce:** alinierea la un glosar poate muta materialul pe varianta falsă, obiectul se poate să se fi schimbat după ce procedura era corectă, iar controalele de curățenie nu prind o contradicție între două livrabile.
- **Cum se verifică:** tabel termen, document, afirmație, dovada primară citată pentru fiecare termen contestat și data ultimei modificări a obiectului.
- **Cum corectează D:** cere corectarea documentului pe baza dovezii.

### R-112 — Verifici un comportament dinamic cu intrare reală și cu măsurători pe durata lui, nu din starea finală.
- **De ce:** un salt și o tranziție dau aceeași imagine finală, iar o intrare simulată ocolește comportamentul real.
- **Cum se verifică:** măsurători datate înainte, în timpul și după schimbare, obținute prin intrare reală.
- **Cum corectează D:** cere repetarea testului real.

### R-113 — Ce se poate măsura se măsoară pe obiectul real, de mai multe ori când rezultatul variază, în locul impresiei, al valorii declarate și al promisiunii.
- **De ce:** impresia nu detectează pierderi, depășiri mici sau trăsături pe care nu le poți comanda.
- **Cum se verifică:** cifra măsurată pe obiectul real, comparată cu limita sau cu originalul.
- **Cum corectează D:** cere măsurătoarea, nu o nouă captură.

### R-114 — Când mediul sau metoda prescrisă nu permit verificarea cerută, folosești cea mai bună verificare posibilă, numești metoda și limita și dai verdictul dintr-un set închis, inclusiv „neverificat”, numai pe starea finală.
- **De ce:** insistența pe o verificare imposibilă consumă timp, o stare intermediară produce un verdict parțial, iar omul care răspunde de livrabil trebuie să știe pe ce se bazează dovada.
- **Cum se verifică:** metoda și limita notate în raport, verdictul din setul „confirmat, infirmat, parțial, neverificat”, ce rămâne de confirmat de către om și starea finală citită.
- **Cum corectează D:** confirmă el acolo unde dovada nu ajunge și cere refacerea raportului în forma cerută.

### R-115 — Testezi în condițiile destinatarului real, până la capătul traseului, iar după o schimbare citești separat versiunea proaspătă și ce primește el.
- **De ce:** un rol superior, o sesiune autentificată sau o memorie intermediară arată altceva decât vede destinatarul, o salvare reușită poate părea eșuată sau invers, iar o setare corectă nu garantează execuția când traseul are mai multe verigi.
- **Cum se verifică:** contul sau rolul citit, o cerere care ocolește memoria intermediară și una ca vizitator, cu corpul răspunsului căutat după un marcaj al schimbării, plus rezultatul observat la capătul traseului.
- **Cum corectează D:** cere retestarea în condițiile reale și dovada din conținut.

### R-116 — O probă simulată trebuie să poată eșua și să includă limitele reale, iar verificarea finală se face pe sistemul real.
- **De ce:** o probă care nu poate eșua nu dovedește nimic, iar simularea poartă aceleași presupuneri ca implementarea.
- **Cum se verifică:** scenarii cu defecte injectate și depășiri respinse, reluarea probată în două trepte și un test pe sistemul real după scriere.
- **Cum corectează D:** cere reconstruirea probei și verificarea pe sistemul real.

### R-117 — După o sesiune sau o cerere care nu trebuia să scrie nimic, dovedești că nu s-a scris nimic.
- **De ce:** o interacțiune aparent inofensivă poate înregistra modificări, iar o cerere respinsă trebuie confirmată ca fără efect.
- **Cum se verifică:** data modificării și starea obiectului, citite din sursă înainte și după sesiune.
- **Cum corectează D:** cere dovada nescrierii și refacerea sesiunii pe o cale de citire fără efecte.

### R-222 — După repararea unui defect găsești greșeala din fluxul care l-a produs și consemnezi o regulă de prevenire, nu numai corecția punctuală.
- **De ce:** o corecție a simptomului lasă neatinsă cauza, deci defectul reapare în alt loc.
- **Cum se verifică:** raportul numește pasul din flux care a produs defectul și regula consemnată.
- **Cum corectează D:** cere identificarea greșelii inițiale, salvarea regulii și abia apoi reparația.
