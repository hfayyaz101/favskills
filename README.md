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

Also: **UI UX Pro Max** · **Archify** · **Impeccable** · **PPT Master** · **Diagram Design**

---

## Senior Developer

> Skills for thinking, planning, and executing like a senior engineer.

See [`senior-developer.md`](senior-developer.md) for detailed descriptions and usage.

| Skill | What it does | Source |
|---|---|---|
| **Superpowers** | Meta-skill framework: brainstorming, systematic-debugging, writing-plans, TDD, parallel agents, verification, code review | built-in Claude Code plugin |
| **Matt Pocock Skills** | TypeScript best practices and advanced patterns from Total TypeScript | TBD |
| **ECC** | Full engineering OS: 72 agents, 328 skills, plan→test→implement→review→verify loop, AgentShield security scanning | [ecc.tools](https://ecc.tools) · [repo](https://github.com/affaan-m/ECC) |
| **Karpathy Skills** | Four principles against LLM failure modes: think before coding, simplicity first, surgical changes, goal-driven execution | [repo](https://github.com/multica-ai/andrej-karpathy-skills) |
| **Ponytail** | Lazy senior developer mode: YAGNI ladder, shortest diff, no speculative abstractions, deletion over addition | built-in Claude Code plugin |
| **Agent Skills (Vercel)** | Standard skills CLI + registry: `npx skills add <repo>` — also ships vercel-optimize, react-best-practices, writing-guidelines | [agentskills.io](https://agentskills.io) · [repo](https://github.com/vercel-labs/agent-skills) |

---

## Research & Understanding

> Skills for researching topics, understanding codebases, and tracking real-time information.

See [`research-understanding.md`](research-understanding.md) for detailed descriptions and usage.

| Skill | What it does | Source |
|---|---|---|
| **Graphify** | Reads any folder and builds a persistent knowledge graph — 71.5× fewer tokens per query vs raw files; multimodal (code, PDFs, images, diagrams) | [repo](https://github.com/Graphify-Labs/graphify) |
| **Agent Reach** | Gives agents direct access to X, Reddit, YouTube, TikTok, LinkedIn — walled gardens they can't normally search | [repo](https://github.com/Panniantong/agent-reach) |
| **Understand Anything** | Multi-agent pipeline that builds an interactive knowledge graph dashboard of any codebase, with code tours and per-file learning explanations | [repo](https://github.com/Egonex-AI/Understand-Anything) |
| **Last 30 Days** | Search engine scored by real engagement (upvotes, likes, Polymarket odds) — searches Reddit, X, YouTube, TikTok, HN, GitHub in parallel | [repo](https://github.com/mvanhorn/last30days-skill) |
| **Career Ops** | AI job search agent: checks listings are still open, scores fit, tailors CV, drafts answers | [repo](https://github.com/career-ops-hq/career-ops) |
| **REA** | Reverse Engineer Anything — MCP server that bridges agents to Hopper, Ghidra, and native RE tools | [rea.tools](https://rea.tools) · [repo](https://github.com/morluto/rea) |

---

## Large Projects & Token Management

> Skills for when the project is too big or the context window fills up.

See [`large-projects.md`](large-projects.md) for detailed descriptions and usage.

| Skill | What it does | Source |
|---|---|---|
| **GStack** | Virtual engineering team: CEO, eng manager, designer, reviewer, QA, security officer, release engineer — all slash commands | [repo](https://github.com/garrytan/gstack) |
| **Caveman** | 33% fewer input tokens: terse agent voice + block representations for large tool outputs; Auto mode routes tasks to cheaper models | [caveman.so](https://caveman.so) · [repo](https://github.com/juliusbrussee/caveman) |
| **Claude-Mem** | Persistent file-based memory across sessions — user preferences, project context, recurring patterns, work history | [repo](https://github.com/thedotmack/claude-mem) |
| **Headroom** | Context compression layer: 21–57% fewer input tokens on tool outputs, logs, RAG chunks — runs on your machine, nothing sent externally | [repo](https://github.com/headroomlabs-ai/headroom) |
| **GSD Core** | Context-engineering framework: runs heavy work in fresh 200k-token subagents, keeps main session lean; Discuss→Plan→Execute→Verify→Ship loop | [repo](https://github.com/open-gsd/gsd-core) |
| **BMad Method** | Agile AI-driven development: multi-agent personas (PM, architect, developer, reviewer, QA), sizes itself to the work | [repo](https://github.com/bmad-code-org/bmad-method) |

---

## Networking & System

> Skills for diagnosing Wi-Fi, home network performance, and connectivity issues.

See [`networking.md`](networking.md) for detailed descriptions and v1 vs. v2 comparison.

| Skill | What it does | Version |
|---|---|---|
| **Wi-Fi Diagnostics** | Sequential 4-step audit: PHY/RF scan → idle latency → DNS comparison → throughput/bufferbloat — ranked bottleneck list + before/after table | v1 — standard |
| **Wi-Fi Diagnostics Pro** | Everything in v1 + Wi-Fi 6E/7, MIMO streams, WPA3, mesh backhaul, MTU/fragmentation, QoS/DSCP, SQM/CAKE detection, bufferbloat grade, extended comparison table | v2 — enhanced |

---

## Writing & Video

> Skills for content creation, media production, writing quality, and presentation generation.

See [`writing-video.md`](writing-video.md) for detailed descriptions and usage.

| Skill | What it does | Source |
|---|---|---|
| **Anthropic Official Skills** | Anthropic's maintained skill collection | Claude Code marketplace |
| **Generative Media Skills** | 153 skills across 25 categories: image, video, audio, voice, music, 3D, avatar — full media production chain | [repo](https://github.com/calesthio/generative-media-skills) |
| **Hyperframes** | HeyGen's structured video and animation production suite — animation timelines, audio layers, keyframe design | built-in Claude Code plugin |
| **Humanizer** | Makes AI-written text sound human — built on Wikipedia's Signs of AI Writing guide; 26 patterns, 16/16 blind test preference | [repo](https://github.com/blader/humanizer) |
| **I Have ADHD** | Action-first outputs: answer before context, numbered steps, no openers/closers, code blocks always | [repo](https://github.com/ayghri/i-have-adhd) |
| **Marketing Skills** | 35+ marketing skills: SEO, CRO, copywriting, ads, analytics, growth, sales enablement, strategy | [repo](https://github.com/coreyhaines31/marketingskills) |
