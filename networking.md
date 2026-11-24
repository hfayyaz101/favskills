# Networking & System

> Skills for diagnosing Wi-Fi, home network performance, and connectivity issues.

---

## Wi-Fi Diagnostics

**v1 — Standard**
[`skills/wifi-diagnostics/SKILL.md`](skills/wifi-diagnostics/SKILL.md)

Runs four sequential checks (Wi-Fi link, idle latency, DNS, throughput) and produces a ranked bottleneck list with router-specific fix recommendations. Ends with a before/after comparison table.

**What it covers:**
- PHY mode, band, channel, channel width, SNR, TX rate
- Gateway + 1.1.1.1 ping (30 packets each), 5-hop traceroute
- DNS latency vs. `1.1.1.1`, `8.8.8.8`, router
- `networkQuality -v` for downlink/uplink/RPM/ECN

---

## Wi-Fi Diagnostics Pro

**v2 — Enhanced**
[`skills/wifi-diagnostics-pro/SKILL.md`](skills/wifi-diagnostics-pro/SKILL.md)

Everything in v1, plus deeper hardware and protocol checks. Designed for Wi-Fi 6/6E/7 setups, mesh networks, and diagnosing bufferbloat or hard-to-explain speed gaps.

**What it adds over v1:**
| Feature | v1 | v2 |
|---------|----|----|
| Wi-Fi 6E / 6 GHz band detection | — | ✓ |
| Wi-Fi 7 (802.11be) support | — | ✓ |
| MIMO spatial streams check | — | ✓ |
| TxPower / regulatory domain | — | ✓ |
| WPA3 / SAE security check | — | ✓ |
| Mesh backhaul quality (band, rate) | — | ✓ |
| DFS channel / radar event check | — | ✓ |
| PSC channel check (6 GHz) | — | ✓ |
| IPv6 latency test | — | ✓ |
| Quad9 (`9.9.9.9`) DNS comparison | — | ✓ |
| DoH latency comparison | — | ✓ |
| MTU / path MTU discovery | — | ✓ |
| Packet fragmentation detection | — | ✓ |
| WMM / QoS queue check | — | ✓ |
| DSCP traffic marking check | — | ✓ |
| SQM / CAKE / fq_codel detection | — | ✓ |
| Bufferbloat letter grade | — | ✓ |
| TX retry rate | — | ✓ |
| Extended before/after table | basic | full |

**Use v1** for a quick diagnosis or when you just need the top 1–2 fixes fast.  
**Use v2** when v1 doesn't surface the issue, you have a mesh or Wi-Fi 6E router, or you want a full audit before/after changing hardware.

---

### Usage

Paste the contents of `SKILL.md` into your Claude Code project as a slash command or prepend to a conversation. No install required — no external tools needed beyond what macOS ships.
