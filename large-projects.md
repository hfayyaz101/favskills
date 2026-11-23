# Large Projects & Token Management Skills

Skills for when the project is too big, the context window fills up, or the agent loses track of the bigger picture. These skills tackle context rot, token budgets, coordination across sessions, and running full engineering workflows on large codebases.

---

## 1. GStack

**Repo:** https://github.com/garrytan/gstack
**Author:** Garry Tan, President & CEO of Y Combinator
**Skill copy:** no local copy — git-based install

### What it is

GStack turns Claude Code into a virtual engineering team: a CEO who rethinks the product, an eng manager who locks architecture, a designer who catches AI slop, a reviewer who reads the diff for production bugs, a QA lead who opens a real browser, a security officer who runs OWASP + STRIDE audits, and a release engineer who ships the PR. All slash commands, all Markdown, all free, MIT-licensed.

A November 2026 benchmark note from the README: on 100 everyday GitHub bugs, Claude Opus 5.5 fixed 58 with gstack vs 61 without — so gstack gives no raw fix-rate boost. Use it for the **workflow, reviews, shipping steps, and safety guards**, not for fixing more bugs.

### Key commands

| Command | What it does |
|---|---|
| `/office-hours` | Rethinks your product framing; writes a design doc all other skills read |
| `/review` | Reads the diff for bugs tests miss: race conditions, N+1s, broken trust boundaries |
| `/qa` | Opens a real browser on staging, reproduces bugs, fixes them |
| `/autoplan` | Reviews a plan end to end before execution begins |
| `/ship` | Runs tests, review, and the PR with evidence on the PR description |
| `/cso` | OWASP + STRIDE security audit (requires native toolchain) |

### Install

Open Claude Code and paste:
```
Install gstack: run git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup
```

---

## 2. Caveman

**Repo:** https://github.com/juliusbrussee/caveman
**Site:** https://caveman.so
**Skill copy:** no local copy — plugin install

### What it is

Caveman makes AI agents say less and read less without changing what they do. The core insight: AI prose is 3× more tokens than necessary. Caveman installs two things: a **voice** (terse structured output from the agent) and **blocks** (token-efficient representations for large tool outputs like test runs, file trees, and JSON arrays).

Measured results from the README: 33.2% fewer input tokens across whole sessions; 397 → 76 tokens for one test run output. Cited by Adobe Research, A/B tested by JetBrains.

### The two mechanisms

**Say less (voice):** Installs a caveman output mode — agents respond in telegraphic style that preserves all meaning at a fraction of the tokens.
```
Normal:  "The reason your React component is re-rendering is likely because..."  (63 tokens)
Caveman: "useMemo on the prop object in ComponentName"  (9 tokens)
```

**Read less (blocks):** Structured representations for large outputs. A `jest --verbose` run that produces 400 lines of output becomes a compact structured block the agent reads in 20 tokens instead of 400.

**Auto mode:** Routes tasks between models automatically — uses cheaper/faster models for simple steps, reserves expensive models for the hard parts.

### Install

```bash
npm install -g @caveman-ai/cli
caveman install
```

---

## 3. Claude-Mem

**Repo:** https://github.com/thedotmack/claude-mem
**Skill copy:** built-in plugin — `claude-mem:*`

### What it is

Claude-Mem solves the fundamental problem: your coding agent forgets everything between sessions. It gives Claude Code a persistent file-based memory system — user preferences, project context, recurring patterns, feedback you've given — that loads automatically at the start of each session.

### Skills in the suite

| Skill | What it does |
|---|---|
| `do` | Execute a task with memory context loaded |
| `mem-search` | Search stored memories |
| `smart-explore` | Explore a codebase and build memory from it |
| `learn-codebase` | Deep read of a codebase, stored in memory |
| `make-plan` | Create implementation plans, persisted in memory |
| `standup` | Generate a standup summary from memory |
| `timeline-report` | Timeline of work done from memory |
| `babysit` | Monitor long-running tasks |
| `knowledge-agent` | Build and query a knowledge base |
| `pathfinder` | Navigate complex codebases using stored maps |
| `what-the` | Explain what a piece of code does |
| `oh-my-issues` | Surface issues from memory |
| `weekly-digests` | Weekly summary of work from memory |

### Install

```
/plugin marketplace add thedotmack/claude-mem
/plugin install claude-mem@do
```

---

## 4. Headroom

**Repo:** https://github.com/headroomlabs-ai/headroom
**Skill copy:** no local copy — library install

### What it is

Headroom is a context compression layer that runs between your code and the LLM. It compresses tool outputs, logs, RAG chunks, files, and conversation history before they reach the model — same answers, fewer input tokens. The compression runs entirely on your machine; nothing is sent to a third party to compress.

Measured results from the README: 21–57% fewer input tokens on four agent scenarios; 90%+ reduction on repeated JSON arrays and log lines. Compression is minimal on prose.

### Key features

- One-line integration: `result = compress(messages, model="gpt-4o")`
- Compresses tool and assistant messages; leaves user messages alone
- `HEADROOM_OFFLINE=1` for zero-network runs
- Claude Code skill + MCP server + Python/npm library
- `kompress-v2-base` model runs in-process, no API key

### Install

```bash
# Python
pip install headroom-ai

# Node.js
npm install headroom-ai
```

```python
from headroom import compress
result = compress(messages, model="claude-opus-4-8")
client.messages.create(model="claude-opus-4-8", messages=result.messages)
```

---

## 5. GSD Core (Git. Ship. Done.)

**Repo:** https://github.com/open-gsd/gsd-core
**Skill copy:** no local copy — npm installer

### What it is

GSD Core is a context-engineering and spec-driven development framework that solves context rot — the quality degradation that accumulates as an AI fills its context window on a large project. It runs all heavy research, planning, and execution work in fresh-context subagents, keeping your main session lean.

Each milestone repeats a five-step loop: Discuss → Plan → Execute → Verify → Ship. Executors run in parallel waves, each starting with a clean 200k-token context. Plans are verified to fit a fresh context before execution begins.

### The five-step loop

| Phase | What happens |
|---|---|
| **Discuss** | Capture implementation decisions before anything is planned |
| **Plan** | Research, decompose, verify the plan fits a fresh context window |
| **Execute** | Run plans in parallel waves; each executor starts with 200k clean context |
| **Verify** | Walk through what was built; diagnose and fix before declaring done |
| **Ship** | Create the PR, archive the phase, repeat for the next milestone |

### Install

```bash
npx @opengsd/gsd-core@latest
# Then:
/gsd-new-project   # greenfield
/gsd-onboard       # existing codebase
```

---

## 6. BMad Method

**Repo:** https://github.com/bmad-code-org/bmad-method
**Skill copy:** no local copy — npm installer

### What it is

BMad is an agile AI-driven development method that keeps decisions explicit, context forward, and process sized to the work. Small changes go straight to build; complex work gets the full depth it needs. The same method covers a weekend prototype and a system with years of history.

The core loop: Clarify → Plan → Build and verify → Learn and adjust. It sizes itself automatically — a vague notion starts at Clarify, a big clear idea at Plan, and a small change goes straight to Build. A multi-agent approach dispatches specialized personas: PM, architect, developer, reviewer, QA — each with a focused context window.

### Key skills (v7 preview)

| Skill | What it does |
|---|---|
| `bmad` | Setup, help, and status — the main entry point |
| `bmad-build` | Drive a build iteration end to end |
| `bmad-new-project` | Bootstrap a new project with BMad structure |
| Toolsmith module | Builds, converts, and reviews skills/agents |
| Founder module | Nadia the Founder Advisor for startup business coaching |

### Install

```bash
# Stable v6.12
npx bmad-method install

# v7 preview
npx skills add bmad-code-org/BMAD-METHOD/skills/core-tools --skill '*'
npx skills add bmad-code-org/BMAD-METHOD/skills/method --skill '*'
```
