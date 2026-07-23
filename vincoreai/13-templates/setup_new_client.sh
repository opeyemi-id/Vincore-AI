#!/bin/bash
# ─────────────────────────────────────────────────────────────────
# Vincore AI — setup_new_client.sh
# Creates the complete project folder structure for a new client
#
# USAGE:
#   chmod +x setup_new_client.sh
#   ./setup_new_client.sh
#
# You will be prompted for the project code and client name.
# The script creates the full VDF folder hierarchy and opens
# client_config.json for editing.
# ─────────────────────────────────────────────────────────────────

echo ""
echo "┌──────────────────────────────────────────────────────────┐"
echo "│         VINCORE AI — NEW CLIENT PROJECT SETUP            │"
echo "└──────────────────────────────────────────────────────────┘"
echo ""

# ── Collect inputs ────────────────────────────────────────────────
read -p "→ Project Code (e.g. VAI-CLI-XYZ-001): " PROJECT_CODE
read -p "→ Client Business Name: "                CLIENT_NAME
read -p "→ Client Short Code (3 letters, e.g. XYZ): " CLIENT_SHORT

# Validate
if [ -z "$PROJECT_CODE" ] || [ -z "$CLIENT_NAME" ] || [ -z "$CLIENT_SHORT" ]; then
  echo "  ✗ All fields required. Exiting."
  exit 1
fi

# Folder-safe client name (spaces to hyphens, lowercase)
FOLDER_NAME=$(echo "$CLIENT_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

echo ""
echo "  Creating project: $PROJECT_CODE — $CLIENT_NAME"
echo ""

# ── Create folder structure ───────────────────────────────────────
BASE="09-client-projects/Nigeria/NG-${FOLDER_NAME}/PRJ-001"

mkdir -p "${BASE}/01-Initiate/Commercials"
mkdir -p "${BASE}/01-Initiate/Governance"
mkdir -p "${BASE}/01-Initiate/Kick-off"

mkdir -p "${BASE}/02-Plan/Project-Planning"
mkdir -p "${BASE}/02-Plan/Schedule"
mkdir -p "${BASE}/02-Plan/Risks"

mkdir -p "${BASE}/03-Assess-and-Design/Assessment"
mkdir -p "${BASE}/03-Assess-and-Design/Solution-Design"

mkdir -p "${BASE}/04-Execute/Build"
mkdir -p "${BASE}/04-Execute/Testing"
mkdir -p "${BASE}/04-Execute/Deployment"
mkdir -p "${BASE}/04-Execute/Handover"
mkdir -p "${BASE}/04-Execute/Status-Reports"

mkdir -p "${BASE}/05-Close/Close-Out"
mkdir -p "${BASE}/05-Close/Acceptance"
mkdir -p "${BASE}/05-Close/Handover"
mkdir -p "${BASE}/05-Close/Commercials"
mkdir -p "${BASE}/05-Close/Marketing"
mkdir -p "${BASE}/05-Close/Benefits-Realization"

mkdir -p "${BASE}/assets"
mkdir -p "${BASE}/output"

echo "  ✓ Folder structure created at: ${BASE}/"
echo ""

# ── Copy template files into the project ─────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy all build scripts
cp "${SCRIPT_DIR}"/../build_*.js "${BASE}/" 2>/dev/null || true
cp "${SCRIPT_DIR}"/../build_*.py "${BASE}/" 2>/dev/null || true

# Copy config loader
cp "${SCRIPT_DIR}/config_loader.js" "${BASE}/"
cp "${SCRIPT_DIR}/config_loader.py" "${BASE}/"
cp "${SCRIPT_DIR}/build_all.sh" "${BASE}/"

echo "  ✓ Build scripts copied to project folder"
echo ""

# ── Create project-specific client_config.json ────────────────────
CONFIG_FILE="${BASE}/client_config.json"
cat > "${CONFIG_FILE}" << CONFIGEOF
{
  "_instructions": "Fill in every field below before running any build script.",
  "_project_code": "${PROJECT_CODE}",
  "_created": "$(date +%Y-%m-%d)",

  "vincore": {
    "founder":   "Opeyemi Idonuagbe",
    "company":   "Vincore AI",
    "email":     "opeyemi@vincoreai.com",
    "website":   "vincoreai.com",
    "location":  "Lagos, Nigeria",
    "tagline":   "AI Consulting & Revenue Systems"
  },

  "client": {
    "business_name":   "${CLIENT_NAME}",
    "contact_name":    "[CLIENT CONTACT FULL NAME]",
    "contact_role":    "[CLIENT ROLE]",
    "email":           "[CLIENT EMAIL]",
    "phone":           "[CLIENT PHONE]",
    "location":        "[CITY, STATE, COUNTRY]",
    "website":         "[CLIENT WEBSITE]",
    "instagram":       "[INSTAGRAM HANDLE]",
    "industry":        "[INDUSTRY]",
    "tagline":         "[BUSINESS TAGLINE]",
    "logo_path":       "./assets/client_logo.jpeg"
  },

  "project": {
    "code":            "${PROJECT_CODE}",
    "name":            "[PROJECT NAME]",
    "type":            "[PROJECT TYPE]",
    "description":     "[ONE SENTENCE DESCRIPTION]",
    "duration":        "[DURATION]",
    "start_date":      "[START DATE]",
    "end_date":        "[END DATE]",
    "go_live_date":    "[GO-LIVE DATE]",
    "system_url":      "[LIVE SYSTEM URL]",
    "kickoff_date":    "[KICKOFF DATE]",
    "uat_date":        "[UAT DATE]",
    "handover_date":   "[HANDOVER DATE]"
  },

  "commercial": {
    "fee_total":            "[TOTAL FEE]",
    "fee_deposit":          "[DEPOSIT]",
    "fee_balance":          "[BALANCE]",
    "deposit_pct":          "50",
    "currency_symbol":      "₦",
    "currency_code":        "NGN",
    "invoice_deposit_no":   "VAI-INV-[NNN]",
    "invoice_final_no":     "VAI-INV-[NNN]",
    "deposit_amount_num":   "[BOOKING DEPOSIT NUMBER]",
    "booking_deposit":      "[BOOKING DEPOSIT AMOUNT]",
    "referral_reward":      "[REFERRAL REWARD]",
    "payment_methods":      ["Bank Transfer", "Paystack"]
  },

  "documents": {
    "cdr":    "${PROJECT_CODE}-CDR",
    "prd":    "${PROJECT_CODE}-PRD",
    "prop":   "${PROJECT_CODE}-PRP",
    "sa":     "${PROJECT_CODE}-SA",
    "nda":    "${PROJECT_CODE}-NDA",
    "inv1":   "VAI-INV-[NNN]",
    "charter":"${PROJECT_CODE}-PC",
    "kom":    "${PROJECT_CODE}-KOM",
    "kp":     "${PROJECT_CODE}-KP",
    "pmp":    "${PROJECT_CODE}-PMP",
    "gantt":  "${PROJECT_CODE}-PS",
    "raid":   "${PROJECT_CODE}-RAID",
    "crf":    "${PROJECT_CODE}-CRF",
    "ar":     "${PROJECT_CODE}-AR",
    "sdd":    "${PROJECT_CODE}-SDD",
    "bl":     "${PROJECT_CODE}-BL",
    "tvr":    "${PROJECT_CODE}-TVR",
    "dc":     "${PROJECT_CODE}-DC",
    "glc":    "${PROJECT_CODE}-GLC",
    "om":     "${PROJECT_CODE}-OM",
    "ts":     "${PROJECT_CODE}-TS",
    "wsr":    "${PROJECT_CODE}-WSR-001",
    "cor":    "${PROJECT_CODE}-COR",
    "hd":     "${PROJECT_CODE}-HD",
    "caf":    "${PROJECT_CODE}-CAF",
    "cc":     "${PROJECT_CODE}-CC",
    "inv2":   "VAI-INV-[NNN]",
    "map":    "${PROJECT_CODE}-MAP",
    "brr":    "${PROJECT_CODE}-BRR",
    "tr":     "${PROJECT_CODE}-TR"
  },

  "system": {
    "components": [
      "[COMPONENT 1]", "[COMPONENT 2]", "[COMPONENT 3]",
      "[COMPONENT 4]", "[COMPONENT 5]"
    ],
    "platform_crm":        "[CRM PLATFORM]",
    "platform_automation": "[AUTOMATION PLATFORM]",
    "platform_payment":    "[PAYMENT PLATFORM]",
    "platform_hosting":    "[HOSTING PLATFORM]",
    "platform_calendar":   "[CALENDAR PLATFORM]",
    "platform_email":      "[EMAIL PLATFORM]",
    "workflow_count":      "[NUMBER OF AUTOMATIONS]"
  },

  "output": {
    "dir":          "./output/",
    "version":      "1.0",
    "report_month": "[MONTH YEAR]"
  }
}
CONFIGEOF

echo "  ✓ client_config.json created at: ${CONFIG_FILE}"
echo ""

# ── Create README for the project ─────────────────────────────────
cat > "${BASE}/README.md" << READMEEOF
# ${PROJECT_CODE} — ${CLIENT_NAME}

**Project:** [PROJECT NAME]
**Created:** $(date +%Y-%m-%d)
**Status:** Setting Up

## Quick Start

1. Add client logo → \`assets/client_logo.jpeg\`
2. Edit \`client_config.json\` — fill in all [PLACEHOLDER] values
3. Run \`./build_all.sh\` to build all 30 VDF documents
4. All output files appear in \`./output/\`

## Project Structure

\`\`\`
${BASE}/
├── client_config.json      ← Edit this first
├── config_loader.js
├── config_loader.py
├── build_all.sh
├── build_*.js              ← Word / PowerPoint scripts (Node.js)
├── build_*.py              ← Excel scripts (Python)
├── assets/
│   └── client_logo.jpeg   ← Add client logo here
├── output/                 ← All built documents appear here
├── 01-Initiate/
├── 02-Plan/
├── 03-Assess-and-Design/
├── 04-Execute/
└── 05-Close/
\`\`\`

## Document Register

See \`VAI-DOC-001_MasterDocumentRegister_v1.0.xlsx\` in the project root.
READMEEOF

echo "  ✓ README.md created"
echo ""

# ── Final summary ─────────────────────────────────────────────────
echo "┌──────────────────────────────────────────────────────────┐"
echo "│  ✓  Project ${PROJECT_CODE} is ready                     │"
echo "└──────────────────────────────────────────────────────────┘"
echo ""
echo "  NEXT STEPS:"
echo "  1. Add client logo:  cp /path/to/logo.jpg ${BASE}/assets/client_logo.jpeg"
echo "  2. Edit config:      open ${BASE}/client_config.json"
echo "  3. Build documents:  cd ${BASE} && ./build_all.sh"
echo ""
