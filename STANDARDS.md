# Standards

Fixed bars. **Eval** scores a project against these. Miss any → **Fail**.  
Every bar needs a **number, count, or binary** in evidence. Vague prose alone = fail.  
Agents: [MEET.md](./MEET.md).

## Perf

| # | Metric | Pass if |
|---|--------|---------|
| **P1** | Product page load (named URLs + script) | each **≤ 50 ms**; list every product URL |
| **P2** | Product API latency (named routes) | each **p99 ≤ 300 ms**; list every product route |
| **P3** | Product queries (named) | each **≤ 100 ms**; list every product query |
| **P4** | Main-path JS gzip (named entry) | **≤ 200 KiB** (or exception + measured size) |

## Coverage / QA

| # | Metric | Pass if |
|---|--------|---------|
| **Q1** | Test suite | exit **0**; **3**/3 consecutive full runs green; **0** unbudgeted flakes; every product flow in inventory has **≥1** test |

## Tool scores

| # | Metric | Pass if |
|---|--------|---------|
| **T1** | Lighthouse Performance (named URL) | score **= 100**; **N/A** if no web UI |
| **T2** | React Doctor (each prod React app) | score **= 100/100**; **N/A** if no React |
| **T3** | Link check (docs + README) | broken **= 0** via **`hm links`** (built-in; no extra install) |

## Docs / onboarding

| # | Metric | Pass if |
|---|--------|---------|
| **D1** | Fresh clone from README only | ready in **1** attempt; README commands exit **0**; undocumented steps **= 0** |

## Correctness

| # | Metric | Pass if |
|---|--------|---------|
| **C1** | Domain glossary → schema | **≥1** business entity listed; each maps **1:1** to a primary table/type (table in evidence) |
| **C2** | Auth / data / errors | auth entrypoints **= 1**; data-access style **= 1**; user-visible 5xx samples with stack/provider leak **= 0** |
| **C3** | TypeScript strict + `any` | `"strict": true`; boundary `any` / cast-through-unknown hits **= 0** |
| **C4** | Customer claims | claim inventory size **N**; mismatches **= 0** (or **N = 0** if no external claims) |

## Repo hygiene

| # | Metric | Pass if |
|---|--------|---------|
| **R1** | Secrets in git | secret-shaped hits **= 0**; tracked `.env` **= 0** |
| **R2** | Dependency count | prod+dev deps **≤ 40** (or each extra has a one-line justify) |
| **R3** | Dep justifications | `# whys = # non-trivial deps` (every one has a one-liner) |
| **R4** | Changelog lag | user-visible releases since last note **= 0** (or pre-users) |

## Ops

| # | Metric | Pass if |
|---|--------|---------|
| **O1** | Load | peak **and** steady: each has number + unit |
| **O2** | Data | now **and** monthly growth: each has number + unit |
| **O3** | Failure mode | exactly **1** sentence: primary dies → … |
| **O4** | Cost **$/mo** | **5** numbers: ceiling, CPU/mem, storage, egress, third-party |
| **O5** | Assumptions | count **1–6** |
| **O6** | Restore | **1** clean-room success (date + scenario) **or** N/A (no durable user data) |

## Why the numbers

- **50 ms / 300 ms / 100 ms / 200 KiB** — perf budgets  
- **Lighthouse 100 / Doctor 100 / 0 dead links** — fixed tools  
- **3 green runs** — flakes can’t hide in one lucky pass  
- **≤6 assumptions** — more → restart the plan  
- **5 cost lines** — blank line = fail  

Estimates: [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math).
