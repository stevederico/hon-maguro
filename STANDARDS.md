# Standards

Fixed bars. **Eval** scores a project against these. Miss any → **Fail**.  
Every bar needs a **number, count, or binary** in evidence. Vague prose alone = fail.  
Agents: [MEET.md](./MEET.md).

## Perf

| # | Metric | Pass if |
|---|--------|---------|
| **SPEED1** | Server response time (named URLs + script) | each **TTFB ≤ 50 ms** (localhost, cache-warm); list every product URL |
| **SPEED2** | Browser page load (named URLs) | each **LCP ≤ 2.0 s** (throttled: Fast 3G, 4× CPU); list every product URL |
| **SPEED3** | Product API latency (named routes) | each **p99 ≤ 300 ms**; list every product route |
| **SPEED4** | Product queries (named) | each **≤ 100 ms**; list every product query |
| **SPEED5** | Main-path JS gzip (named entry) | **≤ 200 KiB** (or exception + measured size) |

## Coverage / QA

| # | Metric | Pass if |
|---|--------|---------|
| **TEST1** | Test suite | exit **0**; **3**/3 consecutive full runs green; **0** unbudgeted flakes; every user-facing flow (list them in evidence) has **≥1** test |

## Tool scores

| # | Metric | Pass if |
|---|--------|---------|
| **SCORE1** | Lighthouse Performance (named URL) | **median of 3 runs = 100**; **N/A** if no web UI |
| **SCORE2** | React Doctor (each prod React app) | score **= 100/100**; **N/A** if no React |
| **SCORE3** | Link check (docs + README) | broken **= 0** via **`hm links`** (built-in; no extra install) |

## Docs / onboarding

| # | Metric | Pass if |
|---|--------|---------|
| **DOCS1** | Fresh clone from README only | ready in **1** attempt; README commands exit **0**; undocumented steps **= 0** |

## Correctness

| # | Metric | Pass if |
|---|--------|---------|
| **CODE1** | Domain glossary → schema | **≥1** business entity listed; each maps **1:1** to a primary table/type (table in evidence) |
| **CODE2** | Auth / data / errors | auth entrypoints **= 1**; data-access style **= 1**; user-visible 5xx samples with stack/provider leak **= 0** |
| **CODE3** | TypeScript strict + `any` | `"strict": true`; boundary `any` / cast-through-unknown hits **= 0** |

## Repo hygiene

| # | Metric | Pass if |
|---|--------|---------|
| **REPO1** | Secrets in git | secret-shaped hits **= 0**; tracked `.env` **= 0** |
| **REPO2** | Deps: count + justify | prod+dev deps **≤ 20**; every dep past 20 (or non-trivial) has a one-line why |
| **REPO3** | Changelog lag | user-visible releases since last note **= 0** (or pre-users) |

## Ops

| # | Metric | Pass if |
|---|--------|---------|
| **OPS1** | Load | peak **and** steady: each has number + unit |
| **OPS2** | Data | now **and** monthly growth: each has number + unit |
| **OPS3** | Failure mode | exactly **1** sentence: primary dies → … |
| **OPS4** | Cost **$/mo** | **5** numbers: ceiling, CPU/mem, storage, egress, third-party |
| **OPS5** | Assumptions | count **1–6** |
| **OPS6** | Restore | **1** clean-room success (date + scenario) **or** N/A (no durable user data) |

## Why the numbers

- **50 ms TTFB / 2.0 s LCP / 300 ms / 100 ms / 200 KiB** — perf budgets  
- **Lighthouse 100 / Doctor 100 / 0 dead links** — fixed tools  
- **3 green runs** — flakes can’t hide in one lucky pass  
- **≤6 assumptions** — more → restart the plan  
- **5 cost lines** — blank line = fail  

Estimates: [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math).
