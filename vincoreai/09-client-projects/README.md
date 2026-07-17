# 09 Client Projects

One subfolder per client, organised by geography. Every project follows the VDF (Vincore Delivery Framework).

---

## Geography Structure

```
09-client-projects/
├── Nigeria/
├── United-States/
├── Canada/
├── United-Kingdom/
├── Australia/
├── Europe/
├── Middle-East/
└── Other/
```

---

## Client Folder Naming

```
[COUNTRY CODE]-[CLIENT NAME]
```

Examples:
- `NG-Meridian-Properties`
- `US-SwiftFix-HVAC`
- `CA-Toronto-Realty-Group`

---

## Project Folder Structure (VDF)

Every project inside a client folder follows this structure:

```
[COUNTRY]-[CLIENT]/
└── PRJ-001-[Project Name]/
    ├── 01-Initiate/
    │   ├── Client-Information/
    │   ├── Opportunity-Documents/
    │   ├── Commercials/
    │   ├── Kick-off/
    │   └── Governance/
    ├── 02-Plan/
    │   ├── Project-Planning/
    │   ├── Schedule/
    │   ├── Resources/
    │   ├── Risks/
    │   └── Reporting/
    ├── 03-Assess-and-Design/
    │   ├── Assessment/
    │   ├── Business-Analysis/
    │   ├── Solution-Design/
    │   └── Technical-Design/
    ├── 04-Execute/
    │   ├── Build/
    │   ├── Testing/
    │   ├── Deployment/
    │   ├── Training/
    │   └── Support/
    ├── 05-Close/
    │   ├── Project-Closure/
    │   ├── Financial-Closure/
    │   ├── Knowledge-Capture/
    │   └── Marketing-Assets/
    └── README.md
```

---

## Document Naming in Client Projects

```
CLI-[CLIENT CODE]-[NUMBER]_[ClearTitle]_vX.X.[extension]
```

Examples:
- `CLI-SPA-001_Proposal_v1.0.docx`
- `CLI-SPA-002_DiscoveryNotes_v1.0.docx`
- `CLI-SPA-003_AutomationFlow_v1.0.pdf`

---

## Rule

No project is complete until the Marketing Assets subfolder in 05-Close contains at minimum:
- A case study draft
- A LinkedIn post draft
- Before and after metrics (even if estimated)
