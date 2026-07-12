# Standards

Fixed bars. **Eval** scores a project against these. Miss any → **Fail**.  
Agents: how to meet without gaming → [MEET.md](./MEET.md).

## Core

Capacity, cost, and codebase bars.

| # | Standard |
|---|----------|
| **N1** | Peak **and** steady load written (number + unit each) |
| **N2** | Critical path / API **p99 ≤ 300 ms** (number in evidence) |
| **N3** | Data now + monthly growth (units) |
| **N4** | Failure mode: one sentence (primary dies → …) |
| **N5** | Cost itemized in **$/mo**: ceiling, CPU/mem, storage, egress, third-party |
| **N6** | Key query **≤ 100 ms** |
| **N7** | Main-path JS **≤ 200 KiB** gzip (or named exception) |
| **N8** | Assumptions listed, **≤ 6** |
| **B1** | Domain-first schema (business names) |
| **B2** | One path each: auth, data access, errors — **user-safe + diagnosable** |
| **B3** | `strict: true`; no boundary `any` / cast-through-unknown |
| **B4** | Zero secrets in git; no tracked `.env` |
| **B5** | Prod+dev deps **≤ 40** (or each extra justified) |
| **B6** | One-line why per non-trivial dependency |

## Ship

Permanent product state for users (not the process that got there).

| # | Standard |
|---|----------|
| **S1** | Critical pages load **≤ 50 ms** under a named repeatable check (number in evidence) |
| **S2** | Docs match implementation; fresh clone → ready from **README only** (one clean pass) |
| **S3** | Named scoreboard green (a11y / typecheck / doctor / lighthouse / etc.) + threshold |
| **S4** | Critical paths tested; full suite green; flaky list empty or budgeted |
| **S5** | Customer-facing claims match product **or** no external claims |
| **S6** | CHANGELOG (or release notes) current for user-visible changes **or** pre-users |
| **S7** | If durable user data: restore proved once in a clean room **or** N/A |

## Why the numbers

- **300 ms p99** — interactive web bar  
- **100 ms query** — keeps the API budget honest  
- **200 KiB gzip** — main-path perceived perf  
- **50 ms page load** — loop library / agent-target bar; exception needs a measured number  
- **≤6 assumptions** — napkin-math: more → restart  
- Cost: order-of-magnitude USD OK; blank not OK  

Estimates: [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math).  
Ship bars distilled from [Loop Library](https://signals.forwardfuture.com/loop-library/) stop conditions.
