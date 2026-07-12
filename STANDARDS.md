# Standards

Fixed bars. **Eval** scores a project against these. Miss any → **Fail**.  
Agents: how to meet without gaming → [MEET.md](./MEET.md).

## Perf

| # | Standard |
|---|----------|
| **P1** | Critical pages load **≤ 50 ms** under a named repeatable check (number in evidence) |
| **P2** | Every **product** API (user-facing product surface) **p99 ≤ 300 ms** (number + scope in evidence) |
| **P3** | Key query **≤ 100 ms** |
| **P4** | Main-path JS **≤ 200 KiB** gzip (or named exception) |

## Coverage / QA

| # | Standard |
|---|----------|
| **Q1** | Critical paths tested; full suite green; flaky list empty or budgeted |

## Tool scores

| # | Standard |
|---|----------|
| **T1** | Named scoreboard green (a11y / typecheck / doctor / lighthouse / etc.) + threshold |

## Docs / onboarding

| # | Standard |
|---|----------|
| **D1** | Docs match implementation; fresh clone → ready from **README only** (one clean pass) |

## Correctness

| # | Standard |
|---|----------|
| **C1** | Domain-first schema (business names) |
| **C2** | One path each: auth, data access, errors — **user-safe + diagnosable** |
| **C3** | `strict: true`; no boundary `any` / cast-through-unknown |
| **C4** | Customer-facing claims match product **or** no external claims |

## Repo hygiene

| # | Standard |
|---|----------|
| **R1** | Zero secrets in git; no tracked `.env` |
| **R2** | Prod+dev deps **≤ 40** (or each extra justified) |
| **R3** | One-line why per non-trivial dependency |
| **R4** | CHANGELOG (or release notes) current for user-visible changes **or** pre-users |

## Ops

| # | Standard |
|---|----------|
| **O1** | Peak **and** steady load written (number + unit each) |
| **O2** | Data now + monthly growth (units) |
| **O3** | Failure mode: one sentence (primary dies → …) |
| **O4** | Cost itemized in **$/mo**: ceiling, CPU/mem, storage, egress, third-party |
| **O5** | Assumptions listed, **≤ 6** |
| **O6** | If durable user data: restore proved once in a clean room **or** N/A |

## Why the numbers

- **50 ms page** — user-facing load bar  
- **300 ms p99** — interactive API bar  
- **100 ms query** — keeps the API budget honest  
- **200 KiB gzip** — main-path perceived perf  
- **≤6 assumptions** — more → restart the plan  
- Cost: order-of-magnitude USD OK; blank not OK  

Estimates: [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math).  
Domains shaped like [Loop Library](https://signals.forwardfuture.com/loop-library/) themes.
