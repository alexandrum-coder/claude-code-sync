---
id: "05"
title_en: Forms & Leads
title_ro: Formulare și lead-uri
load_when_en: The site has a contact form, lead capture, quote request, newsletter opt-in, or spam/GDPR consent needs.
load_when_ro: Site-ul are formular de contact, captare lead-uri, cerere de ofertă, abonare newsletter sau consimțământ GDPR.
task_types: [landing-lead-gen]
depends_on: ["01"]
---

# 05 — Forms & Leads / Formulare și lead-uri

## Rule / Regulă
EN: Use the native **Avada Form Builder** before recommending any 3rd-party form plugin (Contact Form 7, Gravity Forms, WPForms). Only cross over to a 3rd-party plugin if a requirement genuinely cannot be met natively — and say so explicitly.
RO: Folosește nativul **Avada Form Builder** înainte de a recomanda orice plugin 3rd-party de formulare (Contact Form 7, Gravity Forms, WPForms). Treci la un plugin 3rd-party doar dacă o cerință chiar nu poate fi rezolvată nativ — și spune explicit asta.

## What it is / Ce este
EN: **Avada Form Builder** is a dedicated custom post type. Each form is its own post, built with a **Container → Column → Form Element** structure, then inserted into a page via the **Avada Form** design element (or a shortcode/block reference to the form post).
RO: **Avada Form Builder** este un tip de conținut (custom post type) dedicat. Fiecare formular e propriul post, construit cu structura **Container → Column → Element de formular**, apoi inserat într-o pagină prin elementul de design **Avada Form**.

## The 23 Form Elements (verified — research-notes §1d) / Cele 23 de elemente de formular
Used only inside the Form Builder context.

### Inputs / Câmpuri de intrare
Text Field, Textarea Field, Email Field, Phone Number Field, Number Field, Password Field, Date Field, Time Field, Range Field, Upload Field, Hidden Field.

### Choices / Alegeri
Checkbox Field, Radio Field, Select Field, Image Select Field, Rating Field.

### Structure / Steps / Structură / Pași
Form Step, Notice.

### Spam protection / Protecție spam
reCAPTCHA Field (Google), Turnstile Field (Cloudflare), Honeypot Field.

### Consent / Consimțământ
Consent Field.

### Submit / Trimitere
Submit/Button.

| Group / Grup | Elements / Elemente |
|---|---|
| Inputs / Câmpuri | Text Field, Textarea Field, Email Field, Phone Number Field, Number Field, Password Field, Date Field, Time Field, Range Field, Upload Field, Hidden Field |
| Choices / Alegeri | Checkbox Field, Radio Field, Select Field, Image Select Field, Rating Field |
| Structure/Steps / Structură/Pași | Form Step, Notice |
| Spam | reCAPTCHA Field, Turnstile Field, Honeypot Field |
| Consent / Consimțământ | Consent Field |
| Submit / Trimitere | Submit/Button |

## Native capabilities / Capabilități native

| Capability (EN) | Capabilitate (RO) |
|---|---|
| **Multi-step forms** via Form Step element | **Formulare pe mai mulți pași** prin elementul Form Step |
| Field **validation** (required, format) | **Validare** câmpuri (obligatoriu, format) |
| **Conditional logic** (show/hide fields based on answers) | **Logică condițională** (afișare/ascundere câmpuri în funcție de răspunsuri) |
| **Submission actions** / email notifications / confirmations `[verify exact sub-tab labels]` | **Acțiuni la trimitere** / notificări email / confirmări `[verify etichetele exacte]` |
| **Save entries to database** (submissions stored, reviewable in wp-admin) | **Salvare intrări în baza de date** (trimiteri stocate, vizibile în wp-admin) |
| **Spam protection**: reCAPTCHA Field / Turnstile Field / Honeypot Field | **Protecție spam**: reCAPTCHA / Turnstile / Honeypot |
| **GDPR**: Consent Field (per-form) + Privacy & Consent design element (page-level) | **GDPR**: Consent Field (per formular) + elementul de design Privacy & Consent (la nivel de pagină) |
| **Integrations**: Mailchimp, HubSpot — configured once in **Global Options → Forms** (chapter `03`), then attached per form | **Integrări**: Mailchimp, HubSpot — configurate o dată în **Global Options → Forms** (capitolul `03`), apoi atașate per formular |

`[verify]` — the exact labels of the submission-action / confirmation / database sub-tabs inside the Form Builder are not enumerated in the verified research notes. Confirm against avada.com/documentation/avada-form-builder-elements/ and the Form Builder feature page (avada.com/feature/form-builder/) before quoting a literal tab name in a deliverable.

## Newsletter / email opt-in — no separate element / Newsletter — fără element separat
EN: There is **no dedicated "Newsletter" element**. The native path is: an **Avada Form** with an Email Field (+ Consent Field) wired to the mailing list integration configured in **Global Options → Forms → Mailchimp** or **→ HubSpot**. (A "Convert Plus" plugin exists as a 3rd-party alternative only — not required.)
RO: **Nu există un element dedicat "Newsletter"**. Calea nativă: un **Avada Form** cu un Email Field (+ Consent Field) conectat la integrarea de listă de email configurată în **Global Options → Forms → Mailchimp** sau **→ HubSpot**. (Pluginul "Convert Plus" există doar ca alternativă 3rd-party — nu e necesar.)

## GDPR / consent — native path / GDPR — calea nativă
EN: Two native building blocks, use together where legally required:
- **Consent Field** (Form Element) — an explicit opt-in checkbox tied to the form submission itself.
- **Privacy & Consent** (Design Element) — a page-level privacy/consent block, independent of any specific form.
Pair with **Global Options → Privacy** (chapter `03`) for the site-wide cookie/consent bar.
RO: Două blocuri native, folosite împreună unde e cerut legal:
- **Consent Field** (element de formular) — o casetă de bifat explicită pentru consimțământ, legată de trimiterea formularului.
- **Privacy & Consent** (element de design) — un bloc de confidențialitate/consimțământ la nivel de pagină, independent de un formular anume.
Se combină cu **Global Options → Privacy** (capitolul `03`) pentru bara de cookie/consimțământ la nivel de site.

## Decision rule / Regulă de decizie
1. Avada Form covers it → build it natively, no plugin.
2. Need a mailing-list connection → Global Options → Forms → Mailchimp/HubSpot, not a separate newsletter plugin.
3. Need spam protection → reCAPTCHA Field / Turnstile Field / Honeypot Field, not a 3rd-party anti-spam plugin.
4. Need GDPR consent → Consent Field + Privacy & Consent element, not a cookie-plugin-only approach.
5. Only if a hard requirement is unmet by all of the above → propose a 3rd-party form plugin, with written justification.

## Ready lead-form recipe / Rețetă gata de folosit pentru formular de lead

### Form: Lead Capture / Cerere de contact
- **Location / Locație**: Contact page, final CTA section, or a Modal element / Pagina de contact, secțiunea CTA finală, sau un element Modal.
- **Goal / Scop**: capture name, contact details, and a qualifying message from an interested visitor / captarea numelui, datelor de contact și a unui mesaj calificator de la un vizitator interesat.

**Fields (EN) / Câmpuri (RO):**

| Field element | Label EN | Etichetă RO | Required |
|---|---|---|---|
| Text Field | Name | Nume | Yes / Da |
| Email Field | Email | Email | Yes / Da |
| Phone Number Field | Phone | Telefon | Optional / Opțional |
| Textarea Field | Message | Mesaj | Yes / Da |
| Consent Field | I agree to the Privacy Policy | Sunt de acord cu Politica de Confidențialitate | Yes / Da |
| Honeypot Field | (hidden, bot trap) | (ascuns, capcană bot) | — |
| reCAPTCHA Field or Turnstile Field | (spam protection) | (protecție spam) | Yes / Da |
| Submit/Button | Send Message | Trimite mesajul | — |

- **Submission actions / Acțiuni la trimitere**: save entry to database + email notification to admin `[verify exact sub-tab label]` / salvare intrare în baza de date + notificare email către admin `[verify eticheta exactă]`.
- **Confirmation / Confirmare**: on-page thank-you message, e.g. EN "Thanks — we'll get back to you within 1 business day." RO "Mulțumim — revenim cu un răspuns în cel mult 1 zi lucrătoare." `[verify exact confirmation sub-tab label]`.
- **Anti-spam / Anti-spam**: Honeypot Field (silent) + reCAPTCHA Field or Turnstile Field (visible challenge), both native, configured via **Global Options → Forms**.
- **GDPR line (RO)**: "Sunt de acord cu prelucrarea datelor mele conform Politicii de Confidențialitate." — pair with the Consent Field checkbox and link to the site's privacy policy page.

## RO — Rezumat rapid
Formularele se construiesc întâi cu **Avada Form Builder** (custom post type), folosind cele 23 de elemente de formular grupate în: câmpuri de intrare, alegeri, structură/pași, anti-spam, consimțământ, trimitere. Capabilități native: pași multipli (Form Step), validare, logică condițională, acțiuni la trimitere/notificări/confirmări, salvare intrări în bază de date, anti-spam (reCAPTCHA/Turnstile/Honeypot), GDPR (Consent Field + Privacy & Consent), integrări Mailchimp/HubSpot din Global Options → Forms. Nu există element separat de Newsletter — se face cu Avada Form + integrarea de listă de email. Recomandă un plugin 3rd-party de formulare doar dacă o cerință chiar nu poate fi acoperită nativ.
