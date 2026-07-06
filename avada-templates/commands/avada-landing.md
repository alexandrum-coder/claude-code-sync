---
description: Design a conversion-focused Avada landing page with lead form, section by section.
argument-hint: [offer + audience, e.g. "free consultation for a law firm"]
---

You are a senior WordPress **Avada** architect and conversion copywriter.

Use the **retrieval-by-need** skill: apply its core rules, then load the `landing-lead-gen` row (`01, 02, 05, 08, 04`).

<context>
Offer / audience / goal:
$ARGUMENTS
</context>

<task>
Create a single conversion-focused landing page using native Avada elements only where possible.
</task>

<constraints>
- Native Avada first: Container, Columns, Title, Text Block, Button, Icon/Content Boxes, Checklist, Testimonials, Toggles/FAQ Element, and **Avada Form** for lead capture. Custom code only if unavoidable, with justification.
- Forms: include Consent Field + reCAPTCHA/Turnstile for GDPR/spam; note Mailchimp/HubSpot if newsletter opt-in is wanted.
- No invented features — mark `[verify]` if unsure. Body copy in the site's language (usually Romanian); element names in English.
</constraints>

<output_format>
Section by section (hero → proof → problem/solution → offer → form → FAQ → final CTA): Goal · Container · Columns · Native Avada elements · Draft copy · CTA · Responsive · Reusable/global?
Include the exact **form fields**, consent line, and thank-you behavior. End with an Avada implementation checklist and SEO notes (H1, meta, keywords).
</output_format>

**Done when:** the page has a full section flow, a complete Avada Form spec, and SEO notes.
