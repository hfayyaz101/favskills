# Frontend Design Skills

A curated collection of agent skills and resources that improve frontend design output quality when working with AI coding agents (Claude Code, Codex, Cursor, etc.).

---

## 1. Taste Skill

**Repo:** https://github.com/Leonxlnx/taste-skill  
**Site:** https://www.tasteskill.dev/  
**Skill copy:** [`skills/taste-skill/SKILL.md`](skills/taste-skill/SKILL.md)

### What it is

Taste Skill is an agent skill that makes AI coding agents build professional company websites at the `figma.com` / `x.ai` quality level instead of assembling a generic landing page. It ships with a full design pipeline — palette dealing, layout dealing, real photography, real brand icons, shader effects, and a real-browser checker — all as plain Node 22+ scripts with no API keys and no installs.

### How it works

Every build goes through five stages:

1. **Business classification** — classifies the client as `software`, `gaming`, `tech`, `product`, `service`, or `place`. This controls which effects, photographs, and moments are eligible.
2. **Deal tokens and layout** — `scripts/start.mjs` deals a palette and Google Fonts pairing from `library/palettes.json` and `library/type.json`. `assets/layout/deal.mjs` deals one of eleven tested hero layouts: `split`, `centred`, `product`, `photo`, `place`, `collage`, `editorial`, `word`, `film`, `statement`, or `triptych`.
3. **Build from one system** — `assets/starter.html`, `assets/system.css`, and `assets/layout/layout.css` enforce one section per screen at 1440×900, equal left/right content edges, a fixed nav bar, and a single-screen closing footer. No multi-column chaos.
4. **Real content** — software/tech pages populate lit feature cards with real UI fragments and diagrams; real brand SVGs resolved locally. Place/shop/hospitality pages lead with curated open-license photographs (`scripts/photos.mjs`) with one expandable credit line in the footer — no captions under images.
5. **Shader effects, gated** — WebGL shader grounds, scroll scenes, and 3D prints are dealt only on `software`, `tech`, and `gaming` pages (four-context cap), with static fallbacks for phones and reduced motion. Every page gets a hero entrance and one or two dealt moments; cafes and service pages get zero WebGL.
6. **Real-browser check** — `scripts/consistency.mjs` renders in headless Chrome at 1440, 1024, 768, and 390 checking empty visuals, broken shaders, contrast drops, misaligned columns, placeholder text, and slow-network image gaps. `scripts/gate.mjs` holds the finish until all fixable FAILs are cleared (three rounds max).

### Key features

- 20 distinct design patterns rotated per build — no two pages look the same
- Photographs sourced from Wikimedia Commons, Openverse, and the Met (CC0 / public domain / CC BY)
- Quality gate runs in a real browser, not just a linter
- Builds across React, Vue, Svelte, and plain HTML
- MIT licensed, no API keys, no cloud dependencies

### Install

```bash
# Claude Code plugin
/plugin marketplace add Leonxlnx/taste-skill
/plugin install taste-skill@taste-skill

# via npx skills CLI
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
```

---

## 2. Web Design Guidelines (Vercel)

**Repo:** https://github.com/vercel-labs/agent-skills/tree/main/skills/web-design-guidelines  
**Guidelines source:** https://vercel.com/design/guidelines  
**Skill copy:** [`skills/web-design-guidelines/SKILL.md`](skills/web-design-guidelines/SKILL.md)  
**Rules copy:** [`skills/web-design-guidelines/references/command.md`](skills/web-design-guidelines/references/command.md)

### What it is

An agent skill that reviews UI code for compliance with Vercel's Web Interface Guidelines — a comprehensive set of rules for accessibility, focus states, forms, animation, typography, content handling, images, performance, and navigation. Think of it as a lightweight automated design + accessibility audit baked into your agent workflow.

### How it works

The skill bundles the full guidelines in `references/command.md` (pinned to a specific upstream commit with SHA-256 hash). When triggered, the agent:

1. Reads the bundled guidelines (never fetches from the network)
2. Reads the specified files or patterns
3. Checks against all rules
4. Outputs findings in terse `file:line` format — high signal, no noise

### Rules it enforces

| Category | Examples |
|---|---|
| **Accessibility** | Icon-only buttons need `aria-label`; use `<button>` for actions not `<div onClick>`; semantic HTML before ARIA |
| **Focus States** | Never `outline-none` without replacement; use `:focus-visible` over `:focus`; sticky headers must not cover focused element |
| **Forms** | Inputs need `autocomplete`; never block paste; submit stays enabled until request starts; errors inline next to fields |
| **Animation** | Honor `prefers-reduced-motion`; animate `transform`/`opacity` only; never `transition: all` |
| **Typography** | `…` not `...`; curly quotes; non-breaking spaces for `10 MB`, `⌘ K`; `text-wrap: balance` on headings |
| **Content Handling** | Handle empty states; flex children need `min-w-0`; anticipate long inputs |
| **Images** | Explicit `width`/`height` to prevent CLS; `loading="lazy"` below fold; `fetchpriority="high"` above fold |
| **Performance** | Virtualize lists >50 items; no layout reads in render; critical fonts preloaded |
| **Navigation** | URL reflects state; links use `<a>`/`<Link>`; destructive actions need confirmation |

### Trigger phrases

> "review my UI", "check accessibility", "audit design", "review UX", "check my site against best practices"

### Install

```bash
npx skills add https://github.com/vercel-labs/agent-skills --skill "web-design-guidelines"
```

---

## 3. Awesome Design MD

**Repo:** https://github.com/voltagent/awesome-design-md  
**Site:** https://getdesign.md  
**Skill copy:** [`skills/awesome-design-md/README.md`](skills/awesome-design-md/README.md)

### What it is

A curated collection of 84+ `DESIGN.md` files extracted from real production websites. Drop one into your project root, tell your AI agent "build me a page that looks like this," and get high-quality UI that stays visually consistent with that site's design language.

`DESIGN.md` is a concept introduced by Google Stitch — a plain-text design system document that AI agents read to generate consistent UI. No Figma exports, no JSON schemas, no special tooling. Just markdown.

| File | Who reads it | What it defines |
|---|---|---|
| `AGENTS.md` | Coding agents | How to build the project |
| `DESIGN.md` | Design agents | How the project should look and feel |

### What's in each DESIGN.md

Every file follows the [Stitch DESIGN.md specification](https://stitch.withgoogle.com/docs/design-md/specification/) with extended sections:

| Section | What it captures |
|---|---|
| Visual Theme & Atmosphere | Mood, density, design philosophy |
| Color Palette & Roles | Semantic name + hex + functional role |
| Typography Rules | Font families, full hierarchy table |
| Component Stylings | Buttons, cards, inputs, navigation with states |
| Layout Principles | Spacing scale, grid, whitespace philosophy |
| Depth & Elevation | Shadow system, surface hierarchy |
| Do's and Don'ts | Design guardrails and anti-patterns |
| Responsive Behavior | Breakpoints, touch targets, collapsing strategy |
| Agent Prompt Guide | Quick color reference, ready-to-use prompts |

### Coverage

84+ sites across: AI/LLM Platforms, Developer Tools, Backend/DevOps, Productivity/SaaS, Design Tools, Fintech, E-commerce, Media/Consumer Tech, Automotive, and even Retro Web (1990s era). Notable entries: Stripe, Linear, Vercel, Apple, Shopify, Figma, Supabase, Notion, SpaceX, Ferrari.

### How to use

1. Browse https://getdesign.md and pick a site whose aesthetic fits your project
2. Copy its `DESIGN.md` into your project root
3. Tell your agent: `"Build me a landing page. Use DESIGN.md for all design decisions."`

Each site also ships `preview.html` and `preview-dark.html` — visual catalogs showing color swatches, type scale, buttons, and cards.

---

## 4. Image-to-Code

**Repo:** https://github.com/nexu-io/open-design/blob/main/skills/image-to-code-skill/SKILL.md  
**Skill copy:** [`skills/image-to-code/SKILL.md`](skills/image-to-code/SKILL.md)

### What it is

An elite website image-to-code skill for AI coding agents. The core insight: standard AI output collapses into repetitive defaults (centered dark hero clichés, card spam, compressed boards you can barely read). This skill breaks that by requiring the agent to **generate high-quality reference images first**, deeply analyze them, then implement the site to match as closely as possible.

### How it works

The skill enforces a strict image-first workflow:

1. **Generate reference images** — large, readable, section-specific images (not tiny compressed boards). Generate fresh standalone images for each section or detail view rather than cropping old ones.
2. **Deep visual analysis** — analyze the reference for typography hierarchy, spacing ratios, color relationships, component patterns, and overall visual weight before writing a single line of HTML.
3. **Implement to match** — build the actual frontend to match the reference direction as closely as possible.

### What it's for

- Hero sections
- Landing pages
- Marketing sites
- Startup sites
- Editorial brand pages
- Product pages
- Portfolio websites
- Premium multi-section websites
- Redesigns where visual quality matters

### Anti-patterns it prevents

- One giant compressed image for too many sections
- Text too small to read in references
- Centered dark hero clichés
- Generic card spam
- Repeated left-text/right-image layouts
- Cards inside cards inside cards
- Lazy under-generation of reference images

### Trigger phrases

> "image to code", "reference image to frontend", "generate then code", "visual implementation"

---

## 5. Playwright CLI

**Docs:** https://playwright.dev  
**Skill copy:** [`skills/playwright/SKILL.md`](skills/playwright/SKILL.md)

### What it is

A browser automation skill that lets AI agents interact with real web browsers — navigate pages, click elements, fill forms, take screenshots, intercept network requests, manage cookies and storage, record videos, and run Playwright tests. Essential for verifying that UI changes actually work before marking a task complete.

### Core commands

```bash
playwright-cli open https://example.com    # open browser and navigate
playwright-cli snapshot                    # get accessibility tree with element refs
playwright-cli click e15                   # click element by ref
playwright-cli fill e5 "user@example.com"  # fill input
playwright-cli screenshot                  # capture screenshot
playwright-cli find "Sign in"              # search snapshot for text
playwright-cli close                       # close browser
```

### Key capabilities

| Area | What it covers |
|---|---|
| **Navigation** | goto, go-back, go-forward, reload |
| **Interaction** | click, dblclick, fill, type, select, drag, drop, hover, check |
| **Snapshots** | accessibility tree with element refs, depth limiting, element-scoped snapshots |
| **Storage** | cookies, localStorage, sessionStorage — get/set/delete/clear |
| **Network** | route mocking (status codes, body overrides), route-list, unroute |
| **DevTools** | console logs, network requests, tracing, video recording |
| **Tabs** | tab-new, tab-list, tab-select, tab-close |
| **Sessions** | named sessions with persistent profiles, attach to running browsers via CDP |
| **Testing** | generate Playwright locators, run/debug Playwright test files, test healing |

### Browser support

Chrome, Firefox, WebKit (Safari), Edge, mobile device emulation (`--mobile`, `--device="iPhone 15"`).

### Design feedback loop

```bash
playwright-cli open https://example.com
playwright-cli show --annotate   # user draws boxes and types comments on the live page
                                  # agent receives annotated screenshot + snapshot + notes
```

This is the fastest way to close the design feedback loop — no screenshots back-and-forth, the user annotates directly on the live page.

### Install

```bash
npm install -g @playwright/cli@latest
```

---

## 6. UI UX Pro Max

**Repo:** https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
**Site:** https://uupm.cc
**Skill copy:** [`skills/uiux-pro-max/SKILL.md`](skills/uiux-pro-max/SKILL.md)

### What it is

An AI skill providing design intelligence for professional UI/UX across multiple platforms and frameworks. Ships 194 reasoning rules and 80 searchable UI styles, covering everything from layout principles to component patterns and responsive behavior. The styles database is searchable so the agent can find the right visual reference for any design direction.

### Key features

- 194 reasoning rules for consistent design decisions
- 80 searchable UI styles (find: "brutalist dark", "editorial minimal", "neon tech")
- Multi-platform: web, mobile, desktop applications
- Multi-framework: React, Vue, plain HTML
- Python CLI for rule updates and style management

### Install

```bash
npx ui-ux-pro-max-cli install
```

---

## 7. Archify

**Repo:** https://github.com/tt-a1i/archify
**Site:** https://archify.si
**Skill copy:** [`skills/archify/SKILL.md`](skills/archify/SKILL.md)

### What it is

Archify turns anything you want to understand, plan, or share into an interactive visual: travel itineraries, learning maps, complex system architectures, project plans. You describe it to your AI agent, and Archify generates one self-contained interactive HTML file you can explore, customize, and share. 130K+ installs on skills.sh.

### Key features

- One output: a single self-contained `.html` file, open by double-clicking
- Works on anything: codebases, plans, ideas, relationships, timelines
- Interactive: clickable nodes, zoom, pan, search
- 52+ diagram types, all rendered without external dependencies
- Live gallery at archify.si showing community outputs
- Three sub-skills: `archify-review`, `archify-tuning`, `simplify-codebase`

### Example prompts

```
Make me an architecture diagram of my app: frontend, backend, database, Redis cache.
Map my project roadmap by quarter and dependency.
Show the relationships between all files in this codebase.
```

### Install

```bash
npx skills add tt-a1i/archify
```

---

## 8. Impeccable

**Repo:** https://github.com/pbakaus/impeccable
**Site:** https://impeccable.style
**Skill copy:** [`skills/impeccable/SKILL.md`](skills/impeccable/SKILL.md)

### What it is

The design vocabulary for your coding agent. Impeccable gives agents words for specific design moves (`bolder`, `quieter`, `distill`, `colorize`, `typeset`) and a 62-rule slop detector that catches AI design tells before they ship. It also ships a UX reviewer (`critique`, scored against usability heuristics) and a technical quality auditor (`audit`, findings ranked P0 to P3).

Same model, same brief — Impeccable turns a "cream page, thin serif, pill buttons" default into a page built around one striking picture.

### 24 commands

| Group | Commands |
|---|---|
| **Steer** | `bolder`, `quieter`, `distill`, `colorize`, `typeset`, `layout`, `animate`, `delight`, `overdrive` |
| **Review** | `critique` (scored UX review), `audit` (P0–P3 technical quality) |
| **Finish** | `polish`, `harden`, `clarify`, `adapt`, `optimize`, `onboard` |
| **Iterate live** | `live` (pick element in browser + cycle variants), `generate` |
| **Plan & setup** | `shape`, `init` (writes `PRODUCT.md`), `document` (writes `DESIGN.md`), `extract` |

### Install

```bash
npx impeccable install
# Then in agent:
/impeccable init
```

---

## 9. PPT Master

**Repo:** https://github.com/hugohe3/ppt-master
**Skill copy:** [`skills/ppt-master/SKILL.md`](skills/ppt-master/SKILL.md)

### What it is

AI generates native PowerPoint (`.pptx`) from any document — PDFs, DOCX, web pages, markdown. Not an HTML slideshow or image export — actual PowerPoint files you can open in PowerPoint or Keynote and continue editing. The agent reads the source material, identifies key points, structures the narrative arc, and generates a natively editable PPTX.

### Key features

- Output is a real `.pptx` file, not an HTML presentation
- Input: PDF, DOCX, web URL, markdown, plain text
- Understands source material structure (sections, hierarchy, figures)
- Templates: professional, academic, business styles
- Multilingual (original development in Chinese, full English support)
- Python-based with `python-pptx`

### Install

```bash
npx skills add hugohe3/ppt-master --skill ppt-master
```

---

## 10. Diagram Design

**Repo:** https://github.com/cathrynlavery/diagram-design
**Site:** https://diagramdesign.dev
**Skill copy:** [`skills/diagram-design/SKILL.md`](skills/diagram-design/SKILL.md)

### What it is

An agent skill that draws editorial diagrams as one self-contained HTML + SVG file, in your brand. 52 diagram types. No shadows, no Mermaid slop, no external dependencies. The output is one `.html` file you open by double-clicking — no server required.

The design philosophy: diagrams your designer won't hate. The skill pulls your brand palette and fonts from your site URL on first run (`/diagram-design onboard https://yoursite.com`) so every diagram after that matches your brand automatically.

### 52 diagram types

Architecture, sequence, flowchart, ERD, swimlane, mind map, timeline, Gantt, quadrant, matrix, tree, org chart, network graph, Venn, funnel, journey map, wireframe, and more.

### Key features

- Zero dependencies in output HTML — works offline forever
- Brand onboarding: pulls palette and fonts from your site
- Import from draw.io, Mermaid, Excalidraw, PlantUML
- Export to PNG or SVG
- `/diagram-design` as a first-class slash command

### Example prompts

```
Make me an architecture diagram: frontend, backend, database, Redis cache.
I need a quadrant showing Q2 projects by impact vs effort.
Give me a sequence of a bearer call with token refresh on 401.
```

### Install

```bash
npx skills add cathrynlavery/diagram-design
# or Claude Code:
/plugin marketplace add cathrynlavery/diagram-design
```
