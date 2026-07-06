---
id: "06"
title_en: WooCommerce
title_ro: WooCommerce / magazin online
load_when_en: The project includes an online store — shop/archive, single product, cart, checkout, my account, filters.
load_when_ro: Proiectul include magazin online — shop, produs, coș, checkout, cont, filtre.
task_types: [woocommerce-shop]
depends_on: ["09", "01"]
---

# 06 — WooCommerce / Magazin online

> Requires **WooCommerce** plugin. Everything in this chapter is gated behind an active WooCommerce install.
> Necesită pluginul **WooCommerce** activ. Tot ce urmează depinde de acesta.

## Rule / Regulă
EN: Build every WooCommerce template — Shop, Single Product, Cart, Checkout, My Account — with **Avada Layouts + Layout Sections + Woo Elements** (the "Avada WooCommerce Builder"). Avoid overriding WooCommerce PHP templates in a child theme unless a requirement truly cannot be met natively — if that happens, move to chapter `07` for the child-theme/hooks path, with written justification.
RO: Construiește fiecare șablon WooCommerce — Shop, Produs unic, Coș, Checkout, Contul meu — cu **Avada Layouts + Layout Sections + Woo Elements** ("Avada WooCommerce Builder"). Evită suprascrierea template-urilor PHP WooCommerce într-un child theme decât dacă o cerință chiar nu poate fi rezolvată nativ — iar atunci treci la capitolul `07`, cu justificare scrisă.

## How it works / Cum funcționează
EN: The WooCommerce Builder is not a separate tool — it's the same **Avada Layouts** mechanism (chapter `09`) applied to Woo-specific Layout Sections, populated with the 38 native **Woo Elements** instead of generic Design Elements. A **Layout** made of Layout Sections is assigned to a WooCommerce location (shop archive, single product, cart, checkout, account) via **Conditions**.
RO: WooCommerce Builder nu e un instrument separat — e același mecanism **Avada Layouts** (capitolul `09`) aplicat pe Layout Sections specifice Woo, populate cu cele 38 de **Woo Elements** native în loc de Elemente de design generice. Un **Layout** compus din Layout Sections este atribuit unei locații WooCommerce (arhivă shop, produs unic, coș, checkout, cont) prin **Conditions**.

## Template areas it builds / Zone de șablon construite
Product Archive/Shop · Single Product · Cart · Checkout · My Account (per research-notes §8).

## The 38 Woo Elements, grouped by template area (verified — research-notes §1b)
### Cart / Coș
Cart Coupons, Cart Shipping, Cart Table, Cart Totals, Mini Cart.

### Checkout
Checkout Billing, Checkout Order Review, Checkout Payment, Checkout Shipping, Checkout Tabs.

### Product / Single Product / Produs unic
Woo Add To Cart, Additional Info, Price, Product Images, Rating, Related Products, Reviews, Short Description, Stock, Tabs, Up/Cross-sells.

### Archive / Filters / Arhivă / Filtre
Featured Products Slider, Filter Active, Filter By Attribute, Filter By Brand, Filter By Category, Filter By Price, Filter By Rating, Product Carousel, Product Grid, Sorting.

### Order / My Account / Cont
Customer Order Details, Order Additional Info, Order Details, Order Downloads, Order Table.

### Cross-cutting / Transversale
Notices, Shortcodes.

| Area / Zonă | Elements / Elemente |
|---|---|
| Cart / Coș | Cart Coupons, Cart Shipping, Cart Table, Cart Totals, Mini Cart |
| Checkout | Checkout Billing, Checkout Order Review, Checkout Payment, Checkout Shipping, Checkout Tabs |
| Product/Single / Produs unic | Woo Add To Cart, Additional Info, Price, Product Images, Rating, Related Products, Reviews, Short Description, Stock, Tabs, Up/Cross-sells |
| Archive/Filters / Arhivă/Filtre | Featured Products Slider, Filter Active, Filter By Attribute, Filter By Brand, Filter By Category, Filter By Price, Filter By Rating, Product Carousel, Product Grid, Sorting |
| Order/Account / Comandă/Cont | Customer Order Details, Order Additional Info, Order Details, Order Downloads, Order Table |
| Cross-cutting / Transversale | Notices, Shortcodes |

## Filters (shop-page filtering) / Filtre (filtrare pagină shop)
EN: Build shop-page filtering with the native Filter elements: **Filter By Attribute**, **Filter By Brand**, **Filter By Category**, **Filter By Price**, **Filter By Rating**, plus **Filter Active** to show/clear the currently applied filters. Place these as a filter bar or sidebar Layout Section on the Product Archive/Shop layout.
RO: Construiește filtrarea paginii de shop cu elementele native de filtrare: **Filter By Attribute**, **Filter By Brand**, **Filter By Category**, **Filter By Price**, **Filter By Rating**, plus **Filter Active** pentru a afișa/șterge filtrele aplicate. Plasează-le ca bară de filtre sau Layout Section de tip sidebar pe layout-ul Product Archive/Shop.

## Global Options → WooCommerce / Global Options → WooCommerce
EN: Site-wide Woo defaults live in **Global Options → WooCommerce** (chapter `03`): products per page, grid columns, general shop styling. Set defaults here first; use Layout Sections + Woo Elements only where a template area needs to differ from the default.
RO: Setările implicite Woo la nivel de site stau în **Global Options → WooCommerce** (capitolul `03`): produse pe pagină, coloane grid, stil general shop. Setează implicitul aici întâi; folosește Layout Sections + Woo Elements doar unde o zonă de șablon trebuie să difere de implicit.

`[verify]` — exact option labels inside Global Options → WooCommerce (e.g. specific field names for "products per page" / "columns") are not itemized in the verified research notes; confirm against avada.com/documentation/avada-global-options/ before quoting a literal label.

## Recommended structure per template area / Structură recomandată per zonă de șablon

### Single Product / Produs unic
1. Product Images
2. Product Title (Title element)
3. Price
4. Rating
5. Short Description
6. Woo Add To Cart
7. Additional Info / Stock
8. Tabs (description, specs, reviews)
9. Related Products / Up/Cross-sells

### Shop / Archive
1. Page title / intro (Title / Page Title Bar Layout Section)
2. Filter bar: Filter By Category/Attribute/Brand/Price/Rating + Filter Active
3. Product Grid (or Product Carousel for a featured subset)
4. Sorting
5. Pagination (Layout Element, chapter `09`)

### Cart
1. Cart Table
2. Cart Coupons
3. Cart Shipping
4. Cart Totals
5. Mini Cart (in header, site-wide)

### Checkout
1. Checkout Tabs (if multi-step)
2. Checkout Billing
3. Checkout Shipping
4. Checkout Payment
5. Checkout Order Review

### My Account
1. Order Table / Order Details
2. Customer Order Details
3. Order Additional Info
4. Order Downloads

## Decision rule / Regulă de decizie
1. Does a native Woo Element cover this template area? → use it inside a Layout Section.
2. Does Global Options → WooCommerce cover the site-wide default? → set it there.
3. Is a Layout condition needed to scope it (e.g. only a product category)? → use Avada Layouts Conditions (chapter `09`).
4. Only if WooCommerce Builder + Woo Elements + Global Options genuinely cannot meet the requirement → consider a child-theme WooCommerce PHP template override, documented in chapter `07` with written justification.

## RO — Rezumat rapid
Avada WooCommerce Builder = Avada Layouts + Layout Sections + cele 38 de Woo Elements, aplicate pe: Product Archive/Shop, Single Product, Cart, Checkout, My Account. Elementele sunt grupate pe zonă: coș, checkout, produs/single, arhivă/filtre, comandă. Filtrarea shop-ului se face cu Filter By Attribute/Brand/Category/Price/Rating + Filter Active. Setările implicite (produse pe pagină, coloane, stil) stau în Global Options → WooCommerce. Regulă: construiește prin Avada Layouts + Woo Elements; evită suprascrierea template-urilor PHP WooCommerce într-un child theme decât dacă e cu adevărat imposibil nativ — atunci vezi capitolul 07.
