# Vincore AI — Template Substitution Reference

This file lists every hardcoded MBH-specific value that must be replaced
with a `C.*` config reference when converting a build script to a template.

**Rule:** Find the MBH value → Replace with the config reference shown.

---

## Universal Substitutions (apply to ALL 30 scripts)

| MBH Hardcoded Value | Config Reference (JS) | Config Reference (Python) |
|---|---|---|
| `'My Beauty Haven'` | `C.CLIENT` | `C['CLIENT']` |
| `'Onyinye Obiozor'` | `C.CONTACT` | `C['CONTACT']` |
| `'Owner, My Beauty Haven'` | `C.client.contact_role` | `C['client']['contact_role']` |
| `'mybeautyhaven@gmail.com'` | `C.EMAIL` | `C['EMAIL']` |
| `'09074885750'` | `C.PHONE` | `C['PHONE']` |
| `'Yaba, Lagos, Nigeria'` | `C.LOCATION` | `C['LOCATION']` |
| `'mybeautyhaven.ng'` | `C.WEBSITE` | `C['WEBSITE']` |
| `'VAI-CLI-MBH-001'` | `C.CODE` | `C['CODE']` |
| `'Booking Automation & CRM Implementation'` | `C.NAME` | `C['NAME']` |
| `'June 2026'` | `C.MONTH` | `C['MONTH']` |
| `'July 2026'` | `C.MONTH` | `C['MONTH']` |
| `'1.0'` (version) | `C.VERSION` | `C['VERSION']` |
| `'opeyemi@vincoreai.com'` | `C.vincore.email` | `C['vincore']['email']` |
| `'vincoreai.com'` | `C.vincore.website` | `C['vincore']['website']` |
| `'Lagos, Nigeria'` (Vincore) | `C.vincore.location` | `C['vincore']['location']` |
| `'AI Consulting & Revenue Systems'` | `C.vincore.tagline` | `C['vincore']['tagline']` |

---

## Commercial Substitutions

| MBH Hardcoded Value | Config Reference (JS) | Config Reference (Python) |
|---|---|---|
| `'₦500,000'` (total fee) | `C.FEE` | `C['FEE']` |
| `'₦250,000'` (deposit) | `C.DEPOSIT` | `C['DEPOSIT']` |
| `'₦250,000'` (balance) | `C.BALANCE` | `C['BALANCE']` |
| `'₦'` (currency symbol) | `C.CURRENCY` | `C['CURRENCY']` |
| `'₦5,000'` (booking deposit) | `C.commercial.booking_deposit` | `C['commercial']['booking_deposit']` |
| `'₦2,000'` (referral reward) | `C.commercial.referral_reward` | `C['commercial']['referral_reward']` |
| `'VAI-INV-001'` | `C.commercial.invoice_deposit_no` | `C['commercial']['invoice_deposit_no']` |
| `'VAI-INV-002'` | `C.commercial.invoice_final_no` | `C['commercial']['commercial']['invoice_final_no']` |
| `'50%'` | `C.commercial.deposit_pct + '%'` | `C['commercial']['deposit_pct'] + '%'` |

---

## Date Substitutions

| MBH Hardcoded Value | Config Reference (JS) |
|---|---|
| `'June 2026'` | `C.MONTH` |
| `'Day 14, July 2026'` | `C.GOLIVE` |
| `'Day 0'` (start) | `C.START` |
| `'Late June – Early July 2026'` | `C.START + ' – ' + C.END` |
| `'Day 1'`, `'Day 2'` etc. | Keep as-is — these are relative project days, not dates |

---

## Document ID Substitutions

| MBH Document ID | Config Reference (JS) |
|---|---|
| `'VAI-CLI-MBH-001-CDR'` | `C.docs.cdr` |
| `'VAI-CLI-MBH-001-PRD'` | `C.docs.prd` |
| `'VAI-CLI-MBH-001-PRP'` | `C.docs.prop` |
| `'VAI-CLI-MBH-001-SA'` | `C.docs.sa` |
| `'VAI-CLI-MBH-001-NDA'` | `C.docs.nda` |
| `'VAI-INV-001'` | `C.docs.inv1` |
| `'VAI-CLI-MBH-001-PC'` | `C.docs.charter` |
| `'VAI-CLI-MBH-001-KOM'` | `C.docs.kom` |
| `'VAI-CLI-MBH-001-KP'` | `C.docs.kp` |
| `'VAI-CLI-MBH-001-PMP'` | `C.docs.pmp` |
| `'VAI-CLI-MBH-001-PS'` | `C.docs.gantt` |
| `'VAI-CLI-MBH-001-RAID'` | `C.docs.raid` |
| `'VAI-CLI-MBH-001-CRF'` | `C.docs.crf` |
| `'VAI-CLI-MBH-001-AR'` | `C.docs.ar` |
| `'VAI-CLI-MBH-001-SDD'` | `C.docs.sdd` |
| `'VAI-CLI-MBH-001-BL'` | `C.docs.bl` |
| `'VAI-CLI-MBH-001-TVR'` | `C.docs.tvr` |
| `'VAI-CLI-MBH-001-DC'` | `C.docs.dc` |
| `'VAI-CLI-MBH-001-GLC'` | `C.docs.glc` |
| `'VAI-CLI-MBH-001-OM'` | `C.docs.om` |
| `'VAI-CLI-MBH-001-TS'` | `C.docs.ts` |
| `'VAI-CLI-MBH-001-WSR-001'` | `C.docs.wsr` |
| `'VAI-CLI-MBH-001-COR'` | `C.docs.cor` |
| `'VAI-CLI-MBH-001-HD'` | `C.docs.hd` |
| `'VAI-CLI-MBH-001-CAF'` | `C.docs.caf` |
| `'VAI-CLI-MBH-001-CC'` | `C.docs.cc` |
| `'VAI-INV-002'` | `C.docs.inv2` |
| `'VAI-CLI-MBH-001-MAP'` | `C.docs.map` |
| `'VAI-CLI-MBH-001-BRR'` | `C.docs.brr` |
| `'VAI-CLI-MBH-001-TR'` | `C.docs.tr` |

---

## Output Path Substitutions

### JS scripts — end of each build script

```javascript
// OLD (hardcoded path):
Packer.toBuffer(doc).then(buf => {
  fs.writeFileSync('/home/claude/VAI-CLI-MBH-001_ClientDiscoveryReport_v1.0.docx', buf);
  console.log('Created');
});

// NEW (uses config):
const outFile = path.join(C.OUT, C.filename('cdr', 'docx', 'ClientDiscoveryReport'));
Packer.toBuffer(doc).then(buf => {
  fs.writeFileSync(outFile, buf);
  console.log(`✓  Built: ${outFile}`);
});
```

### Python scripts — end of each build script

```python
# OLD:
wb.save('/home/claude/VAI-CLI-MBH-001_ProjectSchedule_v1.0.xlsx')

# NEW:
import os
os.makedirs(C['OUT'], exist_ok=True)
out_path = os.path.join(C['OUT'], C['filename']('gantt', 'xlsx', 'ProjectSchedule'))
wb.save(out_path)
print(f'✓  Built: {out_path}')
```

---

## Logo Substitution

### JS scripts

```javascript
// OLD:
const mbhLogo = fs.readFileSync('/home/claude/mbh_logo.jpeg');
// ... used as:
new ImageRun({data:mbhLogo, ...})

// NEW:
const clientLogo = C.logo();  // returns null if logo file not found
// ... used as:
...(clientLogo ? [new Paragraph({children:[new ImageRun({data:clientLogo,...})]})] : [blank(200)])
```

---

## Header/Footer Substitutions

The running header and footer in every document reference:
- `'VINCORE AI  |  Internal — Confidential'` → Keep as-is (Vincore AI is constant)
- `'VAI-CLI-MBH-001  |  [Doc Title]'` → `` `${C.CODE}  |  [Doc Title]` ``
- `'My Beauty Haven  |  Booking Automation...'` → `` `${C.CLIENT}  |  ${C.NAME}` ``

---

## Content That Does NOT Change Between Clients

The following content is structural — it does not need substitution:

- All VDF section headings and subsection structure
- All table column headers
- All checkbox labels and checklist item formats
- All signature block labels (VINCORE AI, CLIENT etc.)
- All process logic (booking flow steps, RACI categories, defect severity levels)
- Brand colors (NAVY, BLUE, CYAN etc.)
- All legal clause structures (SA, NDA)
- All SOP step formats
- Milestone numbering (M1–M8)
- WBS numbering format
- Risk rating methodology (likelihood × impact)

---

## Content That MUST Be Updated Per Client (beyond config)

These items require manual editing even after config substitution:

| Document | Content to Update Manually |
|---|---|
| CDR | Business description, pain points, current operations, tools audit |
| PRD | Specific business requirements (BR-001 etc.), acceptance criteria |
| Assessment Report | Current state ratings, gap analysis (G-001 etc.), technology audit |
| SDD | Website architecture, CRM schema, workflow logic, integration specs |
| Operations Manual | Platform-specific SOPs, FAQ answers, troubleshooting scenarios |
| Project Charter | Project objectives, specific assumptions, project-specific risks |
| Marketing Asset Pack | Case study narrative, before/after metrics, LinkedIn post stories |
| Training Slides | Platform screenshots, system-specific walkthrough steps |

For the Beauty vertical, most of the above is already done — see the MBH templates.
For a new vertical, plan 2–4 additional hours per document listed above.

---

*Last updated: July 2026 — based on Project VAI-CLI-MBH-001 experience.*
