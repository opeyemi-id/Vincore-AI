#!/bin/bash
# ─────────────────────────────────────────────────────────────────
# Vincore AI — build_all.sh
# Builds all 30 VDF documents for the current client_config.json
#
# USAGE:
#   chmod +x build_all.sh
#   ./build_all.sh
#
# PREREQUISITES:
#   - client_config.json is fully filled in (no [PLACEHOLDER] values)
#   - Client logo is at ./assets/client_logo.jpeg
#   - Node.js is installed (node --version)
#   - Python 3 is installed (python3 --version)
#   - npm packages installed: npm install
#   - Python packages installed: pip install openpyxl pptxgenjs
# ─────────────────────────────────────────────────────────────────

set -e  # Stop on first error

echo ""
echo "┌──────────────────────────────────────────────────────────┐"
echo "│         VINCORE AI — DOCUMENT BUILD SYSTEM               │"
echo "│         Building all 30 VDF documents...                 │"
echo "└──────────────────────────────────────────────────────────┘"
echo ""

# Check config has no unfilled placeholders
echo "→ Checking client_config.json for unfilled placeholders..."
python3 -c "
import json, sys
with open('client_config.json') as f:
    raw = json.load(f)

def check(obj, path=''):
    issues = []
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k.startswith('_'): continue
            fp = f'{path}.{k}' if path else k
            issues.extend(check(v, fp))
    elif isinstance(obj, str) and '[' in obj:
        issues.append(f'  ⚠  {path}: {obj!r}')
    return issues

issues = check(raw)
if issues:
    print(f'  Found {len(issues)} unfilled placeholders:')
    for i in issues[:10]: print(i)
    if len(issues) > 10: print(f'  ... and {len(issues)-10} more')
    sys.exit(1)
else:
    print('  ✓ No unfilled placeholders found')
"

echo ""

# Create output directory
mkdir -p ./output
echo "→ Output directory: ./output/"
echo ""

# ─────────────────────────────────────────────────────────────────
# PHASE 1 — INITIATE (9 documents)
# ─────────────────────────────────────────────────────────────────
echo "── PHASE 1: INITIATE ──────────────────────────────────────"
echo "→ Building Document 01: Client Discovery Report..."
node build_cdr.js

echo "→ Building Document 02: Project Requirements Document..."
node build_prd.js

echo "→ Building Document 03: Proposal..."
node build_proposal.js

echo "→ Building Document 04: Service Agreement..."
node build_agreement.js

echo "→ Building Document 05: NDA..."
node build_nda.js

echo "→ Building Document 06: Deposit Invoice..."
node build_invoice.js

echo "→ Building Document 07: Project Charter..."
node build_charter.js

echo "→ Building Document 08: Kickoff Agenda & Minutes..."
node build_kickoff.js

echo "→ Building Document 09: Kickoff Presentation..."
node build_pptx.js

echo ""

# ─────────────────────────────────────────────────────────────────
# PHASE 2 — PLAN (4 documents)
# ─────────────────────────────────────────────────────────────────
echo "── PHASE 2: PLAN ──────────────────────────────────────────"
echo "→ Building Document 10: Project Management Plan..."
node build_pmp.js

echo "→ Building Document 11: Project Schedule / Gantt Chart..."
python3 build_gantt.py

echo "→ Building Document 12: Risk & RAID Register..."
python3 build_raid.py

echo "→ Building Document 13: Change Request Form..."
node build_crf.js

echo ""

# ─────────────────────────────────────────────────────────────────
# PHASE 3 — ASSESS & DESIGN (2 documents)
# ─────────────────────────────────────────────────────────────────
echo "── PHASE 3: ASSESS & DESIGN ───────────────────────────────"
echo "→ Building Document 14: Assessment Report..."
node build_ar.js

echo "→ Building Document 15: Solution Design Document..."
node build_sdd.js

echo ""

# ─────────────────────────────────────────────────────────────────
# PHASE 4 — EXECUTE (7 documents)
# ─────────────────────────────────────────────────────────────────
echo "── PHASE 4: EXECUTE ───────────────────────────────────────"
echo "→ Building Document 16: Build Log..."
node build_buildlog.js

echo "→ Building Document 17: Testing & Validation Report..."
node build_tvr.js

echo "→ Building Document 18: Deployment Checklist..."
node build_dc.js

echo "→ Building Document 19: Go-Live Checklist..."
node build_glc.js

echo "→ Building Document 20: Operations Manual..."
node build_om.js

echo "→ Building Document 21: Training Slides..."
node build_training.js

echo "→ Building Document 22: Weekly Status Report..."
node build_wsr.js

echo ""

# ─────────────────────────────────────────────────────────────────
# PHASE 5 — CLOSE (8 documents)
# ─────────────────────────────────────────────────────────────────
echo "── PHASE 5: CLOSE ─────────────────────────────────────────"
echo "→ Building Document 23: Project Close-Out Report..."
node build_cor.js

echo "→ Building Document 24: Handover Document..."
node build_hd.js

echo "→ Building Document 25: Client Acceptance Form..."
node build_caf.js

echo "→ Building Document 26: Completion Certificate..."
node build_cc.js

echo "→ Building Document 27: Final Invoice..."
node build_invoice2.js

echo "→ Building Document 28: Marketing Asset Pack..."
node build_map.js

echo "→ Building Document 29: Benefits Realization Report..."
node build_brr.js

echo "→ Building Document 30: Client Testimonial Request..."
node build_tr.js

echo ""

# ─────────────────────────────────────────────────────────────────
# SUMMARY
# ─────────────────────────────────────────────────────────────────
echo "┌──────────────────────────────────────────────────────────┐"
echo "│  ✓  All 30 VDF documents built successfully              │"
COUNT=$(ls ./output/*.docx ./output/*.xlsx ./output/*.pptx 2>/dev/null | wc -l)
echo "│  Output files: $COUNT files in ./output/                          │"
echo "└──────────────────────────────────────────────────────────┘"
echo ""
echo "→ Next: Review documents in ./output/ and commit to GitHub"
echo "→ Remember: Update client_config.json before the next client"
echo ""
