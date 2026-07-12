# Hon Maguro eval

**Project:**  
**Date:**  
**Reviewer:**  
**Result:** ☐ Hon Maguro · ☐ Fail

**Standards** are fixed in [STANDARDS.md](./STANDARDS.md).  
**Eval** = score this project against those standards (pass/fail + evidence).

Empty evidence = fail.

## Napkin

| # | Standard | Pass? | Evidence |
|---|----------|-------|----------|
| N1 | Peak load written as a **number + unit** (QPS, RPS, or DAU×actions) | ☐ | |
| N2 | Steady load written as a **number + unit** | ☐ | |
| N3 | Critical path **p99 ≤ 300 ms**; write the number in ms | ☐ | |
| N4 | Data size **now + monthly growth** with units (GB or row count) | ☐ | |
| N5 | Failure mode: one sentence — primary dies → what happens | ☐ | |
| N6 | Monthly **cost ceiling in USD** written | ☐ | |
| N7 | CPU/mem cost line in **$/mo** | ☐ | |
| N8 | Storage cost line in **$/mo** | ☐ | |
| N9 | Egress cost line in **$/mo** | ☐ | |
| N10 | Third-party cost line in **$/mo** | ☐ | |
| N11 | API p99 budget **≤ 300 ms** and written | ☐ | |
| N12 | Key query budget **≤ 100 ms** and written | ☐ | |
| N13 | Client budget written (JS **≤ 200 KiB** gzip main path, or named exception) | ☐ | |
| N14 | Budgets enforced by **CI or a named script** | ☐ | |
| N15 | Design assumptions listed and **count ≤ 6** | ☐ | |

## Build

| # | Standard | Pass? | Evidence |
|---|----------|-------|----------|
| B1 | Domain-first schema: tables/entities named for the business | ☐ | |
| B2 | Exactly **one** path each for auth, data access, errors | ☐ | |
| B3 | TypeScript **`strict: true`** (or equivalent); no `any` / cast-through-unknown at boundaries | ☐ | |
| B4 | **Zero** secrets in git; no tracked `.env` | ☐ | |
| B5 | No dead weight; package deps (prod+dev) **≤ 40** unless each extra has a one-line why | ☐ | |
| B6 | One error path: user-safe message + ops can diagnose | ☐ | |
| B7 | Every non-trivial dependency has a **one-line why** | ☐ | |

**Rules**
- Every standard pass → **Hon Maguro**
- Any fail → **Fail**
