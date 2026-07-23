/**
 * Vincore AI — Config Loader (Node.js)
 * ─────────────────────────────────────
 * Import this at the top of every build script.
 * It loads client_config.json, resolves document IDs from
 * the project code, and validates that no placeholder values
 * remain unfilled before a build runs.
 *
 * Usage in any build script:
 *   const C = require('./config_loader');
 *   run(C.client.business_name, ...)   // → actual client name
 */

const fs   = require('fs');
const path = require('path');

// ── Load raw config ──────────────────────────────────────────────
const configPath = path.join(__dirname, 'client_config.json');
if (!fs.existsSync(configPath)) {
  throw new Error(`client_config.json not found at ${configPath}. Create it before running any build script.`);
}

const raw = JSON.parse(fs.readFileSync(configPath, 'utf8'));

// ── Resolve document IDs from project code ────────────────────────
const code = raw.project.code;
const docs = {};
for (const [key, val] of Object.entries(raw.documents)) {
  docs[key] = val.replace('[PROJECT_CODE]', code);
}

// ── Convenience shortcuts ─────────────────────────────────────────
const C = {
  // Core sections
  vincore:    raw.vincore,
  client:     raw.client,
  project:    raw.project,
  commercial: raw.commercial,
  system:     raw.system,
  output:     raw.output,
  docs,

  // Frequently used aliases
  CLIENT:     raw.client.business_name,
  CONTACT:    raw.client.contact_name,
  EMAIL:      raw.client.email,
  PHONE:      raw.client.phone,
  LOCATION:   raw.client.location,
  WEBSITE:    raw.client.website,

  CODE:       raw.project.code,
  NAME:       raw.project.name,
  FEE:        raw.commercial.fee_total,
  DEPOSIT:    raw.commercial.fee_deposit,
  BALANCE:    raw.commercial.fee_balance,
  CURRENCY:   raw.commercial.currency_symbol,
  START:      raw.project.start_date,
  END:        raw.project.end_date,
  GOLIVE:     raw.project.go_live_date,
  MONTH:      raw.output.report_month,
  VERSION:    raw.output.version,
  OUT:        raw.output.dir,

  // Helper: load client logo (returns buffer)
  logo: () => {
    const lp = path.join(__dirname, raw.client.logo_path);
    if (!fs.existsSync(lp)) {
      console.warn(`⚠  Logo not found at ${lp}. Using placeholder.`);
      return null;
    }
    return fs.readFileSync(lp);
  },

  // Helper: output filename builder
  // e.g. C.filename('CDR', 'docx') → 'VAI-CLI-XXX-001-CDR_ClientDiscoveryReport_v1.0.docx'
  filename: (docKey, ext, label='') => {
    const id = docs[docKey] || docKey;
    const slug = label ? `_${label.replace(/\s+/g,'').replace(/[^a-zA-Z0-9]/g,'')}` : '';
    return `${id}${slug}_v${raw.output.version}.${ext}`;
  },
};

// ── Validate: warn about unfilled placeholders ─────────────────────
function findUnfilled(obj, path = '') {
  const issues = [];
  for (const [k, v] of Object.entries(obj)) {
    if (k.startsWith('_')) continue;
    const fullPath = path ? `${path}.${k}` : k;
    if (typeof v === 'string' && v.includes('[')) {
      issues.push(`  ⚠  ${fullPath}: "${v}"`);
    } else if (typeof v === 'object' && v !== null && !Array.isArray(v)) {
      issues.push(...findUnfilled(v, fullPath));
    }
  }
  return issues;
}

const issues = findUnfilled(raw);
if (issues.length > 0) {
  console.warn('\n┌─ client_config.json has unfilled placeholders ─────────────');
  issues.forEach(i => console.warn(i));
  console.warn('└────────────────────────────────────────────────────────────\n');
}

module.exports = C;
