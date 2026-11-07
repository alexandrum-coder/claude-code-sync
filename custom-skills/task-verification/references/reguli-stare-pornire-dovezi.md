# Reguli — stare de pornire și dovezi

### R-15 — Pornești o lucrare numai după ce sursa și dependențele ei există efectiv și sunt verificate, cu textul primit păstrat într-un dosar propriu al cererii, iar ce nu poți verifica raportezi ca gol și aștepți.
- **De ce:** o dependență presupusă produce o execuție care pare corectă, dar stă pe o premisă falsă; o sursă doar anunțată, un document despre care se crede că a plecat sau un fișier care lipsește de pe disc nu sunt încă surse, iar cererile amestecate într-un dosar comun se confundă.
- **Cum se verifică:** înainte de primul pas, raportul enumeră dependențele și dovada fiecăreia: textul prezent în conversație, calea fișierului citită de pe disc, dovada trimiterii, dosarul datat al cererii cu textul primit în el.
- **Cum corectează D:** oprește execuția, cere raportarea golului și pune la dispoziție sursa lipsă.

### R-16 — Citești starea reală a sistemului înainte să scrii planul și din nou înainte să aplici orice pas dintr-un plan sau document mai vechi, fiindcă descrierea primită e o ipoteză, iar un plan aprobat ieri nu e o metodă validată azi.
- **De ce:** o presupunere neverificată poate invalida tot planul, iar fișierele și destinațiile se schimbă după ce planul a fost scris, așa că un pas poate porni de la un motiv deja dispărut.
- **Cum se verifică:** starea citită direct din sistem e consemnată în plan, iar fișierul sau destinația e citită și comparată cu planul înaintea fiecărui pas.
- **Cum corectează D:** cere verificarea stării înainte de plan sau de pas, apoi reformularea pasului pe starea reală.

### R-17 — Înainte să prelucrezi, adaugi sau refaci ceva, verifici dacă lucrul nu e deja făcut sau scos, inclusiv în notele de sub tabelul de inventar.
- **De ce:** o cerere poate descrie o lucrare deja executată, o sursă deja prelucrată iese dublată la a doua trecere, iar notele schimbă statutul rândurilor (eliminat, anulat, blocat), deci se planifică altfel muncă fără obiect.
- **Cum se verifică:** conținutul cerut comparat cu cel existent, cu listarea a ce lipsește, un test numeric rulat pe surse înainte de prelucrare, intrarea din inventar citită, iar lista planificată nu conține nimic marcat eliminat sau anulat în note.
- **Cum corectează D:** oprește refacerea, cere reluarea planului după citirea notelor și îl mută pe defectele reale.

### R-18 — Înainte de a executa o sarcină sau de a produce o dovadă, verifici dacă starea cerută poate exista.
- **De ce:** două stări separate de o acțiune nu coexistă, iar un element care nu ajunge în pagină nu poate fi captat, deci încercările repetate consumă timp fără rezultat.
- **Cum se verifică:** cerința citită, cu răspunsul notat la întrebarea „poate exista această stare și o poate capta unealta?”.
- **Cum corectează D:** cere rescrierea cerinței în locul încercărilor repetate.

### R-19 — Iei afirmațiile din sursa primară, nu din raportul, handoff-ul sau rezumatul care o descrie, iar când cele două nu se potrivesc, sursa primară câștigă.
- **De ce:** o repovestire poate clasifica greșit sarcini, poate descrie lucruri inexistente, poate contrazice codul care rulează și poate omite detaliul care contează.
- **Cum se verifică:** citatul sau numărul de rând din sursa primară (documentul, cererea inițială, codul existent, textul brut al documentației), comparat cu repovestirea înainte de orice execuție.
- **Cum corectează D:** cere retragerea afirmației, oprirea execuției și rescrierea după sursa primară.

### R-20 — O afirmație despre un sistem stă pe două dovezi independente care concordă, materialul scris și observația directă, niciodată pe una singură.
- **De ce:** un material scris poate fi vechi sau poate descrie un element inexistent, iar o observație poate veni din alt context, deci abia concordanța lor arată că afirmația e curentă.
- **Cum se verifică:** pentru fiecare afirmație sunt indicate ambele dovezi și concordanța lor, după căutarea materialului corespondent.
- **Cum corectează D:** cere a doua dovadă înainte de a accepta afirmația.

### R-21 — Înainte să corectezi sau să reproduci ceva, identifici pe efectul real exact elementul care îl produce, în loc să preiei cauza declarată sau să te iei după codul sursă.
- **De ce:** un diagnostic moștenit poate fi fals, cererea poate numi greșit elementul, iar aspectul real poate diferi de ce arată codul.
- **Cum se verifică:** valoarea afișată urmărită până la elementul care o produce, iar ținta unei reproduceri e măsurată pe rezultatul real.
- **Cum corectează D:** cere refacerea diagnosticului, precizarea elementului și măsurarea.

### R-22 — O notă sau o constatare consemnată descrie trecutul, deci o reverifici pe starea curentă, cu o interogare fără efect, înainte să te bazezi pe ea și raportezi deschis orice diferență, fără să rescrii nota pe ascuns.
- **De ce:** sistemul se poate schimba fără anunț, o componentă poate fi înlocuită, iar un plan scris poate fi deja executat de altcineva, așa că nota ar duce la lucru pe ceva inexistent.
- **Cum se verifică:** măsurătoarea sau interogarea repetată în sesiune, comparată cu nota, cu diferența și data scrise explicit.
- **Cum corectează D:** cere să se spună ce s-a schimbat, refacerea constatării pe starea curentă și așteaptă să decidă asupra notei.

### R-23 — Datele verificate anterior și stările rezolvate o dată nu rămân valabile, deci le reverifici la fiecare operație care depinde de ele, iar datele vechi le compari element cu element, cu oprire la prima diferență.
- **De ce:** ce era sigur poate să nu mai fie, o copie veche poartă valori depășite, iar un lucru șters sau reparat poate reapărea tăcut.
- **Cum se verifică:** reverificarea la începutul operației, comparația cu sursa curentă și versiunea sau starea citită efectiv, nu din manifestul local.
- **Cum corectează D:** cere reverificarea stării reale înainte de orice scriere sau promisiune.

### R-24 — Înainte să declari un lucru blocat, recitești cerințele reale, compari nota de blocare cu metodele de azi, reproduci blocajul printr-o probă directă și parcurgi straturile de permisiuni de la cel mai apropiat.
- **De ce:** o notă corectă la data scrierii poate fi infirmată de o metodă nouă, o afirmație moștenită poate fi greșită, iar cauza poate fi o permisiune lipsă, reparabilă în secunde, așa că sarcini rezolvabile stau blocate zile întregi.
- **Cum se verifică:** data notei comparată cu ultima metodă sau încercare reușită, proba directă cu rezultatul și data, starea permisiunilor citită după reîncărcare.
- **Cum corectează D:** semnalează blocajul perimat și cere refacerea probei, nu citarea notei, apoi deblocarea sarcinilor.

### R-25 — Orice cifră sau valoare volatilă pe care o raportezi o citești din sursă chiar atunci, nu din plan, handoff sau memorie.
- **De ce:** planurile propagă cifre copiate, o regenerare depășește tăcut un număr, iar o valoare se poate schimba în aceeași zi.
- **Cum se verifică:** numărătoarea pe sursă sau listarea cu mărime și dată, scrisă lângă cifra preluată, cu ora citirii și diferența explicată.
- **Cum corectează D:** cere retragerea cifrei, recitirea ei și corectarea tuturor locurilor în care apare.

### R-26 — Data și ora le citești cu comanda de sistem la fiecare punct de control și înaintea oricărei afirmații despre termene, fără să le estimezi sau să le deduci din numele planului.
- **De ce:** o sesiune lungă poate trece în altă zi, o estimare poate greși cu ore întregi, iar un document datat greșit pare dovadă și ajunge citat.
- **Cum se verifică:** ieșirea comenzii de dată, din același moment cu afirmația sau cu rândul din jurnal.
- **Cum corectează D:** cere ora reală și refacerea jurnalului sau a calendarului.

### R-27 — Înainte de orice scriere, lot sau captură verifici și raportezi contul și rolul activ, dovedite dintr-o sursă proaspătă, nu presupuse și nu citite de pe un ecran rămas deschis.
- **De ce:** drepturile și efectele diferă după cont, sesiunea poate expira tăcut, iar un ecran vechi arată starea de la încărcare, nu sesiunea curentă.
- **Cum se verifică:** pagina reîncărcată, un apel care întoarce utilizatorul curent și rolul real sau un ecran refuzat celuilalt rol; dacă nu ești în contul așteptat, cauți întâi sesiunile deschise.
- **Cum corectează D:** oprește acțiunea, cere raportarea contului din sursa proaspătă și refacerea a ce s-a făcut din contul greșit.

### R-28 — Stabilești pe ce lucrezi după un identificator stabil sau după conținut, nu după nume, titlu, descriere ori adresă dintr-un inventar vechi.
- **De ce:** fișierele cu nume asemănătoare pot avea conținut diferit, titlurile se trunchiază, adresele se schimbă, iar un obiect încă nesalvat poate fi înlocuit tăcut cu altul, deci o salvare ajunge peste original.
- **Cum se verifică:** identificatorul citit din sistem înainte de orice scriere, egal cu cel țintit, respectiv antetul și primele rânduri deschise sau suma de control a fișierului.
- **Cum corectează D:** oprește lucrul, cere identificarea explicită a obiectului și refacerea pe cel corect.

### R-29 — Înainte să construiești pe un document verifici că e ultima versiune și suficient de proaspăt, iar un derivat îl socotești bun numai după ce îi verifici generatorul, data și echivalența cu sursa.
- **De ce:** o versiune depășită sau un jurnal vechi duc la concluzii false, un livrabil generat înaintea ultimei modificări a sursei pare închis fără să fie, iar un derivat fără generator nu se poate regenera.
- **Cum se verifică:** data și versiunea comparate cu cea predată, data derivatului comparată cu a sursei, căutarea scriptului generator și comparația text cu text, cu marcajul UNVERIFIED până atunci.
- **Cum corectează D:** cere refacerea pe versiunea corectă sau replanificarea regenerării.

### R-30 — Înainte să marchezi ceva ca necunoscut, să ceri, să măsori din nou sau să repeți o acțiune cu istoric de eșec, cauți răspunsul și capcanele în documentele și memoriile existente.
- **De ce:** faptul poate fi deja măsurat și scris, iar o notă ignorată repetă aceeași eroare și consumă zeci de minute.
- **Cum se verifică:** căutarea pe termenul din cerință, în tot proiectul, consemnată, cu nota consultată citată în raport.
- **Cum corectează D:** oprește lucrul, cere citirea surselor existente și închiderea marcajului cu trimiterea găsită.

### R-31 — Nu presupui unelte, interfețe sau parametri din memorie ori din documentație, ci le citești din ce e disponibil acum și din registrul propriu al sistemului.
- **De ce:** listele scrise îmbătrânesc, un flux presupus (de pildă cine execută un instrument extern) duce la muncă pe o premisă falsă, iar parametrii inventați nu dau eroare, ci sunt ignorați tăcut.
- **Cum se verifică:** listarea uneltelor din sesiune înainte de a descrie un flux sau de a le folosi, lista de parametri citită din sursa de adevăr, iar efectul confirmat pe rezultat; dacă unealta nu apare, întrebi.
- **Cum corectează D:** oprește lucrul și cere reverificarea uneltelor sau citirea parametrilor, apoi refacerea pentru cine execută de fapt.

### R-32 — Înainte de un lot verifici mediul efectiv de lucru, adică pe ce cale controlezi sistemul, de unde citește el fișierele, ce setări influențează livrabilul și ce versiune rulează, fixată explicit.
- **De ce:** căile de control nu împart starea, o copie pusă în locul presupus nu e citită, o setare greșită obligă la refacerea rezultatelor, iar comportamentul se schimbă între versiuni.
- **Cum se verifică:** indicatorul de local sau la distanță și o probă salvată pe disc, comanda care dă rădăcina reală, setarea măsurată, nu apreciată din ochi, și versiunea explicită în comanda de instalare.
- **Cum corectează D:** cere oprirea lotului și reluarea pe calea sau setarea corectă, cu aprobarea omului cerută din prima.

### R-33 — Faci o copie de siguranță verificată cu sumă de control, cu structura de dosare păstrată, chiar înainte de prima scriere.
- **De ce:** fără ea nu există cale de revenire, un hash dovedește numai că ceva s-a schimbat, nu permite restaurarea, o copie plată suprascrie fișiere cu același nume, un canal poate trunchia valorile, iar o copie veche de ore arată drept schimbări modificările altor procese.
- **Cum se verifică:** suma de control comparată între original și copie, ora copiei imediat dinaintea scrierii, iar diferența de după arată numai schimbarea intenționată.
- **Cum corectează D:** cere copia verificată înainte de scriere sau refacerea ei și a comparației.

### R-34 — Dovezile rămân neatinse și complete, adică ce e înghețat cu sumă de control nu se modifică, jurnalul acoperă toate cererile, iar fișierele atinse se consemnează într-o listă, nu se deduc dintr-un filtru pe timp.
- **De ce:** o adăugare strică suma de control, un jurnal parțial nu poate fi sursă de adevăr, iar o copie cu metadate păstrate iese din orice interogare pe data curentă.
- **Cum se verifică:** suma de control recalculată, numărătoarea din jurnal comparată cu cererile făcute, lista consemnată comparată cu discul.
- **Cum corectează D:** cere mutarea adaosurilor în dosar propriu, reconstituirea jurnalului și lista explicită a fișierelor modificate.

### R-35 — Înainte de un test pe o copie verifici de ce date comune depinde ea, fiindcă o copie care citește aceeași sursă ca originalul nu izolează nimic, deci izolarea se construiește explicit și se dovedește.
- **De ce:** obiectele de test dintr-o sursă comună apar imediat în producție.
- **Cum se verifică:** referințele copiei se citesc și diferă de ale originalului, înaintea oricărei încărcări, iar obiectul de test nu apare public.
- **Cum corectează D:** cere restricționarea testului la copie și dovada izolării înainte de orice încărcare.
