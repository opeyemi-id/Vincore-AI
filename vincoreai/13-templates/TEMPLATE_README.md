# Vincore AI — VDF Document Template System

**Version:** 1.0  
**Last Updated:** July 2026  
**Classification:** Internal — Vincore AI Use Only

---

## What This Is

This folder contains the template system for building all 30 Vincore Delivery Framework (VDF) documents for any new client engagement. The system is based on the MBH project (VAI-CLI-MBH-001), Vincore AI's first completed Full System engagement.

The principle is simple: **one config file → 30 documents.**

Edit `client_config.json` with the new client's details. Run `build_all.sh`. All 30 documents are built with the correct client name, project code, fee, dates, and document IDs throughout.

---

## Quick Start — New Client

```bash
# 1. Set up the project structure
./setup_new_client.sh
# → Enter project code: VAI-CLI-XYZ-001
# → Enter client name:  Acme Consulting
# → Enter short code:   XYZ

# 2. Add client logo
cp /path/to/logo.jpeg ./09-client-projects/[client]/assets/client_logo.jpeg

# 3. Fill in client details
open ./09-client-projects/[client]/client_config.json

# 4. Build all 30 documents
cd ./09-client-projects/[client]
./build_all.sh

# → All files appear in ./output/
```

---

## Files in This Folder

| File | Purpose |
|---|---|
| `client_config.json` | Master config file — the only file to edit per client |
| `config_loader.js` | Node.js helper — imported by all JS build scripts |
| `config_loader.py` | Python helper — imported by all Python build scripts |
| `build_all.sh` | Runs all 30 build scripts in the correct VDF sequence |
| `setup_new_client.sh` | Creates project folder structure for a new client |
| `build_proposal_template.js` | Reference implementation: JS build script using config |
| `build_gantt_template.py` | Reference implementation: Python build script using config |
| `TEMPLATE_README.md` | This file |
| `TEMPLATE_SUBSTITUTIONS.md` | Per-script substitution guide |

---

## The Config File — `client_config.json`

Every field marked `[PLACEHOLDER]` must be filled in before building. The config loader automatically warns you about any unfilled fields before a build runs.

### Key Fields

```json
{
  "client": {
    "business_name": "Acme Consulting",          ← client name in all docs
    "contact_name":  "Jane Doe",                 ← signatory name
    "email":         "jane@acme.com",
    "location":      "Victoria Island, Lagos"
  },
  "project": {
    "code":          "VAI-CLI-ACM-001",          ← prefix for all doc IDs
    "name":          "Revenue Systems Implementation",
    "fee_total":     "₦650,000",
    "start_date":    "August 2026"
  }
}
```

---

## How the Config System Works

### In Node.js (Word + PowerPoint scripts)

```javascript
const C = require('./config_loader');  // ← add this line

// Then replace every hardcoded value:
run('My Beauty Haven')        // OLD
run(C.CLIENT)                 // NEW — reads from config

run('VAI-CLI-MBH-001')        // OLD
run(C.CODE)                   // NEW

run('₦500,000')               // OLD
run(C.FEE)                    // NEW

run('Onyinye Obiozor')        // OLD
run(C.CONTACT)                // NEW

// Output filename (auto-generated from config):
const outFile = path.join(C.OUT, C.filename('prop', 'docx', 'Proposal'));
// → ./output/VAI-CLI-ACM-001-PRP_Proposal_v1.0.docx
```

### In Python (Excel scripts)

```python
from config_loader import C  # ← add this line

# Then replace every hardcoded value:
'My Beauty Haven'     # OLD
C['CLIENT']           # NEW

'VAI-CLI-MBH-001'     # OLD
C['CODE']             # NEW

'₦500,000'            # OLD
C['FEE']              # NEW
```

---

## Converting an Existing Script

Every build script from the MBH project can be converted to a template in three steps:

### Step 1 — Add the config import (top of file)

**JS scripts:**
```javascript
const C = require('./config_loader');
```

**Python scripts:**
```python
from config_loader import C
```

### Step 2 — Replace all MBH-specific values

Use the substitution table in `TEMPLATE_SUBSTITUTIONS.md`. The core substitutions are:

| Find (hardcoded MBH value) | Replace with |
|---|---|
| `'My Beauty Haven'` | `C.CLIENT` (JS) or `C['CLIENT']` (Py) |
| `'Onyinye Obiozor'` | `C.CONTACT` |
| `'mybeautyhaven@gmail.com'` | `C.EMAIL` |
| `'VAI-CLI-MBH-001'` | `C.CODE` |
| `'Booking Automation & CRM Implementation'` | `C.NAME` |
| `'₦500,000'` | `C.FEE` |
| `'₦250,000'` (deposit) | `C.DEPOSIT` |
| `'₦250,000'` (balance) | `C.BALANCE` |
| `'Yaba, Lagos, Nigeria'` | `C.LOCATION` |
| `'June 2026'` | `C.MONTH` |
| `'mybeautyhaven.ng'` | `C.WEBSITE` |
| `'Day 14, July 2026'` | `C.GOLIVE` |
| `'opeyemi@vincoreai.com'` | `C.vincore.email` |

### Step 3 — Update the output path

```javascript
// OLD
fs.writeFileSync('/home/claude/VAI-CLI-MBH-001_Proposal_v1.0.docx', buf);

// NEW
const outFile = path.join(C.OUT, C.filename('prop', 'docx', 'Proposal'));
Packer.toBuffer(doc).then(buf => fs.writeFileSync(outFile, buf));
```

---

## Document ID System

The project code in config (`VAI-CLI-XYZ-001`) automatically prefixes all 30 document IDs. The config loader resolves them:

```
config: "project.code": "VAI-CLI-ACM-001"

→ Documents:
   VAI-CLI-ACM-001-CDR     Client Discovery Report
   VAI-CLI-ACM-001-PRD     Project Requirements Document
   VAI-CLI-ACM-001-PRP     Proposal
   VAI-CLI-ACM-001-SA      Service Agreement
   ... (all 30 auto-resolved)
```

---

## Document Conversion Status

The table below tracks which build scripts have been converted to use the config system. Scripts marked ✅ use `C.*` references throughout. Scripts marked 🔄 still use hardcoded MBH values and need the substitutions applied.

| # | Script | Status | Priority |
|---|---|---|---|
| 1 | build_cdr.js | 🔄 Needs conversion | High |
| 2 | build_prd.js | 🔄 Needs conversion | High |
| 3 | build_proposal.js | ✅ Reference template | Done |
| 4 | build_agreement.js | 🔄 Needs conversion | High |
| 5 | build_nda.js | 🔄 Needs conversion | Medium |
| 6 | build_invoice.js | 🔄 Needs conversion | High |
| 7 | build_charter.js | 🔄 Needs conversion | High |
| 8 | build_kickoff.js | 🔄 Needs conversion | Medium |
| 9 | build_pptx.js | 🔄 Needs conversion | Medium |
| 10 | build_pmp.js | 🔄 Needs conversion | High |
| 11 | build_gantt.py | ✅ Reference template | Done |
| 12 | build_raid.py | 🔄 Needs conversion | Medium |
| 13 | build_crf.js | 🔄 Needs conversion | Low |
| 14 | build_ar.js | 🔄 Needs conversion | High |
| 15 | build_sdd.js | 🔄 Needs conversion | High |
| 16 | build_buildlog.js | 🔄 Needs conversion | Medium |
| 17 | build_tvr.js | 🔄 Needs conversion | High |
| 18 | build_dc.js | 🔄 Needs conversion | Low |
| 19 | build_glc.js | 🔄 Needs conversion | Low |
| 20 | build_om.js | 🔄 Needs conversion | High |
| 21 | build_training.js | 🔄 Needs conversion | Medium |
| 22 | build_wsr.js | 🔄 Needs conversion | Medium |
| 23 | build_cor.js | 🔄 Needs conversion | Medium |
| 24 | build_hd.js | 🔄 Needs conversion | Medium |
| 25 | build_caf.js | 🔄 Needs conversion | Medium |
| 26 | build_cc.js | 🔄 Needs conversion | Low |
| 27 | build_invoice2.js | 🔄 Needs conversion | High |
| 28 | build_map.js | 🔄 Needs conversion | Medium |
| 29 | build_brr.js | 🔄 Needs conversion | Low |
| 30 | build_tr.js | 🔄 Needs conversion | Low |

**Conversion priority — convert these first (used in every engagement):**
Proposal, Service Agreement, CDR, PRD, PMP, Assessment Report, SDD, Operations Manual, TVR, Final Invoice.

---

## What Changes Per Document Type

### Documents with LOW editing effort (mostly structural)

These only need the config substitutions — the content is largely fixed:

- NDA, Change Request Form, Deployment Checklist, Go-Live Checklist
- Completion Certificate, Client Acceptance Form, Testimonial Request Letter

### Documents with MEDIUM editing effort (structure fixed, some content customised)

- Project Charter, Kickoff Agenda & Minutes, Project Management Plan
- Build Log, Weekly Status Report, Project Close-Out Report, Handover Document

### Documents with HIGH editing effort (content specific to each client)

These require both config substitutions AND updating the actual content (client's industry, business problems, system components, gap analysis, workflow descriptions):

- Client Discovery Report, Project Requirements Document
- Assessment Report, Solution Design Document, Operations Manual
- Marketing Asset Pack, Benefits Realization Report

For high-effort documents, think of the MBH version as a **structure template** — the sections, headings, and tables stay the same. Only the content inside them changes.

---

## Project Naming Convention

```
Project Code:  VAI-CLI-[3-LETTER-CODE]-[NNN]
               VAI  = Vincore AI
               CLI  = Client engagement
               XYZ  = 3-letter client identifier
               001  = Engagement number

Document IDs:  [PROJECT_CODE]-[DOC_CODE]
               e.g. VAI-CLI-ACM-001-CDR

Invoice IDs:   VAI-INV-[NNN]
               Sequential across all clients
               e.g. VAI-INV-003 (if MBH used 001 and 002)
```

---

## Vertical Templates

After the MBH project, the following vertical-specific templates should be created:

### Beauty Studio System (based on MBH)
- Airtable schema: Clients, Bookings, Staff, Inventory (pre-configured)
- Zapier workflows: 6 standard workflows (pre-built)
- Website: Booking site template with service cards
- Operations Manual: Beauty-specific SOP templates
- **Status:** In progress — extract from MBH build scripts

### Engineering / Construction Firm (future)
- To be developed after first engineering client

### Consulting / Professional Services (future)
- To be developed after first consulting client

---

## Folder Structure (GitHub)

```
vincoreai/
├── 00-admin/                    ← Firm-level governance
├── 01-brand/                    ← Brand assets and style guide
├── 02-service-catalogue/        ← Service offerings
├── 03-icp-profiles/             ← Ideal client profiles
├── 04-pricing/                  ← Pricing models
├── 05-vdf-framework/            ← 30-document VDF definition
├── 06-legal-templates/          ← Master SA, NDA templates
├── 07-financial-models/         ← Revenue models and trackers
├── 08-tools-and-systems/        ← Tech stack documentation
├── 09-client-projects/          ← One folder per client
│   └── Nigeria/
│       └── NG-my-beauty-haven/ ← MBH project (complete)
│           └── PRJ-001/
│               ├── client_config.json
│               ├── build_all.sh
│               ├── build_*.js / .py
│               ├── output/         ← 30 documents
│               └── [05 phase folders]/
├── 10-case-studies/             ← Published case studies
├── 11-marketing/                ← LinkedIn content, web copy
├── 12-knowledge-base/           ← CLAUDE.md, Vincore Brain
└── 13-templates/                ← THIS FOLDER (template system)
    ├── client_config.json
    ├── config_loader.js
    ├── config_loader.py
    ├── build_all.sh
    ├── setup_new_client.sh
    ├── TEMPLATE_README.md       ← This file
    └── TEMPLATE_SUBSTITUTIONS.md
```

---

*This template system is itself a deliverable of Project VAI-CLI-MBH-001. It was built and validated during that engagement. Every subsequent client makes it more valuable.*
