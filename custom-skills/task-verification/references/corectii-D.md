# Corecțiile lui D

### K-001
- **Situația:** o unealtă reutilizabilă nou creată a fost publicată, instalată și raportată ca terminată.
- **Ce a greșit Claude:** a declarat-o livrată pe baza pașilor de creare și instalare, fără să vadă dacă produce comportamentul observabil așteptat.
- **Corecția lui D:** compară rezultatul cu ce face echivalentul nativ, arată că lipsește partea vizibilă și cere exact acel comportament.
- **Regula:** R-89

### K-005
- **Situația:** D a impus un termen mult mai scurt, iar planul a fost refăcut cu scurtări succesive și argumente despre capacitate.
- **Ce a greșit Claude:** a tăiat din termen pe bucăți, fără să spună direct care e cel mai devreme termen realizabil și ce îl blochează cu adevărat.
- **Corecția lui D:** pune întrebarea directă dacă se poate și mai repede, arată că există soluții și oprește detaliile care nu schimbă termenul.
- **Regula:** R-153

### K-006
- **Situația:** materialele unui flux de lucru erau pregătite pentru un loc public.
- **Ce a greșit Claude:** a lăsat în pachet elemente specifice proiectului și beneficiarului.
- **Corecția lui D:** cere scoaterea oricărei urme de proiect; în locul public rămân numai regulile generale de lucru.
- **Regula:** R-68

### K-008
- **Situația:** într-o fază numai de citire pe un sistem live s-au raportat constatări despre un obiect.
- **Ce a greșit Claude:** a lucrat cu alt obiect decât cel numit în plan, fără să explice motivul.
- **Corecția lui D:** se oprește la nepotrivire și întreabă de ce apare acel obiect, când ținta era alta.
- **Regula:** R-147, R-92

### K-013
- **Situația:** O problemă a fost rezolvată abia după mai multe încercări succesive.
- **Ce a greșit Claude:** A mers iterativ, fără să fixeze devreme cauza și remediul și fără să le consemneze durabil.
- **Corecția lui D:** Cere salvarea în memorie a cauzei și a soluției, ca data viitoare să meargă din prima.
- **Regula:** R-219

### K-015
- **Situația:** o modificare pe un sistem public a fost raportată ca verificată pe baza atributelor din cod.
- **Ce a greșit Claude:** a controlat structura randată, nu aspectul vizibil, iar unele elemente afișau un semn greșit.
- **Corecția lui D:** întreabă de ce o parte din elemente nu arată cum trebuie, adică trimite verificarea înapoi la ce vede vizitatorul.
- **Regula:** R-89, R-97

### K-016
- **Situația:** un plan și un prompt au fost construite pe un document extern citat ca sursă.
- **Ce a greșit Claude:** nu citise documentul, îl știa numai din a doua mână, dar l-a tratat ca existent și i l-a cerut lui D.
- **Corecția lui D:** spune că nu găsește documentul, ceea ce scoate la iveală că planul stătea pe o sursă nevăzută.
- **Regula:** R-15

### K-017
- **Situația:** același document extern era descris în plan și în prompt.
- **Ce a greșit Claude:** i-a dat un caracter oficial fără dovadă, deși era un mesaj obișnuit cu observații.
- **Corecția lui D:** precizează natura reală a sursei și cere descrierea ei ca atare.
- **Regula:** R-125

### K-018
- **Situația:** se încheia o fază de corelare a unor cerințe externe cu documentele livrate.
- **Ce a greșit Claude:** a propus transformarea unei anexe într-o procedură nouă, adică un document și o obligație necerute de nimeni.
- **Corecția lui D:** întreabă de ce ar fi nevoie de așa ceva, când documentul existent pare suficient.
- **Regula:** R-150

### K-019
- **Situația:** un livrabil a fost anunțat ca gata în același mesaj cu defecte reparate și puncte nefinalizate.
- **Ce a greșit Claude:** a amestecat starea cu detalii și propuneri, iar starea reală a rămas neclară.
- **Corecția lui D:** spune că nu înțelege dacă lucrul e terminat, deci cere întâi starea, limpede.
- **Regula:** R-118

### K-021
- **Situația:** s-a redactat o ciornă de mesaj extern care însoțea niște documente finale.
- **Ce a greșit Claude:** a pus mult context și angajamente neasumate de autori, fără să compare textul cu documentele finale.
- **Corecția lui D:** cere refacerea față de documentele finale actualizate, ton calm și nicio sarcină nou asumată.
- **Regula:** R-157

### K-026
- **Situația:** lucrul aștepta de la D fișiere convertite în alt format.
- **Ce a greșit Claude:** i-a cerut un pas pe care îl putea face singur cu uneltele disponibile.
- **Corecția lui D:** întreabă dacă nu poate face Claude conversia și dacă e cu adevărat nevoie de el.
- **Regula:** R-154

### K-027
- **Situația:** o serie de modificări pregătite mai demult a fost prezentată ca lot de scriere pe un sistem public.
- **Ce a greșit Claude:** nu citise starea curentă, iar între timp lotul putea fi depășit.
- **Corecția lui D:** oprește lotul și cere întâi verificarea live, un raport, apoi decide el dacă se continuă.
- **Regula:** R-16

### K-031
- **Situația:** pentru o probă cu captură s-a propus o valoare de test.
- **Ce a greșit Claude:** valoarea purta numele asistentului și ar fi ajuns în capturi și în materiale de instruire.
- **Corecția lui D:** nu acceptă numele asistentului în nicio captură sau material și cere refacerea cu o valoare neutră.
- **Regula:** R-161

### K-033
- **Situația:** s-au cerut decizii despre tratarea unei observații externe asupra procedurilor.
- **Ce a greșit Claude:** a propus soluții și întrebări noi fără să verifice ce pregătise deja D.
- **Corecția lui D:** explică ce există și ce cale a rămas; acceptă un adaos numai dacă Claude știe sigur că ajută.
- **Regula:** R-17

### K-034
- **Situația:** s-a produs un set de documente numerotate pentru două categorii de cititori.
- **Ce a greșit Claude:** numerotarea avea lipsuri și dubluri, nefiind controlată înainte de predare.
- **Corecția lui D:** semnalează numerele ieșite din ordine și pe cele duplicate, ceea ce cere refacerea și verificarea setului.
- **Regula:** R-97

### K-038
- **Situația:** s-au redactat procese-verbale pentru sesiuni de instruire.
- **Ce a greșit Claude:** a inclus date de evidență pe care destinatarul nu le cerea.
- **Corecția lui D:** cere scoaterea adaosului; rămâne numai informația care interesează destinatarul.
- **Regula:** R-150

### K-043
- **Situația:** câteva pagini de test apăreau într-o listă publică a unui site, iar D a cerut scoaterea lor.
- **Ce a greșit Claude:** a propus o ascundere cosmetică din listă, cu paginile rămase publice, deși scopul era ca ele să nu mai fie publice.
- **Corecția lui D:** reafirmă scopul: paginile nu au ce căuta ca pagini publice și trebuie scoase.
- **Regula:** R-03

### K-044
- **Situația:** la o corecție punctuală au apărut completări proprii, în afara celor două cerințe primite.
- **Ce a greșit Claude:** a livrat adaosuri implicite în loc să rămână la ce s-a cerut.
- **Corecția lui D:** scoate adaosul și stabilește regula: completările se propun ca sugestii și se aplică numai dacă sunt acceptate.
- **Regula:** R-150

### K-045
- **Situația:** s-a redactat o notă pentru o parte externă despre o cerință.
- **Ce a greșit Claude:** a scris lung, repetând ce oferise firma, ceea ce ridica nivelul față de cerință și sugera un angajament mai mare.
- **Corecția lui D:** cere refacerea ca notă scurtă, o simplă mențiune că s-a făcut ce s-a cerut.
- **Regula:** R-157

### K-047
- **Situația:** cerința era una singură: de ce nu pleacă mesajele de pe un sistem și care e cea mai bună soluție.
- **Ce a greșit Claude:** a propus o încercare suplimentară pe alt mecanism, care nu schimba răspunsul, și a amestecat subiecte.
- **Corecția lui D:** oprește abaterea, cere strict cerința inițială și cere ca regula să rămână în memorie.
- **Regula:** R-03

### K-048
- **Situația:** s-a găsit o cale de a ocoli o politică ce bloca trimiterea de mesaje, iar Claude a propus direct o modificare pe sistemul live.
- **Ce a greșit Claude:** a trecut la o scriere nesolicitată înainte să explice cauza.
- **Corecția lui D:** oprește: nu se modifică nimic, întâi i se explică.
- **Regula:** R-03, R-151

### K-049
- **Situația:** s-a redactat un paragraf explicativ pentru utilizatorul unui sistem.
- **Ce a greșit Claude:** textul era lung, suna a lecție și putea face utilizatorul să se simtă vinovat.
- **Corecția lui D:** cere refacerea în puține cuvinte, cu ton colegial, care numește cauza reală fără să jignească.
- **Regula:** R-170

### K-050
- **Situația:** s-a întocmit o listă de puncte deschise dintr-un tabel de observații externe.
- **Ce a greșit Claude:** a trecut ca deschise puncte deja rezolvate și le-a tratat pe cele rezolvate ca scoase din listă.
- **Corecția lui D:** dă starea fiecărui punct, cere bifarea fără ștergere și întreabă ce se mai așteaptă la cele neclare.
- **Regula:** R-17

### K-051
- **Situația:** s-a livrat un tabel de urmărire a sarcinilor, cu termene și responsabili.
- **Ce a greșit Claude:** a pus termene în trecut, a completat un câmp care trebuia gol, a folosit alte denumiri de stare și a pretins că o funcție merge.
- **Corecția lui D:** cere refacerea: valori după regulile date, denumirile indicate și o funcție care chiar lucrează la folosire.
- **Regula:** R-168, R-89

### K-052
- **Situația:** un tabel a fost restructurat după o corecție.
- **Ce a greșit Claude:** a scos o categorie bine explicată și a amestecat sarcinile, deși se cerea numai păstrarea anumitor coloane.
- **Corecția lui D:** cere refacerea: numai coloanele din model, categoria și forma inițială păstrate, ordonare după tip.
- **Regula:** R-179

### K-053
- **Situația:** tabelul refăcut a fost prezentat ca verificat.
- **Ce a greșit Claude:** rândurile de categorie arătau strivite, fiindcă aspectul final nu fusese privit.
- **Corecția lui D:** reacționează la aspect și întreabă de ce nu s-a rezolvat așezarea, deci trimite verificarea pe rezultatul randat.
- **Regula:** R-174

### K-056
- **Situația:** s-a pregătit un mesaj extern despre lipsa unor documente de pe un site public.
- **Ce a greșit Claude:** a căutat incomplet și a considerat documentele absente, iar mesajul ar fi plecat cu o afirmație falsă.
- **Corecția lui D:** arată paginile unde documentele există și subliniază riscul de a se face de râs în fața destinatarului.
- **Regula:** R-129, R-157

### K-057
- **Situația:** într-un document de politică pentru o parte externă s-au repartizat verificările.
- **Ce a greșit Claude:** a pus în sarcina firmei o raportare săptămânală neasumată.
- **Corecția lui D:** întreabă ce înseamnă formularea și respinge orice raportare recurentă fără sursă.
- **Regula:** R-176

### K-058
- **Situația:** după scoaterea unei obligații inventate, lucrul a fost raportat ca terminat.
- **Ce a greșit Claude:** nu căutase în restul documentului alte adaosuri de același fel.
- **Corecția lui D:** cere verificarea explicită a întregului document, ca să nu rămână alte obligații inutile.
- **Regula:** R-165

### K-060
- **Situația:** un document extern revizuit a fost prezentat ca fiind corect față de cerințele sursă.
- **Ce a greșit Claude:** lăsase obligații fără sursă și formulări care puneau firma într-o poziție defensivă.
- **Corecția lui D:** cere scoaterea a tot ce nu are sursă, corectura după sursă și formulări care nu așază firma în inferioritate.
- **Regula:** R-176

### K-061
- **Situația:** riscurile unui document au fost listate, multe legate de lucruri neverificate în contul de administrare.
- **Ce a greșit Claude:** le-a lăsat presupuneri, deși verificarea numai prin citire era posibilă.
- **Corecția lui D:** spune că se poate uita în cont atât timp cât doar citește, deci cere dovada în locul presupunerii.
- **Regula:** R-113

### K-062
- **Situația:** s-au scris un plan și un prompt pentru remedierea unor probleme de securitate.
- **Ce a greșit Claude:** a inclus o unealtă de copii de siguranță care nu există în acel mediu.
- **Corecția lui D:** oprește execuția și cere să i se explice de unde vine ideea, fără nicio modificare.
- **Regula:** R-09, R-31

### K-063
- **Situația:** D era ghidat pas cu pas printr-un ecran, pentru o procedură destinată utilizatorilor.
- **Ce a greșit Claude:** pașii erau prea condensați, greu de urmat chiar și pentru D.
- **Corecția lui D:** cere refacerea cu pași explicați foarte clar, pentru un cititor netehnic.
- **Regula:** R-171

### K-064
- **Situația:** într-o sesiune de capturi, câțiva pași au fost lăsați lui D, deși restul era muncă de birou.
- **Ce a greșit Claude:** i-a pasat pași pe care îi putea face singur și nu a cerut permisiunea care lipsea.
- **Corecția lui D:** întreabă de ce nu îi face singur și ce permisiune i-ar trebui, ca lucrul să meargă mai repede.
- **Regula:** R-154

### K-065
- **Situația:** D ceruse închiderea sesiunii printr-o comandă; Claude a mai rulat ceva și abia apoi a spus că nu poate apela acea comandă.
- **Ce a greșit Claude:** a decis în locul lui D și a continuat după ce i se ceruse oprirea.
- **Corecția lui D:** interzice categoric deciziile peste ale lui: ce a cerut, se execută, iar ce nu se poate se spune imediat.
- **Regula:** R-03

### K-068
- **Situația:** o unealtă de captură nu salva fișierul pe disc, iar Claude a propus ca D să salveze manual imaginile.
- **Ce a greșit Claude:** a renunțat prea repede la o soluție automată și i-a transferat munca lui D.
- **Corecția lui D:** cere găsirea unei soluții de salvare și întreabă dacă nu există o unealtă dedicată.
- **Regula:** R-140, R-154

### K-072
- **Situația:** s-a prezentat o listă de lucruri pe care le-ar putea face numai D.
- **Ce a greșit Claude:** nimic din listă nu cerea cu adevărat intervenția lui.
- **Corecția lui D:** observă că lista e goală în fond și oprește lucrul până a doua zi.
- **Regula:** R-154

### K-075
- **Situația:** s-a verificat dacă o unealtă nou creată e disponibilă.
- **Ce a greșit Claude:** a concluzionat că nu e înregistrată, dintr-o căutare parțială, deși D o vedea în interfață.
- **Corecția lui D:** arată unde apare unealta și întreabă de ce nu poate fi folosită, deci cere căutarea reluată inclusiv în ce vede el.
- **Regula:** R-129, R-148

### K-076
- **Situația:** s-au scris un plan și un prompt pentru fișe rapide destinate editorilor.
- **Ce a greșit Claude:** planul presupunea alt mod de lucru decât cerința beneficiarului, de editare directă a paginii existente.
- **Corecția lui D:** reamintește cerința și cere verificarea planului și a promptului față de ea.
- **Regula:** R-147

### K-079
- **Situația:** s-a redactat un răspuns către o parte externă, cu afirmații despre un sistem public.
- **Ce a greșit Claude:** afirmațiile nu fuseseră verificate pe sistemul live, unde puteau fi contrazise.
- **Corecția lui D:** cere verificarea fiecărei afirmații pe sistemul live înainte de predare, pentru seriozitatea răspunsului.
- **Regula:** R-157

### K-080
- **Situația:** un răspuns extern clarifica ce intră în sarcina firmei.
- **Ce a greșit Claude:** a cerut o confirmare și a enumerat sisteme externe, ceea ce adăuga muncă și obligații.
- **Corecția lui D:** scoate cererea de confirmare și enumerarea; rămâne o formulare simplă a ariei de responsabilitate.
- **Regula:** R-159

### K-081
- **Situația:** D a cerut o singură frază, pe care o va înlocui singur într-un mesaj.
- **Ce a greșit Claude:** a început să explice contextul și să recitească propria variantă.
- **Corecția lui D:** oprește explicațiile și cere numai fraza.
- **Regula:** R-150

### K-082
- **Situația:** a fost dată o frază de înlocuire care trimitea la numere de puncte.
- **Ce a greșit Claude:** nu a spus ce conțin punctele, ceea ce putea crea confuzie la destinatar.
- **Corecția lui D:** cere refacerea, cu punctele numite explicit.
- **Regula:** R-167

### K-085
- **Situația:** un răspuns extern propunea discuții verbale, iar Claude a susținut că evitarea lor nu e necesară.
- **Ce a greșit Claude:** a citit intenția contrapărții altfel decât D, care o cunoaște din experiență, și a construit pe lectura proprie.
- **Corecția lui D:** explică intenția reală și riscul ca informația dată verbal să se piardă și cere o ciornă strict în scris.
- **Regula:** R-158, R-148

### K-086
- **Situația:** după un răspuns scris pentru un partener extern, Claude a continuat cu o ciornă și cu pași următori.
- **Ce a greșit Claude:** a pregătit lucrări ulterioare înainte de răspunsul partenerului și fără semnalul lui D.
- **Corecția lui D:** oprește: mesajul îl pregătește el, se așteaptă răspunsul final și abia apoi se creează sarcinile, iar până atunci Claude doar așteaptă.
- **Regula:** R-149

### K-092
- **Situația:** D cerea versiunea corectată a unui clip, iar refacerea a fost raportată, deși în locul de livrare ajunseseră două copii ale versiunii vechi.
- **Ce a greșit Claude:** a declarat livrarea fără să compare fișierul din locul de livrare cu cel nou.
- **Corecția lui D:** întreabă unde e versiunea actualizată și arată că a primit de două ori fișierul greșit.
- **Regula:** R-109

### K-093
- **Situația:** un set de prezentare cu note de vorbitor a fost raportat ca verificat, dar fișierele nu se deschideau.
- **Ce a greșit Claude:** a validat conținutul și structura fără să încerce deschiderea efectivă.
- **Corecția lui D:** cere repararea fișierelor care nu se deschid, înainte de orice continuare.
- **Regula:** R-109

### K-094
- **Situația:** niște seturi de carduri au fost declarate nepregătite de predare fiindcă existau într-un singur format, deși sursa lor era într-o unealtă conectată.
- **Ce a greșit Claude:** a tratat lipsa ca pe o limită, fără să verifice dacă sursa disponibilă poate da ce lipsește.
- **Corecția lui D:** întreabă dacă nu se pot prelua direct din unealta unde au fost generate.
- **Regula:** R-140

### K-095
- **Situația:** toate fazele și criteriile au fost raportate închise, apoi D a găsit într-un clip text ilizibil.
- **Ce a greșit Claude:** a declarat gata numai pe liste de control, fără să privească rezultatul final.
- **Corecția lui D:** cere verificarea tuturor clipurilor și o corecție propusă pe fiecare cadru afectat, fără regenerare integrală și păstrând forma aprobată.
- **Regula:** R-97

### K-099
- **Situația:** pentru câteva articole fără text în sursa veche s-au propus rezumate scrise de Claude.
- **Ce a greșit Claude:** a propus conținut inventat acolo unde sursa nu oferea nimic.
- **Corecția lui D:** respinge umplerea: dacă sursa nu are text, câmpul rămâne gol.
- **Regula:** R-177

### K-100
- **Situația:** D a fost rugat să treacă pe contul de test și să continue pe un sistem live, fără să se fixeze ce obiecte se ating.
- **Ce a greșit Claude:** nu a stabilit de la început că se lucrează numai pe copii.
- **Corecția lui D:** după comutarea contului cere verificarea că lucrul e pe copii, nu pe pagini reale.
- **Regula:** R-61

### K-101
- **Situația:** s-a propus o cale de lucru care presupunea deschiderea unei pagini publice.
- **Ce a greșit Claude:** a recomandat-o fără să verifice ce poate face D cu accesul lui de atunci.
- **Corecția lui D:** arată ce poate și ce nu poate deschide în acel moment, deci cere o cale pe accesul real.
- **Regula:** R-115

### K-102
- **Situația:** Claude a anunțat că aduce capturile în conversație, ca D să le salveze, dar ele n-au ajuns la el.
- **Ce a greșit Claude:** a promis un mod de livrare pe care nu l-a îndeplinit.
- **Corecția lui D:** semnalează că nu vede captura și amintește ce i se spusese.
- **Regula:** R-125

### K-103
- **Situația:** Promptul de continuare a fost scris după o sesiune cu greșeli și costuri, fără să arate ce lecții cuprinde.
- **Ce a greșit Claude:** A tratat handoff-ul ca pe un rezumat de stare, nu ca pe un mecanism care previne repetarea greșelilor.
- **Corecția lui D:** Cere ca fluxul să învețe din fiecare greșeală și ca lecțiile să fie vizibile.
- **Regula:** R-220

### K-104
- **Situația:** s-a propus ștergerea unui element, ca să iasă din vedere, cu păstrarea conținutului în altă parte.
- **Ce a greșit Claude:** a ales o acțiune distructivă când exista o stare reversibilă.
- **Corecția lui D:** refuză ștergerea și cere starea de ciornă, în care elementul nu mai e public, dar rămâne în administrare.
- **Regula:** R-54

### K-105
- **Situația:** s-au dat pași de ascundere a unui element, cu un nume de opțiune care nu apărea pe ecranul lui D.
- **Ce a greșit Claude:** a descris interfața cu denumiri neconfirmate pe ecranul real.
- **Corecția lui D:** spune că nu vede opțiunea numită și întreabă pe ce element să lucreze.
- **Regula:** R-98

### K-108
- **Situația:** D cerea îmbunătățirea unor fișe rapide după observațiile primite, iar Claude a început să corecteze proceduri detaliate.
- **Ce a greșit Claude:** a extins lucrul spre un livrabil necerut.
- **Corecția lui D:** reamintește scopul: o versiune mai bună a fișelor, nu corectarea procedurilor.
- **Regula:** R-03

### K-111
- **Situația:** un pas dintr-o fișă a fost rescris fără captura panoului și a câmpului la care trimitea.
- **Ce a greșit Claude:** a lăsat pasul fără dovada vizuală necesară.
- **Corecția lui D:** observă lipsa capturii și a câmpului numit, deci cere dovada pentru acel pas.
- **Regula:** R-20

### K-112
- **Situația:** într-o procedură, o adnotare numerotată pe un buton sugera apăsarea lui, deși textul spunea să nu fie apăsat.
- **Ce a greșit Claude:** a lăsat figura în contradicție cu textul.
- **Corecția lui D:** arată contradicția și întreabă de ce butonul e marcat ca pas.
- **Regula:** R-173

### K-113
- **Situația:** un registru tabelar a fost livrat cu toate verificările trecute, fără să se țină seama de cerința ca el să fie ușor de folosit.
- **Ce a greșit Claude:** a verificat structura și datele, nu și utilizabilitatea cerută.
- **Corecția lui D:** cere refacerea cu unealta potrivită, inclusiv designul, nu doar structura.
- **Regula:** R-97

### K-114
- **Situația:** într-o versiune nouă a registrului, o coloană a rămas goală fără explicație, iar un cod tehnic apărea în locul celor cerute.
- **Ce a greșit Claude:** a livrat un câmp necompletat nedeclarat și o afișare nepotrivită.
- **Corecția lui D:** cere scoaterea textului tehnic, întreabă de ce coloana e goală și cere actualizarea cu ce s-a rezolvat.
- **Regula:** R-177, R-160

### K-116
- **Situația:** pentru găsirea sursei unei probleme s-a propus instalarea unei componente de diagnostic pe un sistem live.
- **Ce a greșit Claude:** a propus o intervenție, când se ceruse numai identificarea sursei.
- **Corecția lui D:** repetă ferm că nu se modifică nimic: sursa se caută fără scriere, soluțiile se prezintă, iar decizia e a lui.
- **Regula:** R-59

### K-119
- **Situația:** s-a raportat o serie de modificări făcute, iar ciorna unui mesaj a fost pusă într-un fișier.
- **Ce a greșit Claude:** a omis o modificare cerută și a livrat ciorna ca fișier, nu în conversație.
- **Corecția lui D:** cere modificarea omisă și ciorna direct în conversație.
- **Regula:** R-156, R-108

### K-120
- **Situația:** D a întrebat despre o pagină de retras, iar răspunsul a venit cu o recomandare și cu pași de executat.
- **Ce a greșit Claude:** a trecut de la analiză la recomandare operațională fără să i se ceară.
- **Corecția lui D:** oprește scurt: Claude nu face nimic.
- **Regula:** R-03

### K-122
- **Situația:** după o modificare livrată, Claude s-a oprit și a așteptat reacția lui D.
- **Ce a greșit Claude:** s-a oprit într-un punct care nu cerea o decizie.
- **Corecția lui D:** cere să fie întrebat numai dacă are de răspuns la ceva anume, altfel lucrul continuă.
- **Regula:** R-146

### K-124
- **Situația:** s-au produs capturi foarte mici, decupate pe zona relevantă, fără context de ecran.
- **Ce a greșit Claude:** a ales un format care nu arată unde se află elementul pe ecran.
- **Corecția lui D:** cere întâi explicația alegerii, iar după formatul cu ecran întreg și detaliu mărit cere extinderea lui la capturile deja făcute.
- **Regula:** R-174

### K-126
- **Situația:** D ceruse un pas de compactare a sesiunii, iar Claude a luat o decizie proprie.
- **Ce a greșit Claude:** a înlocuit instrucțiunea explicită cu propria alegere.
- **Corecția lui D:** interzice ferm deciziile peste ale lui și cere executarea exactă a celor cerute.
- **Regula:** R-03

### K-127
- **Situația:** un set de prezentare și documente pentru cursanți au fost livrate cu limbaj generic și adresare didactică.
- **Ce a greșit Claude:** a explicat ce știu deja cursanții și a folosit formulări cu aspect automat.
- **Corecția lui D:** confirmă cu ajustări: română firească, adresare către oameni cu experiență, numai cum se folosește noul sistem.
- **Regula:** R-170

### K-128
- **Situația:** un livrabil conținea context despre procesul de decizie și despre contradicții rezolvate.
- **Ce a greșit Claude:** a lăsat urme de proces în documente pentru cititorii finali.
- **Corecția lui D:** cere scoaterea lor; destinatarii vor produsul finit, nu istoricul.
- **Regula:** R-160

### K-129
- **Situația:** după cererea de scoatere a referințelor la proces, livrabilul descria mecanisme interne de generare și o remediere.
- **Ce a greșit Claude:** a repetat greșeala, deși regula fusese enunțată clar.
- **Corecția lui D:** reamintește cererea explicită și cere scoaterea, fiindcă aceste referințe nu interesează pe nimeni.
- **Regula:** R-160

### K-130
- **Situația:** s-au pregătit pași de resetare a parolei pe contul real al unei persoane.
- **Ce a greșit Claude:** a vizat contul altcuiva în locul contului destinat testului.
- **Corecția lui D:** corectează ținta: se lucrează pe contul de test cu rolul potrivit, nu pe contul persoanei reale.
- **Regula:** R-55, R-61

### K-131
- **Situația:** D era condus printr-o agendă, cu multe detalii și sărituri între idei.
- **Ce a greșit Claude:** a supraîncărcat explicațiile și a pierdut firul pașilor.
- **Corecția lui D:** cere parcurgerea încet, pas cu pas, fără detalii în plus.
- **Regula:** R-171

### K-132
- **Situația:** ghidarea unei agende a început de la al treilea bloc.
- **Ce a greșit Claude:** a sărit peste început fără acordul lui D.
- **Corecția lui D:** întreabă de ce se începe de acolo, când agenda n-a fost urmărită de la capăt.
- **Regula:** R-03

### K-135
- **Situația:** D urma să dea exemple în sală, dar exemplele nu erau scrise în materialul de regie.
- **Ce a greșit Claude:** a lăsat un gol: D ar fi trebuit să caute conținut în timpul prezentării.
- **Corecția lui D:** cere exemplul și informația de oferit scrise în caietul de regie, fără timpi morți.
- **Regula:** R-171

### K-136
- **Situația:** s-a vorbit de modificări în materiale deja distribuite cursanților.
- **Ce a greșit Claude:** a tratat ca modificabile niște materiale predate.
- **Corecția lui D:** oprește: materialele au fost primite și acolo nu se mai schimbă nimic.
- **Regula:** R-164

### K-139
- **Situația:** s-a pregătit un exercițiu cu o modificare reală pe sistemul public, urmată de revenire.
- **Ce a greșit Claude:** a construit un exercițiu care contrazicea decizia de a nu face restaurări în sală.
- **Corecția lui D:** întreabă dacă chiar trebuie modificat ceva și arată că nu o face, fiindcă ar trebui apoi să restaureze.
- **Regula:** R-61

### K-141
- **Situația:** s-a propus ca o limitare descoperită la verificare să apară în foaia de sală.
- **Ce a greșit Claude:** a mutat un defect intern într-un material citit și de beneficiar.
- **Corecția lui D:** scoate adaosul: defectul nu apare în foaie, iar procesele interne nu se arată beneficiarului.
- **Regula:** R-161

### K-142
- **Situația:** s-a anunțat corectarea în foaia de sală a unei diferențe de scriere văzute pe ecran.
- **Ce a greșit Claude:** a uitat regula că materialele vizibile beneficiarului nu fac referire la defecte.
- **Corecția lui D:** interzice corecția și reamintește regula deja stabilită.
- **Regula:** R-161

### K-143
- **Situația:** s-a investigat în profunzime comportamentul unui element complex, în afara agendei.
- **Ce a greșit Claude:** a abătut lucrul spre detalii tehnice.
- **Corecția lui D:** cere să rămână simplu, în agenda promisă, fără abateri care ar putea fi reproșate ca promisiuni nerespectate.
- **Regula:** R-03

### K-148
- **Situația:** D a fost trimis într-un ecran de setări, numit cu o denumire ambiguă.
- **Ce a greșit Claude:** a folosit un termen cu două interpretări.
- **Corecția lui D:** confirmă ecranul și întreabă ce înseamnă de fapt termenul, deci cere denumirea exactă.
- **Regula:** R-168

### K-151
- **Situația:** imediat după încheierea unei sesiuni s-a propus continuarea cu următoarea.
- **Ce a greșit Claude:** a împins lucrul înainte fără acordul lui D.
- **Corecția lui D:** fixează el momentul următoarei unități.
- **Regula:** R-70

### K-152
- **Situația:** D a fost trimis la un ecran numit cu o denumire pe care ecranul nu o avea.
- **Ce a greșit Claude:** a cerut deschiderea lui fără să confirme denumirea pe interfața reală.
- **Corecția lui D:** arată că vede alt ecran și nu găsește ce i s-a spus.
- **Regula:** R-98

### K-153
- **Situația:** în foaia de sală, vizibilă și cursanților, au apărut avertismente pentru formator.
- **Ce a greșit Claude:** a pus în documentul partajat note destinate numai formatorului.
- **Corecția lui D:** amintește că regula a fost discutată de mai multe ori și trimite la memorie.
- **Regula:** R-161

### K-154
- **Situația:** s-a presupus aparatul de pe care prezintă D și s-au dat sfaturi pentru acea platformă.
- **Ce a greșit Claude:** a presupus mediul în loc să îl verifice.
- **Corecția lui D:** precizează mediul real, ceea ce anulează sfaturile date.
- **Regula:** R-147

### K-155
- **Situația:** s-a propus o configurație pentru un flux cu agenți, fără pasul de documentare a contextului.
- **Ce a greșit Claude:** a sărit un pas preliminar.
- **Corecția lui D:** impune ordinea: documentul de context, apoi investigarea prin întrebări, apoi scrierea.
- **Regula:** R-03

### K-156
- **Situația:** într-o operațiune pe un sistem în producție, deciziile au fost închise și s-a trecut la scrierea planului.
- **Ce a greșit Claude:** nu a fixat explicit garanția de risc zero pe sistem și pe componentele lui.
- **Corecția lui D:** cere apăsat: zero risc, numai citire, oprire imediată la orice risc posibil.
- **Regula:** R-59

### K-157
- **Situația:** într-o ciornă către un partener se recunoștea că materialele anterioare au erori.
- **Ce a greșit Claude:** a subminat poziția lui D, recunoscând greșeli neconfirmate.
- **Corecția lui D:** întreabă dacă afirmația e adevărată și nu acceptă o poziționare inferioară.
- **Regula:** R-157

### K-162
- **Situația:** s-a afirmat că o operațiune cere acces la sistemul de fișiere al serverului, cu trimitere la o cerință.
- **Ce a greșit Claude:** a prezentat ca necesară o cale pe care cerința nu o impunea, ignorând una mai simplă.
- **Corecția lui D:** arată calea simplă, din interfață, și că nicio cerință nu menționează cealaltă cale.
- **Regula:** R-140

### K-164
- **Situația:** i s-a cerut lui D un fișier de test pe care Claude îl putea crea singur.
- **Ce a greșit Claude:** a cerut o resursă banală, ușor de produs.
- **Corecția lui D:** îl trimite să-și facă singur fișierul, fără date reale.
- **Regula:** R-154

### K-165
- **Situația:** s-a trimis un test pe un formular real, fără schimbarea temporară a destinatarului și fără verificarea traseului.
- **Ce a greșit Claude:** a rulat o probă cu efect real asupra unei terțe părți, fără protecție.
- **Corecția lui D:** reacționează ferm: destinatarul trebuia schimbat temporar și restabilit, iar lucrul nu se mai repetă.
- **Regula:** R-62

### K-166
- **Situația:** După un incident, Claude a anunțat revenirea unei setări, fără ca D să poată înțelege starea de dinainte și de după.
- **Ce a greșit Claude:** A raportat confuz valoarea setării.
- **Corecția lui D:** Întreabă care era de fapt valoarea, fiindcă nu mai înțelege raportul.
- **Regula:** R-221

### K-167
- **Situația:** s-a afirmat că schimbarea destinatarului a fost salvată, dar fără efect, fără să se explice contradicția cu ce observase D.
- **Ce a greșit Claude:** a vorbit despre efectul schimbării fără dovadă pe traseul real.
- **Corecția lui D:** deduce din explicații ce s-a întâmplat de fapt și pune contradicția în față, deci cere dovada de la capăt la capăt.
- **Regula:** R-115

### K-168
- **Situația:** o ciornă de răspuns către un partener conținea detalii și justificări care puteau ridica întrebări.
- **Ce a greșit Claude:** a depășit cererea punctuală și a adăugat explicații riscante.
- **Corecția lui D:** cere refacerea scurtă, strict pe ce s-a cerut, fără nimic care să ridice semne de întrebare la o verificare externă.
- **Regula:** R-157

### K-169
- **Situația:** un raport a fost predat ca gata, deși capturile de dovadă nu erau în document.
- **Ce a greșit Claude:** nu a verificat pe documentul final că dovezile sunt acolo.
- **Corecția lui D:** întreabă unde sunt capturile, pe care nu le vede în document.
- **Regula:** R-166

### K-174
- **Situația:** un document pe antet a fost livrat ca verificat vizual, dar după câteva rânduri urma o pagină aproape goală.
- **Ce a greșit Claude:** a controlat textul și marginile, nu cum cade fiecare secțiune în pagină.
- **Corecția lui D:** respinge paginarea și cere o regulă unică, pe tot documentul: o secțiune care nu încape începe pe pagina următoare, fără pagini lăsate goale.
- **Regula:** R-175

### K-176
- **Situația:** pentru o operațiune programată s-a insistat să se ceară azi o confirmare scrisă de la un partener extern, creând urgență.
- **Ce a greșit Claude:** a presupus că acordul lipsește și a împins un pas extern, fără să întrebe dacă D îl are deja.
- **Corecția lui D:** oprește cererea: acordul există, nu se cere nimic, și indică direct cum se continuă.
- **Regula:** R-139

### K-184
- **Situația:** D stabilise ordinea pașilor pe un sistem în producție, iar Claude a făcut o verificare în altă ordine și cu altă unealtă, înainte să-i citească mesajul.
- **Ce a greșit Claude:** a continuat pe sistemul live fără instrucțiunea curentă, pe alt canal decât cel stabilit.
- **Corecția lui D:** reia ordinea: întâi pasul indicat, cu unealta stabilită, cu grijă să nu blocheze sistemul, și amintește că se lucrează în producție.
- **Regula:** R-03

### K-185
- **Situația:** în timpul unor citiri pe un sistem public, utilizatori reali au primit răspunsuri de limitare a cererilor.
- **Ce a greșit Claude:** volumul cererilor sesiunii a contribuit la limitarea accesului.
- **Corecția lui D:** cere oprirea imediată a tot ce rulează, inclusiv a proceselor de fundal.
- **Regula:** R-194

### K-186
- **Situația:** după cererea de oprire totală, procesele proprii au fost oprite, dar a rămas activ un proces de legătură pornit de altă sesiune.
- **Ce a greșit Claude:** a citit cererea ca referindu-se numai la ce pornise el.
- **Corecția lui D:** cere oprirea și a procesului lăsat de cealaltă sesiune.
- **Regula:** R-194

### K-187
- **Situația:** la închiderea unei sesiuni, în fișierul de instrucțiuni rămăseseră apariții ale formei ortografice interzise de D.
- **Ce a greșit Claude:** a scris sau a lăsat forma interzisă, deși regula e absolută.
- **Corecția lui D:** cere corectarea tuturor aparițiilor înainte de închiderea sesiunii.
- **Regula:** R-144

### K-192
- **Situația:** D a fost rugat să se autentifice într-o filă deschisă de Claude, fără să se știe unde era atașată unealta.
- **Ce a greșit Claude:** a presupus că fila e vizibilă pe ecranul lui D și a construit pasul următor pe asta.
- **Corecția lui D:** spune că nu vede nicio filă, ceea ce scoate la iveală că unealta lucra în alt browser.
- **Regula:** R-206

### K-193
- **Situația:** unealta de browser era conectată la un browser de pe alt calculator, unde se făcuseră citiri și descărcări.
- **Ce a greșit Claude:** a folosit un browser necunoscut, fără să verifice a cui e și unde rulează.
- **Corecția lui D:** interzice folosirea lui și fixează calculatorul pe care se lucrează.
- **Regula:** R-206

### K-196
- **Situația:** D ceruse scoaterea unor elemente dintr-o singură zonă și un plan pentru rest, iar răspunsul a venit cu explicații despre cum se deosebesc dublurile.
- **Ce a greșit Claude:** a deviat spre detalii intermediare pe care D nu le ceruse.
- **Corecția lui D:** spune că nu vede de ce ar deosebi elementele, reamintește cererea exactă și cere plan pentru rest.
- **Regula:** R-03

### K-197
- **Situația:** într-un material de prezentare au apărut afirmații despre semnarea unui document în timpul întâlnirii.
- **Ce a greșit Claude:** a trecut în livrabil un pas administrativ presupus, neconfirmat.
- **Corecția lui D:** cere scoaterea afirmațiilor, precizează cum se face de fapt pasul și cere reformularea.
- **Regula:** R-121

### K-201
- **Situația:** într-un material pentru client a intrat, din documentele de lucru, numele unei persoane căreia i se atribuia o sarcină.
- **Ce a greșit Claude:** a dus o alocare nominală internă în fața clientului.
- **Corecția lui D:** cere ca persoana să nu apară nicăieri, fiindcă responsabilul îl desemnează partea în drept.
- **Regula:** R-162

### K-202
- **Situația:** un document de status, care putea fi arătat clientului, conținea un capitol din altă etapă și elemente adresate numai lui D.
- **Ce a greșit Claude:** a extins documentul peste subiect și a inclus ce putea ridica întrebări fără răspuns.
- **Corecția lui D:** cere ca documentul să poată fi arătat oricând, fără speculații, și scoaterea capitolului străin.
- **Regula:** R-161, R-150

### K-205
- **Situația:** într-un document de status mai multe cerințe au fost marcate neconforme, pe baza documentelor de lucru.
- **Ce a greșit Claude:** a declarat neîndeplinite cerințe deja realizate, fără să verifice pe sistem.
- **Corecția lui D:** arată punct cu punct că neconformitățile sunt rezolvate sau decise altfel.
- **Regula:** R-22

### K-208
- **Situația:** într-un scenariu de discurs, D era prezentat ca omul care preia și duce proiectul la final.
- **Ce a greșit Claude:** i-a amplificat rolul, deși D și-l descrisese clar ca ajutor la finalizare.
- **Corecția lui D:** readuce formularea la rolul declarat de el.
- **Regula:** R-125

### K-212
- **Situația:** într-o minută scrisă din notițele lui D s-au adăugat pași următori, o ședință viitoare și o listă de clarificat.
- **Ce a greșit Claude:** a completat minuta cu elemente care nu reieșeau din notițe.
- **Corecția lui D:** precizează că nu există ședință viitoare, dă datele lipsă și cere scoaterea listei adăugate.
- **Regula:** R-150

### K-214
- **Situația:** s-a anunțat rezolvată cauza pentru care unele componente nu apăreau într-o aplicație.
- **Ce a greșit Claude:** a declarat rezolvarea fără probă în mediul în care D le folosește.
- **Corecția lui D:** raportează că elementele tot nu apar în listă, deși căutarea le găsește.
- **Regula:** R-115

### K-216
- **Situația:** la replicarea unui mediu de lucru pe alt calculator s-au instalat și componente care țin de altă firmă.
- **Ce a greșit Claude:** a ales singur perimetrul și a copiat tot, fără să confirme.
- **Corecția lui D:** precizează ce îl interesează, adică numai componentele legate de firma lui și de proiectele tehnice.
- **Regula:** R-02, R-147

### K-226
- **Situația:** o propunere de scriere pe un sistem live includea și modificarea unui text existent, iar riscurile erau descrise greu de înțeles.
- **Ce a greșit Claude:** a extins scrierea la un câmp necerut și nu a spus clar dacă sistemul poate fi blocat.
- **Corecția lui D:** cere garanția că textul rămâne neschimbat, întreabă de unde vine un element din listă și cere riscurile pe înțeles.
- **Regula:** R-63, R-47

### K-230
- **Situația:** în timpul unei analize, cereri repetate de permisiune pentru operații simple încetineau lucrul.
- **Ce a greșit Claude:** a cerut aprobare pentru acțiuni fără risc la fel ca pentru cele sensibile.
- **Corecția lui D:** stabilește regula: operațiile simple avansează, iar întrebarea rămâne obligatorie la fișiere sensibile, autentificări și situații noi.
- **Regula:** R-38

### K-231
- **Situația:** Claude a reparat un defect al unei componente publicate și a raportat reparația, fără să caute de ce a apărut.
- **Ce a greșit Claude:** A tratat simptomul, nu cauza din fluxul care a produs defectul.
- **Corecția lui D:** Cere identificarea greșelii inițiale din flux, salvarea unei reguli de prevenire și aplicarea reparației.
- **Regula:** R-222

### K-232
- **Situația:** reparația unei componente a fost încheiată ca gata, deși efectul se putea vedea numai după o repornire.
- **Ce a greșit Claude:** a raportat rezolvarea fără dovada care depindea de proba lui D.
- **Corecția lui D:** raportează că problema persistă după repornire și cere o soluție definitivă.
- **Regula:** R-119

### K-233
- **Situația:** înaintea rescrierii unui manual pentru utilizatori se vorbea despre decizii interne și sarcini de proiect, iar mesajul conținea și forma ortografică interzisă.
- **Ce a greșit Claude:** risca să ducă în livrabil urme de proces și a uitat regula ortografică.
- **Corecția lui D:** cere ca manualul să conțină numai ce le trebuie utilizatorilor și întreabă dacă regula a fost respectată.
- **Regula:** R-160, R-144

### K-234
- **Situația:** un document final a fost raportat ca verificat, dar avea din nou pagini aproape goale, iar antetul și subsolul purtau etapa proiectului și data.
- **Ce a greșit Claude:** a verificat numărători, nu aspectul paginilor, și a repetat o greșeală deja corectată.
- **Corecția lui D:** semnalează iar paginarea și cere scoaterea etapei și a datei din antet și subsol.
- **Regula:** R-175, R-160

### K-238
- **Situația:** un mesaj de status către client includea un paragraf despre o funcție în lucru și o coordonare a testului cu clientul.
- **Ce a greșit Claude:** a decis singur ce se comunică și a implicat clientul într-un pas intern.
- **Corecția lui D:** scoate adaosul: nu se programează nimic cu clientul, testul e intern, iar funcția se anunță numai când e gata și verificată.
- **Regula:** R-150, R-157

### K-239
- **Situația:** după explicația lui D, paragraful a rămas reformulat, iar lui D i s-au oferit variante.
- **Ce a greșit Claude:** a citit în grabă și a oferit alegeri care contraziceau instrucțiunea.
- **Corecția lui D:** repetă instrucțiunea și cere citire atentă, fără grabă, și așteptare.
- **Regula:** R-147, R-149

### K-240
- **Situația:** în fișe pentru utilizatori a apărut o exprimare nefirească, de text generat, și forma ortografică interzisă.
- **Ce a greșit Claude:** a scris neidiomatic și a încălcat regula ortografică.
- **Corecția lui D:** dă formularea firească și cere să nu mai apară forma interzisă.
- **Regula:** R-170, R-144

### K-242
- **Situația:** D a dat observații pe trei variante de fișă și a cerut analiză, apoi pilot pe un model combinat, iar Claude a rescris direct o fișă.
- **Ce a greșit Claude:** a sărit peste analiză și pilot.
- **Corecția lui D:** spune că nu a cerut rescrierea și refixează ordinea: analiză, pilot pe modelul combinat, apoi restul.
- **Regula:** R-03, R-69

### K-245
- **Situația:** s-a propus o fișă introductivă comună și, odată cu ea, scoaterea unor pași repetați din fișele existente.
- **Ce a greșit Claude:** a vrut să slăbească livrabilul existent și risca să treacă la restul planului înainte de a termina.
- **Corecția lui D:** acceptă îmbunătățirea numai ca adaos, cere păstrarea tuturor pașilor și interzice începerea restului până la terminarea sarcinii curente.
- **Regula:** R-150

### K-246
- **Situația:** într-o fișă pas cu pas, pentru un pas s-a folosit o captură de pe alt ecran, fiindcă meniul arăta la fel.
- **Ce a greșit Claude:** a judecat figura după aspect, nu după ecranul descris de pas.
- **Corecția lui D:** întreabă ce caută acolo captura altui ecran și interzice refolosirea pe motiv de asemănare.
- **Regula:** R-172

### K-249
- **Situația:** pentru o sarcină angajată deja în scris față de client, o constatare a pus sub semnul întrebării necesitatea ei.
- **Ce a greșit Claude:** a redeschis un angajament pe care D îl comunicase deja.
- **Corecția lui D:** reamintește angajamentul scris, spune că exact asta se face și cere plan și prompt pentru o sesiune dedicată.
- **Regula:** R-149

### K-256
- **Situația:** la verificarea unui meniu cu multe linkuri s-a raportat că unele destinații lipsesc, inclusiv una care există și e completă.
- **Ce a greșit Claude:** a afirmat absența fără căutare exhaustivă și a confundat un link fără adresă cu o pagină inexistentă.
- **Corecția lui D:** arată pagina și conținutul ei, numește defectul real, legătura care nu duce la ea, și întreabă dacă există alta cu care s-ar fi putut face confuzia.
- **Regula:** R-129

### K-257
- **Situația:** la sfârșitul unei sesiuni s-a produs un prompt de reluare scris în engleză.
- **Ce a greșit Claude:** a scris în altă limbă un text pe care D îl citește și îl lipește.
- **Corecția lui D:** înlocuiește textul cu o variantă în limba lui, cu starea planului, pasul de executat, punctul de oprire și interdicțiile.
- **Regula:** R-143

### K-260
- **Situația:** mai multe sesiuni lucrau în paralel pe același proiect, iar handoff-ul unei sesiuni nu spunea unde continuă lucrul.
- **Ce a greșit Claude:** nu a spus clar în care sesiune continuă firul.
- **Corecția lui D:** întreabă în care sesiune se continuă, fiindcă el nu lucrează în două locuri deodată.
- **Regula:** R-189

### K-267
- **Situația:** aceeași operațiune de generare a unui document era reluată în tăcere, cu comenzi rulate una după alta.
- **Ce a greșit Claude:** a continuat încercările fără să anunțe blocajul și fără să explice întârzierea.
- **Corecția lui D:** întreabă nemulțumit de ce durează atât și cere să înțeleagă ce se întâmplă.
- **Regula:** R-85

### K-268
- **Situația:** metoda aleasă pentru un livrabil nu funcționa și a fost încercată de trei ori, cu resurse consumate, înainte de orice explicație.
- **Ce a greșit Claude:** a insistat pe aceeași cale în loc să se oprească și să propună una mai simplă.
- **Corecția lui D:** cere oprirea și trecerea la varianta simplă, formatul editabil, cu conversia făcută de el, și regula de a nu insista când resursele se consumă degeaba.
- **Regula:** R-211, R-14

### K-270
- **Situația:** după o lucrare lungă s-a livrat un raport mare, cu tabele și cifre, iar câteva sarcini rămâneau neîncheiate.
- **Ce a greșit Claude:** raportul era narativ, iar ce mai rămânea și cine face nu era limpede.
- **Corecția lui D:** cere un rezumat scurt și câte o explicație pentru fiecare sarcină rămasă, cu precizarea că le rezolvă Claude.
- **Regula:** R-118

### K-271
- **Situația:** un sistem nou a fost auditat față de cel vechi, presupunând aceeași structură a paginilor, iar în timpul auditului s-a scris în pagini.
- **Ce a greșit Claude:** a presupus structura, a comparat nepotrivit și a modificat conținut într-un audit.
- **Corecția lui D:** impune metoda: întâi pagina echivalentă, apoi comparația; auditul nu șterge și nu schimbă nimic, ce s-a modificat se readuce exact, iar diferențele doar se marchează.
- **Regula:** R-58

### K-272
- **Situația:** un plan și un prompt au fost predate ca fișiere de text simplu, cu indicația de a fi deschise.
- **Ce a greșit Claude:** a predat într-un format pe care D nu îl poate deschide.
- **Corecția lui D:** spune că nu poate deschide acel tip de fișier, deci cere alt format.
- **Regula:** R-179

### K-274
- **Situația:** pentru o scriere pe un sistem live s-a pornit un server local și s-au ocolit restricțiile browserului, iar pagina a apărut ca nesigură.
- **Ce a greșit Claude:** a ales un ocolitor care slăbește garanțiile de securitate.
- **Corecția lui D:** observă avertismentul și refuză să continue fără certificat valid.
- **Regula:** R-66

### K-278
- **Situația:** o fază pe o pagină publică a fost raportată ca executată și verificată, urmând trecerea la următoarea.
- **Ce a greșit Claude:** a declarat-o terminată, deși un element vechi nu era ascuns, apăreau zone goale, iar în listă intrase un element greșit.
- **Corecția lui D:** cere verificarea rezultatului vizual înainte de faza următoare și arată că faza nu e încheiată.
- **Regula:** R-89

### K-283
- **Situația:** regulile unui generator de documente au fost schimbate pentru un singur document, apoi s-au propus sau făcut verificări și pe celelalte.
- **Ce a greșit Claude:** a extins lucrul dincolo de documentul cerut.
- **Corecția lui D:** limitează modificarea la documentul vizat și oprește trecerea prin rest.
- **Regula:** R-03

### K-291
- **Situația:** câteva clipuri au fost raportate gata, cu subtitrări verificate prin măsurători.
- **Ce a greșit Claude:** a declarat subtitrarea prezentă, deși D nu o vedea în fișierul livrat.
- **Corecția lui D:** spune din nou că nu o vede și amână subiectul, deci măsurătorile nu țin loc de redarea reală.
- **Regula:** R-89

### K-296
- **Situația:** s-a publicat un rezumat vizual al unui plan de lucru.
- **Ce a greșit Claude:** a lăsat afară o parte pe care D o aștepta.
- **Corecția lui D:** constată lipsa și cere includerea ei.
- **Regula:** R-108

### K-297
- **Situația:** în același rezumat publicat lipsea un element discutat.
- **Ce a greșit Claude:** l-a omis, deși fusese convenit.
- **Corecția lui D:** întreabă dacă elementul nu a fost inclus, ceea ce cere verificarea punct cu punct.
- **Regula:** R-108

### K-311
- **Situația:** pentru mai multe formulare, D hotărâse deja cum arată notificările, iar varianta livrată nu respecta decizia.
- **Ce a greșit Claude:** a uitat o cerință stabilită și a aplicat-o numai pe o parte din instanțe.
- **Corecția lui D:** reamintește că subiectul a fost discutat și enumeră instanțele în care lipsește.
- **Regula:** R-99

### K-312
- **Situația:** s-a făcut un experiment direct pe un formular public în producție, fără acord, iar formularul a dat eroare.
- **Ce a greșit Claude:** a scris pe un sistem public fără confirmare și a lăsat utilizatorii să dea peste eroare.
- **Corecția lui D:** cere remedierea imediată.
- **Regula:** R-61, R-41

### K-315
- **Situația:** o operațiune de generare a unui document se relua în tăcere, cu comenzi succesive.
- **Ce a greșit Claude:** nu a anunțat blocajul și nu a explicat întârzierea.
- **Corecția lui D:** întreabă de ce durează atât și cere să înțeleagă ce se întâmplă.
- **Regula:** R-85

### K-316
- **Situația:** o metodă care nu funcționa a fost încercată de mai multe ori pentru același livrabil, înainte de orice explicație.
- **Ce a greșit Claude:** a rămas pe aceeași cale în loc să propună o rezervă mai simplă.
- **Corecția lui D:** oprește încercările și mută lucrul pe varianta simplă, cu partea rămasă făcută de el.
- **Regula:** R-211, R-14

### K-318
- **Situația:** un document tehnic pentru un client a fost corectat și refăcut fără comparație cu cerința inițială.
- **Ce a greșit Claude:** documentul conținea lucruri neimplementate sau prea detaliate și un ton care putea crea obligații.
- **Corecția lui D:** aduce cerința inițială, cere verificarea față de ea, numai afirmații despre ce e implementat, ton general și un plan înainte de refacere.
- **Regula:** R-157, R-176

### K-323
- **Situația:** o scanare cu multe cereri paralele pe un sistem public în producție a dus la blocarea accesului.
- **Ce a greșit Claude:** nu a avertizat dinainte asupra riscului și a continuat după primele semnale de limitare.
- **Corecția lui D:** reproșează dur că riscul de blocare nu i-a fost spus dinainte.
- **Regula:** R-193, R-194

### K-324
- **Situația:** după blocarea provocată de sesiune, D cerea terminarea planului în aceeași sesiune.
- **Ce a greșit Claude:** blocase, prin cereri simultane, un sistem folosit de mai mulți oameni.
- **Corecția lui D:** interzice cererile masive și cere asigurări ferme înainte de orice repornire.
- **Regula:** R-192, R-194

### K-326
- **Situația:** Un prompt de reluare a fost scris fără limitele de încărcare impuse de o blocare anterioară.
- **Ce a greșit Claude:** Promptul nu purta cu el constrângerea de a nu încărca sistemul în producție.
- **Corecția lui D:** Repetă că verificările se fac fără blocare, fiindcă sistemul e în producție și folosit de mai mulți oameni, și adaugă avertismentul.
- **Regula:** R-223

### K-327
- **Situația:** după verificări pe un sistem de producție s-au dat rezultatele, iar D a cerut o variantă scurtă.
- **Ce a greșit Claude:** a dat prea multe detalii și, după o blocare anterioară, nu a pus riscul de limitare ca primă condiție.
- **Corecția lui D:** cere varianta scurtă și subliniază că blocarea nu se riscă sub nicio formă.
- **Regula:** R-193

### K-329
- **Situația:** un panou de administrare a fost deschis în browserul propriu al uneltei, cu cerere de autentificare, deși D era deja autentificat în alt browser.
- **Ce a greșit Claude:** a folosit browserul izolat, în loc să se conecteze la sesiunea existentă.
- **Corecția lui D:** refuză să se mai autentifice și cere conexiunea la browserul în care lucrează.
- **Regula:** R-49, R-206

### K-331
- **Situația:** într-un raport pentru un beneficiar extern s-a afirmat un eveniment, ca realizat împreună cu personalul acestuia.
- **Ce a greșit Claude:** a scris un eveniment care nu avusese loc, fără dovadă.
- **Corecția lui D:** spune că evenimentul nu a existat și cere eliminarea informației din tot documentul.
- **Regula:** R-157, R-165

### K-333
- **Situația:** D a aprobat pașii propuși pe un sistem de producție, după o blocare anterioară.
- **Ce a greșit Claude:** propusese pașii fără să arate clar costul lor în cereri.
- **Corecția lui D:** aprobă, dar condiționează execuția de asigurarea că sistemul nu va fi blocat.
- **Regula:** R-193

### K-335
- **Situația:** D a întrebat dacă o schimbare de componente influențează raportul final al unei verificări.
- **Ce a greșit Claude:** a analizat în detaliu instalarea și migrarea, deși de ele se ocupa altcineva.
- **Corecția lui D:** spune că instalarea e decisă și în lucru și repetă că întrebarea era numai dacă și cum afectează raportul.
- **Regula:** R-03
