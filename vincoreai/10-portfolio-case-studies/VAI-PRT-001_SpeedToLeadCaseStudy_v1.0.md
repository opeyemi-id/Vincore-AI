# VAI-PRT-001 Speed-to-Lead Automation System — Case Study
**Version:** 1.0 | **Owner:** Opeyemi Idonuagbe | **Status:** Active

---

## Project Overview

**Client (simulated):** SwiftFix Home Services
**Industry:** HVAC / Home Services
**Service category:** Revenue Systems
**Tools:** Typeform, Zapier, Airtable, Slack, Gmail

---

## The Challenge

SwiftFix Home Services was receiving inbound service requests through their website contact form. The requests went to a shared Gmail inbox where they sat, sometimes for hours, before anyone followed up.

By the time the team called back, a significant number of leads had already booked with a competitor. Emergency jobs were being treated the same as routine maintenance requests with no way to prioritise.

**Key pain points:**
- No instant response to lead submissions
- No lead prioritisation (emergency vs routine)
- Duplicate submissions going undetected
- No visibility into lead volume or response time
- Owner manually checking email and assigning jobs

---

## The Action

A fully automated speed-to-lead system built across Typeform, Zapier, Airtable, and Slack.

**How it works:**
1. Customer fills out a Typeform with service type, urgency level, and contact details
2. Zapier picks up the submission and runs a duplicate detection check in Airtable
3. If new: lead is written to Airtable with auto-calculated priority score
4. Slack alert fires to the correct channel (emergency → #urgent-jobs, routine → #service-queue)
5. Automated email confirmation sent to customer within 2 minutes
6. Airtable dashboard updated in real time

**Duplicate handling:** If the same email submits within 48 hours, Zapier detects it and routes to a separate #duplicates channel.

---

## The Result

- Lead response time reduced from 4+ hours to under 2 minutes
- Emergency jobs surface immediately and separately from routine requests
- Zero duplicate records in the Airtable CRM
- Owner no longer manually checking email for service requests
- Full lead history visible in Airtable dashboard at all times

---

## Tools Breakdown

| Tool | Role |
|---|---|
| Typeform | Lead capture form |
| Zapier | Automation engine |
| Airtable | CRM and lead database |
| Slack | Real-time team alerts |
| Gmail | Automated customer confirmation |

---

## Reuse Potential

Directly replicable for any home service contractor, real estate lead capture, or any business with inbound form submissions needing fast follow-up.
