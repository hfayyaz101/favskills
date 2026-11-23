# Research & Understanding Skills

Skills for making AI agents better at researching topics, understanding codebases, reverse engineering systems, tracking current information, and managing career workflows.

---

## 1. Graphify

**Repo:** https://github.com/Graphify-Labs/graphify
**Skill copy:** no local copy — requires Python install

### What it is

Graphify is a Claude Code skill that reads any folder of files and builds a persistent knowledge graph from it — code, PDFs, markdown, screenshots, diagrams, whiteboard photos, even images in other languages. It uses Claude vision to extract concepts and relationships from all media types, connects them into one graph, and delivers an interactive HTML browser you can explore.

The key insight from the README: Karpathy keeps a `/raw` folder of papers, tweets, screenshots, and notes. Graphify answers that problem — 71.5× fewer tokens per query versus reading raw files, and the graph persists across sessions so you don't re-process everything every time.

### Key features

- `/graphify .` works on any folder: codebase, notes collection, research papers, anything
- Fully multimodal — extracts from code, PDFs, images, diagrams, whiteboard photos
- SHA-256 cache — re-runs only process changed files
- Interactive HTML output with clickable nodes, search, and community filtering
- Obsidian vault export
- `/graphify query "what connects X to Y?"` for natural-language graph traversal
- `--watch` mode for live sync as files change
- `--wiki` builds a crawlable Wikipedia-style index (one article per topic community)

### Output structure

```
graphify-out/
├── graph.html       interactive browser
├── obsidian/        Obsidian vault
├── wiki/            agent-crawlable Wikipedia-style articles
├── GRAPH_REPORT.md  god nodes, surprising connections, suggested questions
├── graph.json       persistent graph (query weeks later)
└── cache/           SHA256 cache
```

### Install

```bash
pip install graphifyy && graphify install
# Then in Claude Code:
/graphify .
```

---

## 2. Agent Reach

**Repo:** https://github.com/Panniantong/agent-reach
**Skill copy:** no local SKILL.md — Python-based tool

### What it is

Agent Reach gives AI agents direct access to walled-garden platforms they can't normally touch: X (Twitter), Reddit, YouTube, TikTok, LinkedIn, Xiaohongshu (Little Red Book), and more. Each platform is a separate module that handles its own authentication and scraping, returning structured data the agent can reason over.

The core problem it solves: Google search doesn't touch Reddit comments or X posts. ChatGPT has a Reddit deal but can't search X or TikTok. Gemini has YouTube but not Reddit. Agent Reach bridges all of them in one framework so an agent can search multiple platforms simultaneously, score results against each other, and synthesize what actually matters.

### Key features

- Modular platform connectors: X, Reddit, YouTube, TikTok, LinkedIn, Xiaohongshu
- Returns structured data (not raw HTML) for agent consumption
- Python-based with bring-your-own credentials
- Pairs well with `/last30days` for scored real-time research

### Install

```bash
pip install agent-reach  # or see repo for per-platform setup
```

---

## 3. Understand Anything

**Repo:** https://github.com/Egonex-AI/Understand-Anything
**Skill copy:** no local copy — full plugin with dashboard

### What it is

An open-source Claude Code plugin combining LLM intelligence and static analysis to produce interactive dashboards for understanding codebases. Where graphify builds a topic graph from any files, Understand Anything is specifically architected for code — it produces a navigable knowledge graph of your codebase with source links, code tours, and per-file learning explanations.

The plugin dispatches a multi-agent pipeline: a project scanner, file analyzer, architecture analyzer, tour builder, code-lesson writer, and graph reviewer — each writing intermediate results to disk before the next reads them. The final output is a React dashboard (dark gold theme, graph-first layout) you open in a browser.

### Key features

- `/understand` — builds the full knowledge graph from a codebase
- `/understand-dashboard` — opens the interactive graph browser
- `/understand-diff` — explains what changed in a diff
- `/understand-explain` — deep explanation of a specific file or concept
- `/understand-onboard` — generates an onboarding tour for a new contributor
- MCP server for external clients (Devin, etc.)
- Persistent graph at `.ua/knowledge-graph.json` — query weeks later without re-reading

### Install

```bash
# Claude Code plugin
/plugin marketplace add Egonex-AI/Understand-Anything
```

---

## 4. Last 30 Days

**Repo:** https://github.com/mvanhorn/last30days-skill
**Skill copy:** [`skills/last30days/SKILL.md`](skills/last30days/SKILL.md)

### What it is

An AI agent-led search engine scored by real human engagement — upvotes, likes, real money — not editors. `/last30days` searches Reddit, X, YouTube, TikTok, Polymarket, HN, GitHub, patents, careers pages, and arXiv in parallel, scores results by what people actually engage with and bet on, and an AI judge synthesizes it into one brief.

The practical gap it fills: "You have a meeting tomorrow. You Google the person and get their LinkedIn from 2023. `/last30days` gives you what they're actually doing this month."

### Key features

- Parallel search across 10+ platforms simultaneously
- Scoring by engagement (upvotes, likes, watch time) and money (Polymarket odds)
- Zero-config start: Reddit, HN, Polymarket, GitHub work immediately
- 30-second setup wizard unlocks X, YouTube, TikTok, arXiv, Techmeme
- AI judge synthesizes all results into one structured brief

### Install

```bash
# Claude Code (auto-updates via marketplace)
/plugin marketplace add mvanhorn/last30days-skill
/plugin install last30days

# Any agent via skills CLI
npx skills add mvanhorn/last30days-skill -g
```

---

## 5. Career Ops

**Repo:** https://github.com/career-ops-hq/career-ops
**Skill copy:** no local copy — full application

### What it is

The open-source AI job search agent. Built by the creator after sending CVs into silence: 740 listings evaluated, 68 applied, 12 interviews, 1 offer. It was his first user; he got the job, then open-sourced it.

Paste a job URL. On your machine it checks whether the listing is still open, scores how well it fits your profile, tailors your CV, drafts your cover letter answers, and shows all results in a dashboard. You press Submit.

### Key features

- Local: nothing leaves your machine
- Checks if listings are still open (saves applying to ghost jobs)
- Scores fit against your profile
- Tailors CV and drafts answer text per listing
- Dashboard UI with scored listings and do-not-apply flags
- 800+ contributors, 20+ languages

### Install

```bash
# Claude Code
/plugin marketplace add career-ops-hq/career-ops
```

---

## 6. REA (Reverse Engineer Anything)

**Repo:** https://github.com/morluto/rea
**Site:** https://rea.tools
**Skill copy:** no local copy — MCP-based tool

### What it is

REA is a single MCP server for reverse engineering across binaries, applications, and runtime behavior. It bridges AI agents to native reverse engineering tools (Hopper, Ghidra, etc.) so an agent can analyze native binaries, trace runtime behavior, and understand how features are implemented down to the binary level.

The tagline: "See a feature you like. Understand how it works, down to the binary level."

### Key features

- Connects agents to Hopper, Ghidra, and other RE tools via MCP
- Analyze native binaries, apps, and runtime behavior
- Trace function calls, memory patterns, network traffic
- Cross-platform: macOS, Windows, Linux
- Can build RL training environments from reverse-engineered behavior

### Install

```bash
npx rea-agents setup
# or
npm install -g rea-agents
```
