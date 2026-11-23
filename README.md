# favskills

A personal collection of agent skills and resources that improve AI coding agent workflow. Each entry includes a detailed description and a local copy of the skill for offline reference.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/hfayyaz101/favskills/main/install.sh | bash
```

Prompts you to pick **Claude Code**, **Cursor** (global or project), or **both** — then choose full suite, frontend design suite, or a single skill.

---

## Frontend Design

> Skills that make AI agents build professional-quality UI instead of generic slop.

See [`frontend-design.md`](frontend-design.md) for detailed descriptions and usage.

| Skill | What it does | Source |
|---|---|---|
| **Taste Skill** | Deals palettes, layouts, real photos, shader effects, and runs a real-browser quality gate — upgrades agent-built sites to `figma.com` / `x.ai` level | [tasteskill.dev](https://www.tasteskill.dev/) · [repo](https://github.com/Leonxlnx/taste-skill) |
| **Web Design Guidelines** | Reviews UI code for Vercel's Web Interface Guidelines: accessibility, focus states, forms, animation, typography, performance, navigation | [vercel.com/design/guidelines](https://vercel.com/design/guidelines) · [repo](https://github.com/vercel-labs/agent-skills/tree/main/skills/web-design-guidelines) |
| **Awesome Design MD** | 84+ `DESIGN.md` files extracted from real production sites (Stripe, Linear, Apple, Shopify…) — drop one in your project and agents generate consistent, branded UI | [getdesign.md](https://getdesign.md) · [repo](https://github.com/voltagent/awesome-design-md) |
| **Image-to-Code** | Forces an image-first workflow: generate high-quality reference images per section first, analyze deeply, then implement to match — breaks the centered-dark-hero-card-spam default | [repo](https://github.com/nexu-io/open-design/blob/main/skills/image-to-code-skill/SKILL.md) |
| **Playwright CLI** | Full browser automation in agent workflows — navigate, click, fill, screenshot, mock network, record video, run tests, and get annotated design feedback on the live page | [playwright.dev](https://playwright.dev) |

### Skill files

```
skills/
├── taste-skill/SKILL.md
├── web-design-guidelines/
│   ├── SKILL.md
│   └── references/command.md
├── awesome-design-md/README.md
├── image-to-code/SKILL.md
└── playwright/SKILL.md
```
