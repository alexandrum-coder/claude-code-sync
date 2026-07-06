# 06 - Avada WooCommerce Rules

Incarca acest fisier doar pentru proiecte e-commerce.

## Obiectiv
Construieste experienta WooCommerce folosind Avada WooCommerce Builder, Woo Design Elements si Layouts, inainte de custom template overrides.

## Zone WooCommerce uzuale
- Shop page
- Product archive
- Single product page
- Cart
- Checkout
- Account
- Thank you page
- Product cards
- Related products

## Reguli
- Pentru single product, foloseste Avada Layouts / WooCommerce Builder.
- Pentru cart si checkout, foloseste elemente WooCommerce native Avada daca sunt disponibile.
- Nu modifica template-uri WooCommerce in child theme decat daca Avada Builder nu poate rezolva cerinta.
- Pastreaza UX-ul simplu: add to cart clar, pret clar, imagini bune, shipping/return info vizibile.
- Pentru produse variabile, verifica afisarea variantelor si Add to Cart.

## Structura single product recomandata
1. Product image/gallery
2. Product title
3. Price
4. Short description
5. Variations daca exista
6. Add to cart
7. Trust badges / delivery info
8. Tabs: description, specs, reviews
9. Related products

## Structura shop/archive recomandata
1. Page title / intro
2. Filters/sidebar daca exista
3. Product grid
4. Sorting
5. Pagination/load more
6. CTA/support block

## Output Claude
Pentru fiecare template WooCommerce, specifica:
- Layout Section folosita
- Conditii de afisare
- Woo elements folosite
- Responsive behavior
- Ce ramane editabil in WP/WooCommerce
