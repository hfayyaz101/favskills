---
name: strix-pentest
description: Run AI-powered penetration testing and security scans using Strix. Use when asked to pen test, security scan, vulnerability assess, or run security audits against web applications, APIs, domains, IPs, or source code repositories.
---

# Strix Penetration Testing

AI-powered pen testing that runs autonomous vulnerability assessments inside a Kali Linux Docker sandbox. Finds and validates exploits (OWASP Top 10+) rather than just flagging them.

## Prerequisites

- Docker running
- Claude CLI authenticated (`npm install -g @anthropic-ai/claude-cli && claude login`)
- Python 3.11+
- `screen` (`brew install screen` / `sudo apt install screen`)

## Installation

```bash
git clone https://github.com/tghastings/strix-claude-code.git
cd strix-claude-code
pip install -e .
```

Or via skills CLI:
```bash
npx skills add usestrix/strix
```

## Usage

### TUI Dashboard (recommended)
```bash
strix-claude-tui
```
Keys: `n` new scan · `a <n>` attach · `v <n>` view · `s <n>` stop · `d <n>` delete · `r` refresh · `q` quit  
Detach: `Ctrl+A` then `D`

### CLI Direct
```bash
# Deep scan (default)
strix-claude-cli -t https://target.com

# Quick scan for CI/CD
strix-claude-cli -t https://target.com -m quick

# Standard scan with focus
strix-claude-cli -t https://target.com -m standard --instruction "Focus on authentication bypass"

# Multiple targets / whitebox
strix-claude-cli -t https://app.com -t ./source-code

# GitHub repo scan
strix-claude-cli -t https://github.com/user/repo -m deep

# Custom output path
strix-claude-cli -t https://target.com -o ~/reports/scan.md
```

### Scan Modes
| Mode | Use case | Time |
|------|----------|------|
| `quick` | CI/CD, critical vulns only | 5–10 min |
| `standard` | Balanced automated + targeted | 15–30 min |
| `deep` | Full recon, vuln chaining, exhaustive | 30–60+ min |

## What Runs in the Sandbox

Claude gets: nmap, nuclei, sqlmap, ffuf, dirsearch, subfinder, httpx, semgrep, bandit, trufflehog, zaproxy, wapiti, trivy, jwt_tool, Playwright browser, Caido HTTP proxy.

## Output

- `penetration_test_report.md` — executive summary + findings with CVSS scores
- `vulnerabilities/*.md` — one file per validated finding with PoC + remediation
- `findings.sarif` — SARIF 2.1.0 for GitHub code scanning / ASPM ingestion

## Ethical Use

Authorized security testing only. Obtain written permission, respect scope, follow responsible disclosure, comply with CFAA/GDPR/applicable laws.
