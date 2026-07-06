# 07 - Avada Child Theme, Hooks, Filters si Custom Code

Incarca acest fisier doar cand proiectul cere custom development.

## Regula principala
Nu modifica niciodata direct tema Avada parinte. Orice customizare persistenta se face in child theme sau plugin custom.

## Cand este permis custom code
- Cerinta nu poate fi rezolvata prin Avada Builder / Global Options / Layouts.
- Ai nevoie de logica PHP custom.
- Ai nevoie de integrare API.
- Ai nevoie de shortcode custom justificat.
- Ai nevoie de hooks/actions/filters.
- Ai nevoie de modificare comportament WooCommerce care nu este disponibila in Avada.

## Cand NU este permis custom code
- Styling butoane, titluri, culori, spacing, griduri simple.
- Layouturi de pagina care pot fi facute cu Containers/Columns.
- Cards simple de servicii.
- Header/footer care pot fi facute cu Layouts.
- Formulare simple care pot fi facute cu Avada Forms.

## Format pentru propuneri custom code
Cand propui custom code, explica:
1. Ce cerinta rezolva
2. De ce nu se poate rezolva nativ Avada
3. Unde se pune codul: child theme functions.php, plugin custom, CSS custom etc.
4. Riscuri la update
5. Cum se testeaza
6. Cum se dezactiveaza/rollback

## Checklist siguranta
- Foloseste child theme.
- Fa backup inainte.
- Nu edita fisierele temei parinte.
- Documenteaza orice hook/filter folosit.
- Pastreaza codul minimal.
