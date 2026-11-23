# Senior Developer Skills

Skills that make AI coding agents think, plan, and execute like a senior engineer — not a code monkey that runs with the first interpretation, over-engineers everything, and breaks adjacent code on the way.

---

## 1. Superpowers

**Repo:** https://github.com/anthropics/claude-code (bundled with Claude Code)
**Skill copy:** built-in plugin — `superpowers:*`

### What it is

Superpowers is Anthropic's meta-skill framework for Claude Code — a collection of process skills that govern how the agent approaches complex tasks. Rather than diving straight into code, it enforces structured workflows for each task type.

### Skills in the suite

| Skill | What it enforces |
|---|---|
| `brainstorming` | Turn ideas into designs through dialogue before any code is written |
| `systematic-debugging` | Root-cause first; trace the actual flow before changing anything |
| `writing-plans` | Detailed implementation plans saved to docs before execution |
| `executing-plans` | Follow a written plan step by step, marking progress |
| `test-driven-development` | Tests define success criteria; red → green → refactor |
| `dispatching-parallel-agents` | Coordinate multiple agents for independent subtasks |
| `using-git-worktrees` | Isolated branches per task via git worktrees |
| `finishing-a-development-branch` | Checklist before merging: tests, review, cleanup |
| `requesting-code-review` | Structured code review requests with context |
| `receiving-code-review` | Systematic response to review feedback |
| `verification-before-completion` | Verify the task actually works before claiming done |
| `writing-skills` | Write new agent skills following the spec |
| `using-superpowers` | Meta: how to find and invoke all other skills |

### Install

Pre-installed in Claude Code. Invoke via:
```
/plugin marketplace add anthropics/superpowers
```

---

## 2. Matt Pocock Skills

**Repo:** TBD — not yet publicly available
**Skill copy:** N/A

### What it is

Skills from TypeScript educator Matt Pocock (creator of Total TypeScript) focused on TypeScript best practices, type system mastery, and advanced patterns. Description TBD pending public availability.

---

## 3. ECC (Engineering Coordination Core)

**Repo:** https://github.com/affaan-m/ECC
**Site:** https://ecc.tools
**Skill copy:** no single SKILL.md — installed as a plugin

### What it is

ECC is an agent harness operating system: an engineering coordination layer that installs on top of Claude Code, Codex, Cursor, and 7+ other harnesses. Rather than individual skills, it ships a full engineering process — plan → test → implement → review → verify → remember → improve — that the agent runs automatically instead of needing it re-explained every session.

The scope is significant: 72 specialized agents, 328 skills, and 99 legacy command shims covering TDD, research, security, docs, frontend, data, ML, and operations. It also ships runtime enforcement via hooks, session summaries, continuous learning, and AgentShield security scanning (prompt injection, secrets in hooks, permissions auditing).

### Key features

- **Plan before build** — always produces a written plan before writing code
- **Self-review** — dedicated review agent reads the diff from a fresh context, catching bugs tests miss
- **AgentShield** — scans prompts, hooks, MCP config, and agent files for security issues
- **Continuous learning** — saves patterns from successful sessions; improves over time
- **72 specialized agents** — planning, review, build repair, security, architecture, domain work
- **Cross-harness** — Claude Code, Codex, Qoder, Cursor, OpenCode, GitHub Copilot, Zed, and more

### Install

```bash
# Claude Code
/plugin marketplace add ecc@ecc
/plugin install ecc@ecc
```

---

## 4. Karpathy Skills

**Repo:** https://github.com/multica-ai/andrej-karpathy-skills
**Skill copy:** [`skills/karpathy-skills/SKILL.md`](skills/karpathy-skills/SKILL.md)

### What it is

A single CLAUDE.md / SKILL.md derived from Andrej Karpathy's observations on common LLM coding failures. Four behavioral principles that directly counter the most common ways agents go wrong: making silent wrong assumptions, over-engineering, touching code they shouldn't, and failing to define verifiable success criteria.

### The four principles

| Principle | Addresses |
|---|---|
| **Think Before Coding** | Don't assume silently; surface confusion; present tradeoffs; push back |
| **Simplicity First** | No features beyond what was asked; no speculative abstractions; if 200 lines could be 50, rewrite |
| **Surgical Changes** | Touch only what the task requires; don't improve adjacent code; every changed line traces to the request |
| **Goal-Driven Execution** | Transform tasks into verifiable goals; write tests that reproduce the bug before fixing it |

### Install

```bash
npx skills add multica-ai/andrej-karpathy-skills --skill "karpathy-guidelines"
```

---

## 5. Ponytail

**Repo:** https://github.com/juliusbrussee/caveman (bundled as a Claude Code plugin)
**Skill copy:** built-in plugin — `ponytail:*`

### What it is

Ponytail is a lazy senior developer mode for Claude Code. "Lazy" means efficient, not careless — it enforces a strict decision ladder before writing any code: Does this need to exist? Is it already in the codebase? Does stdlib do it? Does the native platform cover it? Can it be one line? Only then: the minimum code that works.

The mode prevents the most common agent failure modes: speculative features, premature abstractions, boilerplate for cases that never arise, and clever solutions that require decoding at 3am.

### The decision ladder

1. **Does this need to exist at all?** (YAGNI — skip speculative needs)
2. **Already in this codebase?** (search before reimplementing)
3. **Stdlib does it?** (use it)
4. **Native platform covers it?** (`<input type="date">` over a picker lib)
5. **Already-installed dependency solves it?** (use it, never add new deps for what a few lines can do)
6. **Can it be one line?** (one line)
7. **Only then:** minimum working code

### Install

```
/plugin marketplace add juliusbrussee/caveman
/plugin install ponytail@ponytail
```

---

## 6. Agent Skills (Vercel)

**Repo:** https://github.com/vercel-labs/agent-skills
**Site:** https://agentskills.io
**Skill copy:** no single SKILL.md — it's the skills CLI and registry

### What it is

The Vercel-maintained agent skills framework and registry. `npx skills` is the standard CLI for installing skills from any repo that follows the Agent Skills spec. The repo itself ships four production skills:

| Skill | What it does |
|---|---|
| `web-design-guidelines` | UI code review against 100+ accessibility, performance, and UX rules |
| `vercel-optimize` | Audits a deployed Vercel project for cost, performance, caching, and billing opportunities |
| `react-best-practices` | 40+ React/Next.js performance rules across 8 categories from Vercel Engineering |
| `writing-guidelines` | 80+ rules for voice, structure, code samples, and typography from the Vercel writing handbook |

### Install CLI

```bash
# Install the skills CLI globally
npm install -g @vercel/skills

# Install any skill from any repo
npx skills add <repo> --skill <name>
npx skills add <repo> -g   # global install across all projects
```
