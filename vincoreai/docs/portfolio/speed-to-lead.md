# Case study: Speed-to-Lead Automation System

**Client (simulated):** SwiftFix Home Services  
**Industry:** HVAC / Home Services  
**Service category:** Revenue Systems  
**Tools:** Typeform, Zapier, Airtable, Slack, Gmail

---

## The problem

SwiftFix Home Services was receiving inbound service requests through their website contact form. The requests were going to a shared Gmail inbox where they sat — sometimes for hours — before anyone followed up.

By the time the team called back, a significant number of leads had already booked with a competitor. Emergency jobs (broken AC in summer, heating failures in winter) were being treated the same as routine maintenance requests with no way to prioritise.

**Key pain points:**
- No instant response to lead submissions
- No lead prioritisation (emergency vs routine)
- Duplicate submissions from the same customer going undetected
- No visibility into lead volume or response time
- Owner manually checking email and assigning jobs

---

## The solution

A fully automated speed-to-lead system built across Typeform, Zapier, Airtable, and Slack.

**How it works:**

1. Customer fills out a Typeform with service type, urgency level, and contact details
2. Zapier picks up the submission and runs a duplicate detection check in Airtable
3. If new: lead is written to Airtable with auto-calculated priority score based on urgency and service type
4. Slack alert fires to the correct channel (emergency jobs → #urgent-jobs, routine → #service-queue)
5. Automated email confirmation sent to customer within 2 minutes of submission
6. Airtable dashboard updated in real time for manager visibility

**Duplicate handling:** If the same email submits within 48 hours, Zapier detects it via Airtable lookup and routes to a separate #duplicates channel rather than creating a new record.

---

## The result

- Lead response time reduced from 4+ hours to under 2 minutes
- Emergency jobs now surface immediately and separately from routine requests
- Zero duplicate records in the Airtable CRM
- Owner no longer manually checking email for service requests
- Full lead history visible in Airtable dashboard at all times

---

## Tools breakdown

| Tool | Role |
|---|---|
| Typeform | Lead capture form (service type, urgency, contact info) |
| Zapier | Automation engine — connects all tools, runs logic |
| Airtable | CRM and lead database, priority scoring formula |
| Slack | Real-time team alerts by urgency level |
| Gmail | Automated customer confirmation email |

---

## Reuse potential

This system architecture is directly replicable for:
- Any home service contractor (plumbing, electrical, roofing, landscaping)
- Any business with inbound form submissions needing fast follow-up
- Real estate lead capture with routing to specific agents
