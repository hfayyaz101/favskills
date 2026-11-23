# Writing & Video Skills

Skills for content creation, media production, writing quality, presentation generation, and video workflows.

---

## 1. Anthropic Official Skills

**Source:** Claude Code marketplace
**Skill copy:** built-in — see Claude Code marketplace

### What it is

Anthropic ships a growing set of official skills directly in the Claude Code marketplace. These are maintained by Anthropic and cover core workflows across coding, writing, and research. Browse and install directly:

```
/plugin marketplace
```

---

## 2. Generative Media Skills (Open Montage)

**Repo:** https://github.com/calesthio/generative-media-skills
**Related:** https://github.com/calesthio/OpenMontage
**Skill copy:** no local copy — 153-skill collection

### What it is

The whole media production suite for AI agents: 150+ research-backed skills across 25 categories for creating, directing, validating, and delivering image, video, audio, voice, music, 3D, avatar, and interactive media. It combines current provider intelligence (model cards, pricing, API references) with executable guardrails so agents can move from a creative brief to a shippable deliverable.

Pairs with [OpenMontage](https://github.com/calesthio/OpenMontage) for the same production intelligence inside an orchestrated media workflow.

### Coverage (153 skills across 25 categories)

| Family | Categories |
|---|---|
| **Providers** | Image generation (18), Video generation, Audio enhancement, Avatar video (5), 3D generation (3), Image understanding, Lip sync, Motion capture |
| **Directing** | Cinematography, Lighting, Performance, Production design, Visual continuity |
| **Sound** | Music direction, Sound design, Editing |
| **Deliverables** | Ads, Launch films, Social shorts, Explainers, Game trailers, Product imagery, Podcasts, Real-estate media |
| **QA & Delivery** | Provenance/rights, Localization, Platform requirements, Manifests, Final QA |

### Key differentiators

- Current provider intelligence: skills cite official docs with verification dates for volatile facts
- Executable guardrails: deterministic checks in tested scripts instead of improvised code blocks
- `EVAL.md` per skill with scoring criteria (repository-only — not in public bundle)
- Provider-independent: production skills remain useful when models change

### Install

Point your agent at the repo:
```text
Use generative-media-skills from https://github.com/calesthio/generative-media-skills.
Load the necessary skills for: [your task]
```

---

## 3. Hyperframes

**Repo:** https://github.com/heygen-com/hyperframes
**Skill copy:** built-in plugin — `hyperframes:*`

### What it is

HeyGen's Hyperframes skill suite for structured video and animation production inside AI agents. Ships as a full plugin with sub-skills for different production aspects.

### Skills in the suite

| Skill | What it covers |
|---|---|
| `hyperframes-core` | Core Hyperframes primitives and composition |
| `hyperframes-animation` | Animation timelines and keyframe design |
| `hyperframes-audio` | Audio layer design and synchronization |
| `hyperframes-cli` | CLI workflow for Hyperframes projects |
| `hyperframes-creative` | Creative direction and visual storytelling |
| `hyperframes-keyframes` | Keyframe sequencing and interpolation |
| `hyperframes-registry` | Managing Hyperframes component registry |

### Install

```
/plugin marketplace add heygen-com/hyperframes
/plugin install hyperframes@hyperframes-core
```

---

## 4. Humanizer

**Repo:** https://github.com/blader/humanizer
**Skill copy:** [`skills/humanizer/SKILL.md`](skills/humanizer/SKILL.md)

### What it is

Humanizer makes AI-written text sound like a person wrote it without changing what it says. Built on Wikipedia's [Signs of AI Writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) guide — the same checklist Wikipedia editors use to catch AI-generated text.

In a blind test, judges preferred Humanizer's output over the original AI text 16/16 times. Important caveat from the README: it edits for human readers, not to evade AI detectors — detectors still flag most of its output.

### The five strongest AI tells it removes

1. **Not X but Y:** "It's not just a feature, it's a shift."
2. **One-line closers:** "Let that sink in."
3. **Sayings that sound deep:** "At its core, what really matters is..."
4. **Staged run-ups:** "Here's the thing." "Honestly?" "The hard part is..."
5. **Arguing with no one:** "I'm not saying X, but..."

Checks 26 patterns in total.

### Install

```
# Claude Code
/plugin marketplace add blader/humanizer
/plugin install humanizer@humanizer
```

---

## 5. I Have ADHD

**Repo:** https://github.com/ayghri/i-have-adhd
**Skill copy:** [`skills/i-have-adhd/SKILL.md`](skills/i-have-adhd/SKILL.md)

### What it is

A skill that stops the agent from burying the answer. Action first. Steps numbered. No "Hope this helps!" The name is the brief: ADHD-friendly outputs — available to everyone regardless of diagnosis.

### Before / After

**Before:**
> Great question! Let me think about this. Your auth flow has a few moving pieces... One approach would be to update the package and rewrite that function... By the way, you might also want to look at your dependency versions overall. Hope this helps!

**After:**
> Edit `src/auth.ts:42` to update the token validation.
> 1. Open `src/auth.ts`...

### What changes

- Leads with the action or file path, not context
- Steps numbered, not buried in paragraphs
- No openers ("Great question!"), no closers ("Hope this helps!")
- Code blocks for all code, not inline

### Install

```text
# Paste in your agent prompt:
Install the i-have-adhd skill from https://github.com/ayghri/i-have-adhd
```

---

## 6. Marketing Skills

**Repo:** https://github.com/coreyhaines31/marketingskills
**Author:** Corey Haines (Swipe Files, Conversion Factory)
**Skill copy:** no local copy — 35+ skill collection

### What it is

A collection of AI agent skills for marketing tasks: conversion optimization, copywriting, SEO, analytics, and growth engineering. Built for technical marketers and founders who want their AI coding agent to be their CMO, not just their coder.

Skills reference each other. `product-marketing` is the foundation — every other skill reads it first to understand your product, audience, and positioning before doing anything.

### Skill categories

| Category | Skills |
|---|---|
| **SEO & Content** | seo-audit, ai-seo, site-architecture, programmatic-seo, schema, content-strategy, aso, link-building |
| **CRO** | cro, signup-optimization, onboarding, popups, paywalls |
| **Copy** | copywriting, copy-editing, cold-email, emails, social, video, image, SMS |
| **Paid & Analytics** | ads, ad-creative, a/b-testing, analytics |
| **Growth & Retention** | referrals, free-tools, churn-prevention, community, lead-magnets, co-marketing |
| **Sales & GTM** | revops, sales-enablement, launch, pricing, competitors, prospecting |
| **Strategy** | marketing-ideas, marketing-psychology, customer-research, reverse-engineering |

### Install

```bash
npx skills add coreyhaines31/marketingskills
```
