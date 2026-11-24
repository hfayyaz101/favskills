---
name: meetily
description: Search and read your local meeting transcripts and summaries via Meetily MCP. Use when asked about past meetings, decisions, action items, or anything that was discussed or agreed in a recorded meeting.
---

# Meetily — Meeting Transcripts in Claude Code

Meetily Pro ships a built-in MCP server. Once connected, Claude Code can search your meetings, read full transcripts, extract summaries, and start/stop recordings — all from meeting data stored entirely on your machine.

## Setup

1. Install [Meetily](https://meetily.ai) (Mac/Windows/Linux — free, open source)
2. Open Meetily → **Settings → Integrations → MCP Server**
3. Toggle on **Claude Code**, choose read-only or record access
4. Start a new Claude Code session — Meetily tools load automatically

## What Claude Can Do

```
# Find decisions from a specific meeting
Search my meetings for "API architecture" and list what was decided

# Get action items
Read the transcript from yesterday's standup and list all action items with owners

# Technical follow-up
Read Monday's architecture review and list the API changes we agreed on

# Summarize a meeting
Summarize the Q3 planning meeting as a bullet-point brief

# Start/stop recording (if write access granted)
Start recording this meeting
```

## Available MCP Tools (once connected)

| Tool | What it does |
|------|-------------|
| `search_meetings` | Full-text search across all transcripts |
| `read_transcript` | Full transcript of a specific meeting |
| `read_summary` | AI-generated summary + key decisions |
| `list_meetings` | Recent meetings with metadata |
| `start_recording` | Begin recording (requires write access) |
| `stop_recording` | Stop active recording |

## Privacy

- Transcription runs on-device via Whisper or Parakeet — nothing leaves your machine
- MCP server is local HTTP only
- Granular per-tool permissions (read-only by default)
- No meeting bot joins calls; records system audio locally

## Export

```bash
# Export a meeting as Markdown for use in another tool
meetily-pro meetings export <meeting-id> --format md
```

## Resources

- Repo: [github.com/Zackriya-Solutions/meetily](https://github.com/Zackriya-Solutions/meetily)
- MCP docs: [meetily.ai/mcp](https://meetily.ai/mcp)
