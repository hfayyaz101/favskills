---
name: wifi-diagnostics-pro
description: Enhanced Wi-Fi and home network diagnostic — adds Wi-Fi 6E/7, WPA3, MIMO streams, 6 GHz band, MTU, QoS/DSCP, mesh backhaul, and structured before/after table
---

Diagnose my Wi-Fi and home network at a deep level. Identify real bottlenecks — not placebo tweaks — and guide me through targeted fixes.

Run all checks **sequentially** (never ping in parallel with throughput tests).

---

## 1. Wi-Fi Link, RF Congestion & Hardware Capability

**Interface info:**
- PHY generation: 802.11n / ac / ax (Wi-Fi 6) / ax 6GHz (Wi-Fi 6E) / be (Wi-Fi 7)
- Active band: 2.4 / 5 / 6 GHz
- Channel number and channel width: 20 / 40 / 80 / 160 / 320 MHz
- SNR (signal-to-noise ratio, dB) and RSSI (dBm)
- Transmit rate and MCS index (e.g. MCS11 HE160 = 2.4 Gbps theoretical max)
- Spatial streams / MIMO configuration (e.g. 2×2, 4×4)
- TxPower level — if too low, check for regulatory domain mismatch
- Interface packet errors, TX retries, and RX drop rate
- Security protocol in use: WEP / WPA2 / WPA3 / WPA3-SAE — flag if below WPA3

**RF environment scan:**
- Count competing APs per channel (2.4 GHz: check only 1/6/11; 5 GHz and 6 GHz: list by UNII band)
- Flag any overlapping non-standard channel widths (e.g. 40 MHz on 2.4 GHz is almost always a mistake)
- Identify if my AP is on a DFS channel and whether radar events have caused recent channel changes
- On 6 GHz: check if my AP supports PSC (Preferred Scanning Channel) for fast discovery

**Mesh / multi-AP check (if applicable):**
- Identify if I'm on a mesh system
- Check backhaul type: wired Ethernet vs. wireless backhaul
- If wireless backhaul: report its band, channel, and link rate separately from client link rate
- Note if the node I'm connected to is a satellite vs. the main router (affects hop count to gateway)

---

## 2. Hop-by-Hop Latency & Stability (idle, no load)

- Ping default gateway: 30 packets — report avg / min / max / stddev / packet loss %
- Ping `1.1.1.1`: 30 packets — same stats
- If IPv6 is active: also ping `2606:4700:4700::1111` (Cloudflare IPv6)
- Run `traceroute -n -q 3 -m 5 1.1.1.1` — label each hop (gateway / modem / ISP edge / CDN)
- Check for signs of bufferbloat: if loaded latency ÷ idle latency > 3×, that's the primary fix target
- Check active local hogs: any process consuming > 1 Mbps sustained, active VPN tunnel, or transparent proxy
- Check for recent Wi-Fi disassociation / roam events in system logs (macOS: `log show --last 10m | grep -i 80211`)

---

## 3. DNS Latency & Configuration

- Show current DNS server(s) in use and whether they're from DHCP, manual, or DoH/DoT
- Run 3 uncached lookups each against:
  - My router (gateway IP)
  - `1.1.1.1` (Cloudflare)
  - `8.8.8.8` (Google)
  - `9.9.9.9` (Quad9)
  - `1.1.1.1#53` over UDP vs. DoH (`https://1.1.1.1/dns-query`) if supported
- Report median latency per resolver; flag if router resolver adds > 20 ms vs. direct
- Check for DNS rebind protection that might block local `.local` or split-DNS domains

---

## 4. MTU & Fragmentation

- Check current MTU on the Wi-Fi interface (default 1500; PPPoE connections need 1492)
- Run path MTU discovery to `1.1.1.1`: test with 1500, 1472, 1452 byte payloads (DF bit set)
- Flag if fragmentation is occurring (indicates MTU mismatch causing silent throughput drops of 10–30%)

---

## 5. QoS / Traffic Marking

- Check if WMM (Wi-Fi Multimedia / 802.11e) is enabled — required for proper AC_VO / AC_VI / AC_BE / AC_BK queue prioritization
- Sample DSCP markings on outbound traffic from common apps (video calls, streaming, background downloads)
- Note if the router is doing SQM / CAKE / fq_codel — these are the only real bufferbloat fixes

---

## 6. Throughput & Bufferbloat Under Load

Run `networkQuality -v` (macOS 12+) or:
- Linux: `speedtest-cli --secure` + `ping -f` flood test in parallel
- Windows: `winsat wan` or browser-based `fast.com`

Capture:
- Downlink and uplink throughput (Mbps)
- Idle latency (ms) — measured before load
- Loaded latency (ms) — measured at peak load
- Responsiveness score (RPM) — macOS native metric
- ECN / L4S negotiation status
- Bufferbloat grade: A (< 5 ms added) → F (> 400 ms added)

---

## Output

### Baseline Summary

Exact measurements from every check above in a compact table.

### Bottlenecks Ranked by Impact

1. **[Highest impact first]** — e.g., bufferbloat (fix: enable SQM/CAKE on router)
2. …

Skip: NIC buffer tweaks, TCP window size changes, DNS cache flush, "disable IPv6", Wi-Fi adapter power management unless a specific measurement justifies it.

### Quick Wins (safe, local, no router access needed)

- DNS order change: switch to fastest resolver from step 3
- MTU fix if fragmentation detected
- Disable proxy/VPN if no measurable benefit

### Router Changes (require admin access)

For each recommendation, state the **exact setting name and value**, not just the concept:

- Channel width: unlock to 80 or 160 MHz on 5 GHz if fewer than 2 competing 160 MHz APs
- Cleanest 5 GHz channel (by AP count from scan): `ch ___`
- Cleanest 2.4 GHz channel (1, 6, or 11 only): `ch ___`
- Enable OFDMA (Wi-Fi 6/6E only) — improves dense-client environments
- Enable WPA3-SAE if supported
- Disable band steering / Smart Connect if roaming causes instability
- Disable unused SSIDs (each SSID adds beacon overhead)
- SQM / CAKE / fq_codel: enable if bufferbloat grade is C or worse
- For mesh: check if wired backhaul is possible; if not, dedicate a band for backhaul

**Router ask:** Share your router model and firmware version (or a screenshot of Wireless Settings) so I can give exact menu paths.

---

## After Changes — Before vs. After Table

Re-run the same sequential benchmark and fill:

| Metric | Before | After | Delta | Notes |
|--------|--------|-------|-------|-------|
| PHY generation | | | | |
| Band | | | | |
| Channel | | | | |
| Channel width | | | | |
| MIMO streams | | | | |
| SNR (dB) | | | | |
| RSSI (dBm) | | | | |
| TX rate (Mbps) | | | | |
| MCS index | | | | |
| Security (WPA ver) | | | | |
| TX retries (%) | | | | |
| Gateway ping avg (ms) | | | | |
| Gateway ping stddev | | | | |
| 1.1.1.1 ping avg (ms) | | | | |
| DNS latency — best resolver (ms) | | | | |
| MTU fragmentation | yes/no | yes/no | | |
| Downlink (Mbps) | | | | |
| Uplink (Mbps) | | | | |
| Idle latency (ms) | | | | |
| Loaded latency (ms) | | | | |
| Bufferbloat grade | | | | |
| Responsiveness (RPM) | | | | |
| ECN/L4S active | yes/no | yes/no | | |
