# Standards (hardcoded bars)

You do not invent targets. These **are** the values. Prove you meet them or **fail**.

---

## Napkin

| # | Hardcoded bar |
|---|----------------|
| **N1** | Peak load = number + unit (QPS / RPS / DAU×actions) |
| **N2** | Steady load = number + unit |
| **N3** | Critical path p99 **≤ 300 ms** |
| **N4** | Data now + monthly growth, with units |
| **N5** | Failure mode: one concrete sentence |
| **N6** | Monthly cost ceiling in USD |
| **N7** | CPU/mem **$/mo** |
| **N8** | Storage **$/mo** |
| **N9** | Egress **$/mo** |
| **N10** | Third-party **$/mo** |
| **N11** | API p99 budget **≤ 300 ms** |
| **N12** | Key query budget **≤ 100 ms** |
| **N13** | Main-path JS **≤ 200 KiB** gzip (or named exception in evidence) |
| **N14** | Budget check = CI job or named script in repo |
| **N15** | Assumptions listed, **≤ 6** |

### Why these numbers

- **300 ms p99** — interactive web bar; slower needs a product reason and still fails unless N/A (batch jobs).
- **100 ms query** — keeps API budget honest under real data.
- **200 KiB gzip** — perceived-performance default for main path.
- **≤6 assumptions** — from napkin-math: more → restart design.
- **Cost lines** — order-of-magnitude USD OK; blank not OK.

Use [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) numbers when estimating.

---

## Build

| # | Hardcoded bar |
|---|----------------|
| **B1** | Schema/domain model first; names match the business |
| **B2** | One auth path, one data-access path, one error path |
| **B3** | `strict: true`; no `any` / `as unknown as` at boundaries; validate input |
| **B4** | No secrets in tree; `.env` not tracked |
| **B5** | Prod+dev dependencies **≤ 40**, or every extra justified in evidence |
| **B6** | Single error mapping; user-safe + diagnosable |
| **B7** | One-line justification per non-trivial dependency |

---

## Build discipline (not scored alone)

1. Need to exist? 2. In codebase? 3. Stdlib/platform? 4. Installed dep? 5. One line? 6. Minimum that works.
