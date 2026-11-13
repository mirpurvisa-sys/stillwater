# Stillwater — Funeral & Memorial Care

A responsive React 19 / TypeScript application with Vinext routing, Cloudflare Workers, D1 database persistence, R2 uploads and Sites authentication.

## Getting started

Use Node 22.13+ (Node 24 recommended). Install dependencies with pnpm. Run `pnpm dev` for the local preview. Use `pnpm build` to build. D1 and R2 bindings are declared in `.openai/hosting.json`.

For a new local database, build once, then run:

```sh
node --import ./scripts/sites-env.mjs ./node_modules/wrangler/bin/wrangler.js d1 execute DB --local --config dist/server/wrangler.json --persist-to .wrangler/state --file drizzle/0000_absent_layla_miller.sql
```

Do not replay the same migration on a local database that already has it. Hosted migrations run through Sites publishing. See README.md for the platform starter's operational details.

## Website

- Responsive home page, service descriptions, arrangement options, immediate-help guidance, planning ahead, support articles, about, contact and consultation requests, locations, FAQs, privacy and terms.
- Editable business identity, monitored phone/hours, WhatsApp, social links, service descriptions, package inclusions/exclusions, locations and guidance articles.
- Memorial search and individual pages with biography, photo, service details, time zone, directions, programme, calendar download, optional external livestream/recording and family-selected charity links.
- Share links and locally generated downloadable QR codes. Printable programme and memorial views.
- Condolence submission and review, guest RSVP and accessibility requests, flower enquiries. Sample memorials are explicitly illustrative and cannot accept real submissions.

## Family and staff tools

- Persistent family cases with primary contact, coordinator, cultural preferences, notes and status.
- Family portal: assigned case records, memorial editing, tribute approval/hiding, guests, tasks, schedule, document uploads and approvals, messages, quotes/invoices and CSV export.
- Staff dashboard: case selection, search/status filters, enquiry follow-ups, consultations, memorial publishing, schedules/resources, task responsibility, finance records, content editing, role assignments and audit history.
- Server-side roles: admin, coordinator, finance, family and disabled. Family access is limited to its assigned case. Finance reads cases/invoices and writes invoices. Coordinators cannot edit organisation settings or access grants. Admin manages assignments.
- Overlapping schedules using the same named resource are rejected. Use consistent resource names and confirm time zones.
- Private case uploads: JPG, PNG, WebP, PDF, MP3, WAV or MP4, maximum 10 MB. Uploaded memorial images and approved tribute attachments may be made accessible through the memorial's publication rules; ordinary documents stay restricted.
- Export CSV uses quoted fields and formula-prefix protection. Deletions require confirmation and leave an audit entry. Deleting a record does not cascade to files or associated records.

## Privacy and launch configuration

The deployed site is owner-private. The first authenticated owner is bootstrapped as the application administrator under that private site boundary. **Initialise the owner account before changing site access.** App role assignments do not send invitations or widen Sites access. Additional users must separately be granted site access; then their assigned role/case applies when they sign in. A standalone local run does not simulate Sites login. The tests mock identity only in an isolated test process.

Public memorials are listed, unlisted memorials require their secret link, and private memorials require case/staff access. All visitors still encounter the current owner-private Sites gate. Publishing requires explicit family consent; family edits return memorials to Draft for staff review. Only approved tributes are returned to visitors, without contributor emails. Private case notes, documents and audit entries are excluded from public data.

Messages are persistent in-app case records; recipients see them through their authorised portal. There is no real-time delivery or email/SMS notification. Consultations, flower and transport requests require staff confirmation. Invoices track documents and manually recorded payment status; no funds are collected. External charity, livestream and recording URLs are configured by staff; the app does not host streaming, process donations or execute e-signatures.

Before a public launch, add real branding, monitored contacts, service availability/prices, approved memorial content and final legal/privacy/retention wording. Configure any desired email/SMS, payment, streaming and analytics providers using runtime secrets. Set up operational backups and recovery procedures with the hosting provider. Do not use this preview as an emergency response channel.

## Validation

```sh
node tests/api.test.cjs
node node_modules/typescript/bin/tsc --noEmit
pnpm build
```

API tests execute the actual TypeScript handlers against an isolated real SQLite database with D1/R2 adapters and mocked Sites identity. They cover CRUD persistence, role enforcement, case isolation, consent, public/unlisted/private access, public field filtering, tribute review, RSVP validation, scheduling conflicts, origin checks, protected file access and auditing. Local tests do not verify production identity provisioning or third-party delivery.

Imagery: Unsplash remote image references. Typography: Google Fonts. No fabricated client testimonials or real death notices are included.
