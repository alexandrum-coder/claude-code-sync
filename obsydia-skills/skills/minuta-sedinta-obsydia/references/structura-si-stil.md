# Structura, formatarea si schema JSON

Referinta completa pentru minuta Obsydia. Suficienta pentru a reconstrui
documentul manual, fara scriptul din `scripts/`.

## 1. Sablonul

`assets/sablon-obsydia.docx` contine:

- antet in `word/header1.xml`, cu `word/media/header.png`: sigla Obsydia si
  subtitlul "software solutions" sus-stanga, iar sus-dreapta trei randuri de
  contact (`www.obsydia.ro`, telefon, `office@obsydia.ro`)
- subsol in `word/footer1.xml`, cu `word/media/footer.png`: steaua in patru
  colturi si textul `obsydia.ro`, jos-stanga
- culoarea siglei: portocaliu-auriu, aproximativ `#F5B547`
- pagina A4, margini: sus 5,2 cm, jos 4,6 cm, stanga 2,0 cm, dreapta 2,0 cm
  (marginile mari de sus si de jos fac loc imaginilor de antet si subsol)
- o singura sectiune, `different_first_page_header_footer = False`, deci antetul
  si subsolul se repeta pe fiecare pagina

Sablonul defineste doar stilurile `Normal`, `Heading 1`, `Header` si `Footer`.
Nu exista `List Bullet`, `List Number` sau `Table Grid`. Prin urmare listele se
scriu ca text (`"•  "`, `"1.  "`) cu indentare agatata, iar bordurile de tabel se
adauga prin OXML brut.

Cum se genereaza corpul: se deschide sablonul ca document, se sterg toate
elementele din `body` **cu exceptia lui `w:sectPr`** (care poarta referintele
catre antet si subsol, marginile si dimensiunea paginii), apoi se adauga
continutul.

## 2. Formatare, valori exacte

| Element | Formatare |
|---|---|
| `Normal` | Calibri 11 pt, spatiu dupa 6 pt, interlinie 1,15 |
| Titlu document | bold, 16 pt, `#1A2C54`, centrat, spatiu dupa 14 pt |
| Etichete bloc identificare | eticheta bold, valoarea normala, spatiu dupa 2 pt |
| Titlu de sectiune | bold, 13 pt, `#1A2C54`, spatiu inainte 16 pt, dupa 6 pt |
| Titlu de subiect numerotat | bold, `#1A2C54`, indent stanga 0,5 cm, prima linie -0,5 cm, spatiu inainte 9 pt |
| Bullet | prefix `"•  "`, indent stanga 1,0 cm, prima linie -0,5 cm, spatiu dupa 3 pt |
| Rand numerotat | prefix `"1.  "`, indent stanga 1,0 cm, prima linie -0,75 cm, spatiu dupa 4 pt |
| Antet tabel | fundal `1A2C54`, text alb bold 10 pt |
| Celule tabel | text 10 pt, spatiu dupa 2 pt |
| Borduri tabel | `single`, `sz=4`, culoare `BFBFBF`, pe toate muchiile plus `insideH` si `insideV` |
| Latimi coloane | 10,4 cm / 3,0 cm / 3,6 cm |

## 3. Ordinea sectiunilor

1. Titlu: `Minuta sedinta, <Subiect>`
2. `Proiect:` / `Data:` / `Ora:` / `Locatie:`
3. `Participanti:` plus doua bullets cu etichetele
   `Obsydia Software Solutions:` si `Reprezentanti <Client>:`, **fara valori**
4. `Obiectivul sedintei`
5. `Subiecte discutate`
6. `Decizii agreate`
7. `Actiuni urmatoare` (tabel `Actiune | Responsabil | Termen`)
8. `Pasi urmatori`

Titlurile se scriu cu diacritice corecte in documentul real
("Participanți", "Obiectivul ședinței", "Acțiuni următoare", "Pași următori").
Aici sunt fara diacritice doar pentru lizibilitatea acestui fisier de referinta.

## 4. Schema JSON

```json
{
  "titlu": "Minută ședință, Analiză Prima Pagină Portal Client Exemplu",
  "proiect": "Portal Digital Client Exemplu, exemplu.ro",
  "data": "10.08.2026",
  "ora": "10:30, durata o oră",
  "locatie": "Online (Microsoft Teams)",
  "client": "Client Exemplu",
  "obiectiv": [
    "Prezentarea stadiului lucrării și colectarea observațiilor.",
    "Stabilirea acțiunilor și a termenelor pentru etapa următoare."
  ],
  "subiecte": [
    {
      "titlu": "Secțiunea Noutăți, format și poziționare",
      "puncte": [
        "Noutățile apar la nivel de idei și titluri, fără imagini.",
        "Caruselul ia locul actual al secțiunii Comenzi rapide."
      ]
    }
  ],
  "decizii": [
    "Noutățile se prezintă la nivel de idei și titluri, fără imagini."
  ],
  "actiuni": [
    ["Reformatarea noutăților la nivel de titluri", "Obsydia", "joi dimineața"],
    ["Transmiterea listei cazurilor punctuale", "Client Exemplu", "[de verificat]"]
  ],
  "pasi_intro": "Comunicarea se face pe email și prin matricea de verificare.",
  "pasi": [
    "Obsydia transmite matricea de verificare, a doua zi după ședință."
  ]
}
```

Data se scrie `DD.MM.AAAA`. Termenele se scriu asa cum au fost formulate in
sedinta (`joi dimineata`, `pana la finalul acestei saptamani`,
`a doua zi dupa sedinta`), nu convertite in date calendaristice, daca in sedinta
nu s-a spus o data exacta. Ce nu s-a stabilit ramane `[de verificat]`.

## 5. Verificarea automata

Scriptul reciteste documentul generat si tipareste:

- numarul de desene din antet si din subsol (fiecare trebuie sa fie cel putin 1)
- daca prima pagina are antet diferit (trebuie `False`)
- numarul de randuri din tabel, comparat cu `len(actiuni) + 1`
- numarul de liniute lungi si medii (trebuie 0)
- numarul de ghilimele curbe (trebuie 0)
- numarul de emoji si iconite (trebuie 0)
- numarul de marcaje `[de verificat]` (informativ)
- formularile interzise gasite in text (trebuie 0)

Raportul se termina cu `OK` sau cu `PROBLEME: ...`. Fara `OK`, documentul nu se
livreaza.

## 6. Ce nu verifica scriptul

Paginarea si aspectul vizual. Pentru asta ar fi nevoie de conversie in PDF
(LibreOffice). Daca `soffice` nu exista pe masina, spune explicit ca verificarea
a fost structurala, nu vizuala.
