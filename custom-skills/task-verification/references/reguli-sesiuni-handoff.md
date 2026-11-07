# Reguli — sesiuni și handoff

### R-180 — La începutul sesiunii citești integral fișierul de instrucțiuni și memorie al proiectului și urmezi pointerul lui către punctul de reluare, înainte de orice altă acțiune.
- **De ce:** regulile și starea proiectului stau în acel fișier, iar o sesiune care pornește fără el repetă greșeli deja corectate sau execută o metodă dovedită între timp greșită.
- **Cum se verifică:** prima acțiune din sesiune e citirea fișierului, iar handoff-ul folosit corespunde pointerului din el.
- **Cum corectează D:** oprește execuția și cere citirea fișierului și reluarea de la punctul corect.

### R-181 — Înainte să raportezi starea unui subiect, cauți cel mai recent handoff pe acel subiect, nu te bazezi pe cel din care ai pornit, iar un plan mai nou îl anulează pe cel vechi.
- **De ce:** sesiunile paralele iau decizii proprii, iar un raport scris dintr-un handoff depășit poate da drept nefăcut un lucru deja executat.
- **Cum se verifică:** lista handoff-urilor pe subiect, sortată pe dată, cu ultimul citit, iar starea raportată îl citează pe cel mai nou.
- **Cum corectează D:** cere refacerea raportului pe handoff-ul curent.

### R-182 — Afirmațiile și cifrele dintr-un handoff, oricât de recent, le verifici pe sistem înainte să le folosești sau să le raportezi.
- **De ce:** un handoff poate greși parțial, iar cifrele lui îmbătrânesc de îndată ce materialele se regenerează.
- **Cum se verifică:** afirmațiile cheie reconfirmate pe sistem, cifrele recalculate, iar orice diferență față de handoff e explicată.
- **Cum corectează D:** cere cifrele actuale și corectarea handoff-ului.

### R-183 — După o tură întreruptă, o compactare sau o reluare, reverifici starea reală și resursele de sesiune, cu un apel care răspunde, înainte să continui.
- **De ce:** apelurile neterminate nu au rulat, identificatorii efemeri (file, procese, conexiuni) se schimbă sau dispar, iar un proces poate părea viu deși e mort.
- **Cum se verifică:** listarea fișierelor comparată cu ultimul pas confirmat, lista curentă de resurse comparată cu identificatorii din handoff, plus un apel de probă.
- **Cum corectează D:** cere reluarea din starea reală, cu identificatorii citiți din nou sau cu resursa repornită.

### R-184 — Artefactele, extrasele și instrumentele care trebuie să supraviețuiască sesiunii le ții în dosarul durabil al proiectului, nu în spațiul temporar al sesiunii, sau notezi în handoff cum se refac.
- **De ce:** spațiul temporar dispare la o pauză sau la sfârșitul sesiunii, iar următoarea sesiune pornește fără el.
- **Cum se verifică:** calea de ieșire e în proiect, iar handoff-ul listează instrumentele sau comanda de refacere.
- **Cum corectează D:** cere mutarea în proiect sau refacerea și salvarea lor.

### R-185 — La o execuție în mai mulți pași, măsurătorile și jurnalul de stare le scrii pe disc imediat, în dosarul taskului, iar la reluare compari jurnalul cu starea reală.
- **De ce:** o măsurătoare ținută numai în spațiul temporar se pierde și trebuie refăcută, iar pierderea jurnalului obligă la reconstruirea stării.
- **Cum se verifică:** fișierul apare în dosarul taskului imediat după măsurătoare, iar după reluare cifrele din jurnal sunt comparate cu discul.
- **Cum corectează D:** cere mutarea jurnalului în dosarul taskului sau refacerea măsurătorii.

### R-186 — Protejezi contextul principal: cel mult doi subagenți în paralel, cu livrabilul parțial scris între loturi, fără citirea transcriptului lor când rezultatul sosește oricum și cu o singură încărcare de instrucțiuni voluminoase când contextul e aproape plin.
- **De ce:** ieșirile mari umplu fereastra de lucru înainte de primul livrabil, iar un transcript citit în plus nu aduce nimic nou.
- **Cum se verifică:** gradul de umplere a contextului, urmărit după fiecare lot și înainte de orice încărcare voluminoasă.
- **Cum corectează D:** cere reducerea numărului de agenți sau mutarea lucrului într-o sesiune dedicată.

### R-187 — La fiecare pauză între etape anunți explicit punctul de handoff, scrii handoff-ul pe disc și abia apoi compactezi contextul sau începi lucrul nou într-o sesiune nouă.
- **De ce:** un context foarte lung scumpește fiecare mesaj, iar handoff-ul scris pe disc face sigură trecerea, fără ca omul să trebuiască să ghicească momentul.
- **Cum se verifică:** mesajul de închidere a etapei numește punctul de handoff și pașii în ordine, iar fișierul de handoff există înaintea trecerii.
- **Cum corectează D:** cere handoff-ul și oprirea până la terminarea lui.

### R-188 — La închiderea unei faze, predarea conține promptul fazei următoare, copiat ca atare ca autoritate, și un bloc de stare care spune numai ce s-a schimbat față de ce presupune promptul.
- **De ce:** un handoff fără prompt face ca sesiunea următoare să rateze cerințele proprii ale fazei: citirile, contul de confirmat, limitele de lucru.
- **Cum se verifică:** secțiunea „acțiunea următoare” a handoff-ului trimite la prompt cu referință exactă.
- **Cum corectează D:** cere adăugarea promptului la predare.

### R-189 — Fiecare sesiune lucrează pe un singur fir, numit explicit în prompt, iar firele distincte nu se leagă și nu își amestecă titlurile sau dosarele.
- **De ce:** sarcinile suprapuse produc conflicte și muncă dublă, iar un titlu sau un dosar amestecat aduce context greșit în sesiunile următoare.
- **Cum se verifică:** promptul numește firul și exclude restul, iar denumirea sesiunii și a dosarului corespund subiectului.
- **Cum corectează D:** cere restrângerea la un fir și mutarea materialelor în firul corect.

### R-190 — Înainte să scrii într-un fișier pe care îl pot atinge și sesiuni paralele, verifici data modificării și ce sesiuni sunt active, faci o copie de siguranță și recitești fișierul.
- **De ce:** altă sesiune poate modifica același fișier între citire și scriere, iar scrierea ei s-ar pierde.
- **Cum se verifică:** data modificării citită chiar înainte de scriere, plus copia de siguranță pe disc.
- **Cum corectează D:** cere copia de siguranță și recitirea.

### R-191 — Nu repeți o investigație încheiată, ci trimiți la rezultatul ei scris.
- **De ce:** căutarea repetată consumă timp și cereri, fără să schimbe răspunsul.
- **Cum se verifică:** răspunsul trimite la fișierul de rezultat.
- **Cum corectează D:** cere citirea fișierului.

### R-219 — După o depanare cu mai multe încercări consemnezi în memoria durabilă cauza și remediul verificat, înainte să închizi subiectul.
- **De ce:** o soluție găsită greu și neconsemnată se plătește din nou la următoarea apariție.
- **Cum se verifică:** există o notă durabilă cu cauza, remediul și dovada că remediul a mers.
- **Cum corectează D:** cere salvarea cauzei și a remediului, ca data viitoare să meargă din prima.

### R-220 — Un handoff cuprinde greșelile sesiunii transformate în reguli de pornire, nu numai starea lucrului.
- **De ce:** un handoff care descrie numai starea lasă sesiunea următoare să repete aceleași greșeli.
- **Cum se verifică:** handoff-ul și promptul de reluare au o secțiune cu greșelile plătite și regula rezultată din fiecare.
- **Cum corectează D:** cere ca fluxul să învețe din fiecare greșeală și ca lecțiile să se vadă în handoff.
