---
name: mobile-agent-testers
description: Deploy 20 AI testers simultaneously across iOS Simulators and Android emulators. Use when asked to test a mobile app, find bugs across devices, reproduce issues, or run exploratory QA without writing test scripts.
---

# Mobile Agent Testers

Deploy 20 Claude Code agents simultaneously across iOS Simulators and Android emulators on GitHub's free runners. Each agent assumes a different persona — device type, language, accessibility setting — and explores your app like a real user.

## Setup

```bash
# Create your own repo from the template
gh repo create my-testers --public --template pierridotite/mobile-agent-testers --clone
cd my-testers && ./setup.sh
```

Or via Claude Code plugin:
```
/plugin marketplace add pierridotite/mobile-agent-testers
```

## Testing Modes

| Mode | What it does |
|------|-------------|
| **Exploratory** | New-user personas navigate freely, report obstacles with screenshots |
| **Feature-specific** | Guided workflows through complex mechanics (bookings, editors, etc.) |
| **Bug reproduction** | Verify a reported issue across multiple devices simultaneously |
| **Improvement reports** | Identify friction points and suggest UX enhancements |
| **Version comparison** | Side-by-side testing across branches |

## Supported Frameworks

Flutter · React Native · Expo · native Kotlin/Swift · MAUI · Capacitor

## Personas (20 simultaneous)

Each agent runs a distinct profile — examples:
- Swedish user, large text enabled
- Arabic RTL layout
- 200% zoom / accessibility mode
- Various iPhone SE / older Android device sizes
- Different OS versions

## Cost

~$0.15–$0.55 per simulated device per run. Free GitHub runners for public repos.

## Real-World Result

LocalSend run: 46 bugs found including a blocker on iPhone SE.

## Resources

- Repo / template: [github.com/pierridotite/mobile-agent-testers](https://github.com/pierridotite/mobile-agent-testers)
