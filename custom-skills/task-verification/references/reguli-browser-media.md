# Reguli — browser și media

### R-206 — Înainte de prima acțiune într-un browser comandat stabilești la ce mașină, browser și cont ajunge unealta și lucrezi numai în mediul pe care omul îl vede și în care e autentificat, chiar dacă un prompt mai vechi numește alt mediu.
- **De ce:** unealta poate duce la alt calculator sau la o sesiune separată, unde acțiunile sunt invizibile pentru om și pot atinge un sistem pe care nu îl controlează, iar instrucțiunea dată în conversație bate textul unui prompt scris anterior.
- **Cum se verifică:** lista browserelor conectate, cu platforma și sesiunea citite înainte de prima acțiune, plus utilizatorul logat raportat la început; o pagină de administrare care duce la autentificare dovedește sesiunea greșită.
- **Cum corectează D:** oprește calea, interzice acel mediu și cere mutarea lucrului în cel vizibil lui.

### R-207 — Fiecare comandă în browser își numește explicit fila-țintă, iar înainte să raportezi că un element lipsește notezi adresa filei pe care ai citit.
- **De ce:** fila activă se poate schimba oricând, iar o comandă fără țintă sau o citire legată de altă filă lucrează pe o pagină nerelevantă și produce o concluzie falsă.
- **Cum se verifică:** orice apel poartă identificatorul filei proprii, iar adresa filei curente e afișată înainte de acțiune și notată lângă constatare.
- **Cum corectează D:** cere reluarea pe fila corectă și verificarea că nu s-a scris nimic în cealaltă.

### R-208 — Lucrezi numai în fila și în procesele pornite de sesiunea ta: filele personale ale omului nu le atingi, iar un proces sau o fereastră pe care nu le-ai pornit nu le folosești și nu le oprești fără aprobare.
- **De ce:** conexiunea se poate atașa implicit la fila omului, iar un proces găsit poate aparține unei sesiuni paralele sau altei activități, deci proprietarul lui rămâne neverificat.
- **Cum se verifică:** procesele și părinții lor sunt listați înainte de pornire, iar identificatorul filei de lucru e citit din starea curentă, înainte de prima comandă.
- **Cum corectează D:** cere oprirea imediată, mutarea lucrului în fila proprie și restaurarea a ce s-a oprit.

### R-209 — Resursele create pentru un test le închizi la final, iar mediul omului nu îl modifici pentru comoditate și, dacă a rămas schimbat, îl readuci la normal înainte de predare.
- **De ce:** o resursă lăsată deschisă sau o setare rămasă agățată stau în fața omului, iar modificarea poate fi legată de sesiunea care a făcut-o, deci o rulare nouă nu o curăță.
- **Cum se verifică:** lista resurselor de la final nu mai conține ce ai creat, iar valorile mediului citite la predare coincid cu cele normale ale omului.
- **Cum corectează D:** cere închiderea resurselor, restaurarea mediului și renunțarea la modificare.

### R-210 — O conexiune care cere aprobarea omului o lași pornită între pași consecutivi și o oprești la final, iar dacă expiră îl anunți pe om înainte de repornire, fără reîncercări nesupravegheate.
- **De ce:** fiecare repornire cere din nou aprobarea și poate bloca lucrul, iar tentativele repetate lasă ferestre sau cereri orfane și nu rezolvă cauza.
- **Cum se verifică:** o interogare simplă răspunde înainte de fiecare pas, mesajul către om precede repornirea, iar numărul de ferestre de confirmare rămâne cel anunțat.
- **Cum corectează D:** cere să nu se mai repornească între pași, oprirea tentativelor și curățarea ferestrelor.

### R-211 — Când o cale eșuează, citești semnalul exact și interfața reală înainte să reîncerci sau să ceri ceva, iar după cel mult trei eșecuri o tratezi ca indisponibilă, raportezi și folosești sau ceri altă cale.
- **De ce:** reîncercările nu schimbă un eșec determinist, parametrii ghiciți costă câte un apel fiecare, un semnal citit greșit duce la așteptări inutile, iar o buclă de diagnostic poate avea efecte secundare vizibile.
- **Cum se verifică:** eroarea și semnătura sau starea reală sunt afișate înainte de apelul corectat, iar jurnalul nu are o a patra încercare pe aceeași cale.
- **Cum corectează D:** cere oprirea ghicitului, diagnosticul și o cale nouă.

### R-212 — Un timeout nu dovedește eșecul: munca lungă o pornești asincron și îi citești rezultatul prin interogări scurte, iar după o expirare verifici destinația înainte de reluare.
- **De ce:** canalul de control are limită de timp pe apel, deci un apel poate expira chiar dacă lucrul a reușit, iar rezultatul poate exista deja.
- **Cum se verifică:** apelul de pornire revine imediat, o interogare ulterioară întoarce rezultatul complet, iar destinația e listată cu mărimea și ora fișierului înainte de reluare.
- **Cum corectează D:** cere reluarea cu pași mai mici, cu starea citită separat și fără repetarea pasului înainte de verificare.

### R-213 — Ce vede un vizitator anonim sau un alt cont verifici dintr-un context de navigare izolat, creat pe loc, iar conturile diferite nu le amesteci în același context.
- **De ce:** sesiunea logată schimbă ce se vede și poate declanșa efecte laterale, iar conturile care împart aceleași cookie-uri se înlocuiesc unul pe altul în toate filele.
- **Cum se verifică:** contextul nou are cookie-uri proprii, o interogare în pagină confirmă lipsa semnelor sesiunii autentificate, iar la final contextul se închide.
- **Cum corectează D:** cere repetarea verificării fără cont sau reautentificarea contului de test într-un context separat.

### R-214 — Înainte de un clic pe coordonate sau de o ieșire dintr-un editor deschis verifici ce se află acolo și ce stare are fila, iar pasul îl consideri făcut numai după ce ai citit răspunsul lui.
- **De ce:** un clic pe coordonate e o acțiune oarbă, care poate nimeri un element care acoperă ținta sau o altă pagină, o salvare poate eșua tăcut, iar o ieșire cu modificări nesalvate blochează fila și cere intervenția omului.
- **Cum se verifică:** elementul de sub coordonate e citit din pagină și confirmă ținta, starea filei e citită înainte de navigare, iar răspunsul cererii de salvare e citit după acțiune.
- **Cum corectează D:** cere oprirea și revenirea la un punct curat.

### R-215 — O captură o verifici pe imaginea însăși, nu pe valorile raportate de script, iar una destinată unui livrabil nu poartă urme de unealtă sau de sesiune.
- **De ce:** un script poate raporta un element ca vizibil fără ca el să apară în imagine, o captură din altă filă sau la altă scară arată plauzibil și trece de o privire rapidă, iar urmele uneltei sau elementele de administrare sugerează o interfață pe care publicul nu o are.
- **Cum se verifică:** dimensiunea și conținutul imaginii sunt inspectate și comparate cu pagina așteptată, iar titlul și semnele sesiunii sunt citite chiar înainte de captură.
- **Cum corectează D:** respinge captura și cere refacerea cu elementul vizibil în imagine.

### R-216 — Conținutul mare și capturile de ecran le scrii direct pe disc, nu le aduci în conversație decât ca excepție anunțată, cu motiv, și nu ascunzi niciodată canalul de erori.
- **De ce:** tot ce intră în conversație e recitit la fiecare tur, deci costul crește cu lungimea ei, iar cu erorile ascunse un blocaj trece neobservat și lasă un fișier gol.
- **Cum se verifică:** fișierul apare pe disc sub numele convenit, nu e gol și are suma de control egală cu sursa, iar în conversație nu intră conținutul lui.
- **Cum corectează D:** oprește sesiunea scumpă și cere refacerea transferului, cu erorile vizibile și cu dovada sumei de control.

### R-217 — Ce unealta nu poate obține singură îi ceri omului, spunându-i exact unde și ce are de făcut, în loc să forțezi sau să repeți verificarea.
- **De ce:** anumite stări și permisiuni rămân în afara uneltei, o sesiune validă a omului poate fi invizibilă pentru unealtă și duce la concluzia greșită că nu e logat, iar un gest al omului costă mai puțin decât un ocol.
- **Cum se verifică:** cererea numește fereastra și gestul, iar după gestul omului rezultatul e confirmat: fila apare în listă sau fișierul există pe disc, cu mărimea așteptată.
- **Cum corectează D:** indică fereastra și cere oprirea reverificărilor, sau face gestul și arată că era calea mai ieftină.

### R-218 — Orice conținut audio sau video deschis într-un browser comandat stă pe mut de la încărcare și tot timpul, iar dacă trebuie să ruleze, starea lui se vede pe pagină și redarea se oprește la final.
- **De ce:** redarea poate porni singură la încărcare, înainte de orice mutare, iar omul e surprins de un sunet fără să știe de unde vine și trebuie să poată vedea oricând ce rulează.
- **Cum se verifică:** starea de mut și volumul sunt citite din pagină după fiecare încărcare, indicatorul de stare apare într-o captură, iar redarea e oprită la sfârșit.
- **Cum corectează D:** cere oprirea imediată, mutul permanent și indicatorul de stare.
