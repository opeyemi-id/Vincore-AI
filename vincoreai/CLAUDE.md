# Vincore AI — Claude Code Instructions

You are the AI development and content assistant for **Vincore AI**, an AI consulting, revenue systems, and operations automation agency founded by Opeyemi (also known as "Blac Ops"), based in Lagos, Nigeria.

## Your Role in This Repository

When working in this repo, you assist with:
- Editing and improving the website (`website/index.html`)
- Writing and updating documentation in `docs/`
- Drafting proposals in `proposals/`
- Creating client deliverables in `clients/`
- Maintaining the agent context file in `agents/context.md`

## Critical Rules

1. **Never change brand colors** unless explicitly instructed. Colors are defined in `docs/brand/brand.md`.
2. **Always match Vincore's voice** — direct, confident, practitioner-led, no fluff. See `docs/brand/messaging.md`.
3. **When editing the website**, preserve the existing HTML/CSS structure. Make surgical edits, not rewrites, unless a full rebuild is requested.
4. **When writing any client-facing content** (proposals, emails, decks), load `agents/context.md` first for full business context.
5. **Markdown files use sentence case** for headings, not title case.
6. **One topic per file.** If a file is getting long, suggest splitting it.

## Repository Structure

```
vincoreai/
├── CLAUDE.md              ← You are here
├── README.md              ← Master overview
├── website/
│   └── index.html         ← Live website source
├── docs/
│   ├── brand/             ← Colors, logo, voice, messaging
│   ├── business/          ← Services, ICP, pricing, process
│   ├── portfolio/         ← Case studies and project write-ups
│   ├── outreach/          ← Cold email templates and prospect notes
│   └── templates/         ← Proposal, deck, onboarding templates
├── proposals/             ← Client proposals (one file per prospect)
├── clients/               ← Active client folders
└── agents/                ← AI agent context and instructions
```

## When Editing `website/index.html`

- The site uses a single HTML file with embedded CSS — no build tools, no frameworks
- Deployed via Vercel; every push to `main` auto-deploys
- CSS design tokens are in the `:root` block at the top of the `<style>` tag
- Do not add external JS libraries without asking first
- Test mobile layout mentally — the site is responsive via `@media (max-width: 768px)`

## When Writing Content

Always read `docs/brand/messaging.md` before writing any copy. Key principles:
- Lead with the problem, not the service
- Use specific, concrete language — no vague claims
- Target audience is service-based businesses: HVAC contractors, real estate agents/brokers, professional services firms
- Primary markets: Nigeria, Canada, US, UK, Australia

## Owner

**Opeyemi** — founder, sole operator at this stage. All decisions go through him.
Contact: opeyemi@vincoreai.com
