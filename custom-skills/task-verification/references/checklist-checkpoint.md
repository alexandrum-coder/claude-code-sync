# Checklist checkpoint

Se rulează după fiecare pas sau lot terminat, înainte de raportul către utilizator. Fiecare rând primește PASS, WARN, FAIL sau NEVERIFICAT, cu dovadă. Trimiterile `R-NN` trimit la `INDEX.md`.

## Verificări

1. **Pasul făcut corespunde planului.** Nu s-a schimbat tăcut metoda sau scopul. (R-03, R-13)
2. **Dovada este reală.** Starea finală este recitită din sursă după reîncărcare; un mesaj de succes, un cod de răspuns sau un panou nu ajung. (R-90, R-119, R-89)
3. **Nu apare „făcut” pentru ceva planificat.** Raportul separă prin cifre ce este făcut de ce rămâne. (R-118)
4. **O afirmație fără observație directă** poartă marcajul NEVERIFICAT. (R-121, R-122)
5. **Nu s-a adăugat nimic necerut.** Ce s-a observat în plus este notat separat și propus ca întrebare. (R-150, R-03)
6. **Confirmarea este pentru lotul acesta,** nu pentru altul; lotul următor primește cerere nouă. (R-70)
7. **Pilotul a fost aprobat** înainte ca restul lotului să pornească. (R-69)
8. **Nu s-a scris nimic acolo unde nu trebuia.** Dacă pasul era de citire, se dovedește că nu s-a scris nimic. (R-117)
9. **Un eșec aparent sau un timeout** nu a dus la reluarea acțiunii fără citirea stării reale. (R-91)
10. **Jurnalul de stare** este scris pe disc și corespunde stării reale. (R-185)

## R-CLIP-3: ciclul de autoverificare a trecut înainte de raport

Nimic nu se prezintă utilizatorului înainte ca ciclul de autoverificare descris în `preflight` (R-CLIP-1) să fi trecut pe toate cazurile enumerate (R-CLIP-2). O eroare găsită se repară, iar ciclul se reia de la capăt înainte de raport. Repararea se face la sursa defectului, iar fluxul care l-a produs primește o regulă de prevenire. (R-116, R-222, R-88)

- Ciclul nu a rulat sau nu a trecut pe toate cazurile: **STOP** (raportul nu se trimite).
- Ciclul a trecut după una sau mai multe reparații: **GO**, cu numărul de reluări și erorile reparate în raport.
- Ciclul a trecut, dar pe mai puține cazuri decât cele enumerate: **GO-CU-CONDIȚII**, cu cazurile neacoperite numite.

## Verdict

- Orice FAIL dă STOP; WARN și NEVERIFICAT dau GO-CU-CONDIȚII, cu condiția numită.
- GO numai când toate rândurile sunt PASS, cu dovadă, iar R-CLIP-3 este îndeplinită.
