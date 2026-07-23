"""
Vincore AI — Config Loader (Python)
─────────────────────────────────────
Import this at the top of every Python build script.
Loads client_config.json and resolves document IDs.

Usage:
    from config_loader import C
    print(C['client']['business_name'])
    print(C['docs']['pmp'])
    print(C['CLIENT'])             # shortcut
"""

import json
import os
import sys
import warnings

# ── Load raw config ──────────────────────────────────────────────
_DIR = os.path.dirname(os.path.abspath(__file__))
_CONFIG_PATH = os.path.join(_DIR, 'client_config.json')

if not os.path.exists(_CONFIG_PATH):
    raise FileNotFoundError(
        f'client_config.json not found at {_CONFIG_PATH}. '
        'Create it before running any build script.'
    )

with open(_CONFIG_PATH, encoding='utf-8') as f:
    _raw = json.load(f)

# ── Resolve document IDs from project code ─────────────────────────
_code = _raw['project']['code']
docs = {
    key: val.replace('[PROJECT_CODE]', _code)
    for key, val in _raw['documents'].items()
}

# ── Build convenience object ───────────────────────────────────────
C = {
    # Full sections
    'vincore':    _raw['vincore'],
    'client':     _raw['client'],
    'project':    _raw['project'],
    'commercial': _raw['commercial'],
    'system':     _raw['system'],
    'output':     _raw['output'],
    'docs':       docs,

    # Flat shortcuts
    'CLIENT':   _raw['client']['business_name'],
    'CONTACT':  _raw['client']['contact_name'],
    'EMAIL':    _raw['client']['email'],
    'PHONE':    _raw['client']['phone'],
    'LOCATION': _raw['client']['location'],
    'WEBSITE':  _raw['client']['website'],

    'CODE':     _raw['project']['code'],
    'NAME':     _raw['project']['name'],
    'FEE':      _raw['commercial']['fee_total'],
    'DEPOSIT':  _raw['commercial']['fee_deposit'],
    'BALANCE':  _raw['commercial']['fee_balance'],
    'CURRENCY': _raw['commercial']['currency_symbol'],
    'START':    _raw['project']['start_date'],
    'END':      _raw['project']['end_date'],
    'GOLIVE':   _raw['project']['go_live_date'],
    'MONTH':    _raw['output']['report_month'],
    'VERSION':  _raw['output']['version'],
    'OUT':      _raw['output']['dir'],
}

# Helper: output filename builder
def make_filename(doc_key: str, ext: str, label: str = '') -> str:
    """e.g. make_filename('pmp','xlsx') → 'VAI-CLI-XXX-001-PMP_v1.0.xlsx'"""
    doc_id = docs.get(doc_key, doc_key)
    slug = ('_' + ''.join(c for c in label if c.isalnum())) if label else ''
    return f"{doc_id}{slug}_v{_raw['output']['version']}.{ext}"

C['filename'] = make_filename

# ── Validate: warn about unfilled placeholders ─────────────────────
def _check(obj, path=''):
    issues = []
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k.startswith('_'):
                continue
            fp = f'{path}.{k}' if path else k
            issues.extend(_check(v, fp))
    elif isinstance(obj, str) and '[' in obj:
        issues.append(f'  ⚠  {path}: "{obj}"')
    return issues

_issues = _check(_raw)
if _issues:
    print('\n┌─ client_config.json has unfilled placeholders ─────────────')
    for i in _issues:
        print(i)
    print('└────────────────────────────────────────────────────────────\n')
