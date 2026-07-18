# VAI-BRD-001 Brand Guidelines
**Version:** 2.0 | **Owner:** Opeyemi Idonuagbe | **Status:** Active
**Supersedes:** VAI-BRD-001_BrandGuidelines_v1.0.md (archived)

---

## Logo

### Construction
Wordmark + orb symbol. Built in code — no static image file.

**Orb:**
- 26px circle
- Radial gradient: #54a9f5 → #2196F3 (45%) → #081C3A
- Highlight offset top-left (34% 30%) for 3D sphere effect
- Cyan glow: 0 0 14px rgba(84,224,255,.5) — pulses at 3s ease-in-out up to 0 0 26px at opacity 0.9

**Orbit ring:**
- 1px cyan ring rgba(84,224,255,.5) inset −5px around the orb
- Top/bottom borders transparent — creates the orbital motif
- Tilted appearance

**Wordmark:**
- Font: Space Grotesk Bold
- Letter-spacing: −0.02em
- "Vincore" in ink/white depending on background
- "AI" filled with gradient: #2196F3 → #54E0FF at 100deg

**Lockup:**
- Orb + 9px gap + wordmark
- Banner variants use same recipe at 26–28px

---

## Colour Palette

### Core Brand

| Name | Hex | Usage |
|---|---|---|
| Ink / Deep Navy | #081C3A | Headings, dark sections, primary dark |
| Navy | #0a2350 | Secondary dark surface |
| Abyss | #040d1e | Footer, darkest gradient stop |
| Electric Blue | #2196F3 | Primary accent, buttons, CTAs |
| Cyan | #54E0FF | Highlights, glows, link hover states |

### Support

| Name | Hex | Usage |
|---|---|---|
| Teal | #40E0C8 | Console/success accents |
| Gold | #e3c77e | Rare warm gradient endpoint, headline gradient text |
| Sky Mid | #3fb0f7, #73C8FF | Gradient blend stops |

### Neutrals

| Name | Hex | Usage |
|---|---|---|
| White | #ffffff | Base background |
| Paper | #f2f9ff | Light section background |
| Glow Blue | #DDF4FF | Subtle light tints |
| Silver | #c8d3e6 | Borders, dividers on light |
| Body Text | #37415f | Primary body copy |
| Muted | #6b7794 | Subtext, descriptions, labels |
| Hairline Light | rgba(8,28,58,.09) | Borders on light backgrounds |
| Hairline Dark | rgba(255,255,255,.1) | Borders on dark backgrounds |

---

## Signature Gradients

### Button / CTA Gradient
```css
background: linear-gradient(135deg, #2196F3, #3fb0f7, #54E0FF);
```

### Hero Background
```css
background: radial-gradient(ellipse, #0b2a55, #081C3A, #040d1e);
```

### Gradient Text (Headlines)
```css
background: linear-gradient(100deg, #54E0FF, #73C8FF, #e3c77e);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
```

---

## Typography

### Fonts
- **Space Grotesk** (weights 500, 600, 700) — logo, all headings (h1–h4), stats, numbers, FAQ questions; letter-spacing −0.02em
- **Inter** (weights 400–700) — body text, buttons, forms, UI labels

### Patterns
- Uppercase micro-labels: ~0.7rem, weight 700, letter-spacing 0.15–0.22em
- Big numerals: Space Grotesk 700, 1.9–2.6rem
- Body line-height: 1.7–1.8

---

## Design Principles

**Never use:** Pure black backgrounds, lime green, purple, generic grey
**Never stretch or recolor** the logo or orb
**Always maintain** the orbital motif in the orb — it is the signature element
**Dark backgrounds** are the primary canvas — the site and presentations lead with navy/ink
**Electric Blue** is the primary action color — not teal (teal is for console/success states only)

---

## Version History

| Version | Date | Changes |
|---|---|---|
| v1.0 | July 2026 | Initial brand guidelines (geometric V mark, teal accent) |
| v2.0 | July 2026 | V3 brand update — orb logo, Electric Blue primary, new palette, signature gradients |
