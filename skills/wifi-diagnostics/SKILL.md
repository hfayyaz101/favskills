---
name: wifi-diagnostics
description: Diagnose Wi-Fi and home network, identify real bottlenecks behind slow speeds or instability, and guide through fixing them
---

Diagnose my Wi-Fi and home network, identify the real bottlenecks behind slow speeds or instability, and guide me through fixing them.

Run these checks **sequentially** (do NOT run ping in parallel with throughput tests, so idle latency isn't polluted by load):

## 1. Wi-Fi Link & RF Congestion

Inspect my active Wi-Fi:
- PHY mode (802.11ac/ax/be)
- Band (2.4 / 5 / 6 GHz)
- Channel and channel width (20 / 40 / 80 / 160 MHz)
- Signal/noise ratio (SNR)
- Transmit rate / MCS index
- Interface packet errors

Scan nearby Wi-Fi networks and count competing APs per channel/band to find the cleanest channels in my environment.

## 2. Hop-by-Hop Latency & Stability (while idle)

- Ping my default gateway (30 packets)
- Ping `1.1.1.1` (30 packets, plus IPv6 if active)
- Run a 5-hop traceroute to separate Wi-Fi/LAN jitter from ISP latency
- Check for active local bandwidth hogs, VPNs, proxies, or recent Wi-Fi disconnect/roam events

## 3. DNS Latency

- Check my current DNS servers
- Compare uncached lookup latency against `1.1.1.1`, `8.8.8.8`, and my router

## 4. Throughput & Bufferbloat Under Load

Run `networkQuality -v` (macOS) or equivalent (Linux/Windows) to measure:
- Downlink and uplink throughput
- Idle latency and loaded latency
- Responsiveness (RPM)
- ECN/L4S status

---

## Output

**Baseline summary** — exact measurements from each check above.

**Top bottlenecks ranked by impact** — skip placebo OS tweaks.

**Quick wins:**
- Faster DNS order (safe, local)
- Unlocking 80/160 MHz width on 5/6 GHz
- Enabling Wi-Fi 6 / OFDMA / WMM
- Disabling band steering / Smart Connect if it degrades stability
- Exact cleanest 5 GHz and 2.4 GHz channels (1/6/11 only) based on my local RF scan
- Disabling unused guest SSIDs
- Checking cable/ISP modem signal health (power, SNR, uncorrectable errors) or SQM for bufferbloat

**Router ask** — ask for my router model (or a paste/screenshot of its Wireless Settings page) to give exact click-by-click settings.

---

## After Changes

Re-run the exact same sequential benchmark and output a Before vs. After comparison table:

| Metric | Before | After | Delta |
|--------|--------|-------|-------|
| PHY mode | | | |
| Channel width | | | |
| SNR (dB) | | | |
| TX rate (Mbps) | | | |
| Gateway ping (avg ms) | | | |
| Gateway ping (jitter) | | | |
| 1.1.1.1 ping (avg ms) | | | |
| DNS latency (ms) | | | |
| Downlink (Mbps) | | | |
| Uplink (Mbps) | | | |
| Idle latency (ms) | | | |
| Loaded latency (ms) | | | |
| Responsiveness (RPM) | | | |
