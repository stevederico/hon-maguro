---
name: hon-maguro
author: stevederico
description: >
  Evaluate any project against fixed "Hon Maguro" quality bars via bin/maguro
  (init/links/eval), optional Lighthouse median for SCORE1, and a capped fix loop
  (max 2 rounds). Binary pass/fail — no partial credit. Use when the user says
  "hon maguro", "eval this project", "quality bar check", "is this project ready",
  "audit code quality", or wants a pass/fail verdict against Hon Maguro standards.
  Do not use for generic Lighthouse/PageSpeed-only or open-ended "inspect and fix"
  requests unless they ask for Hon Maguro / these bars.
allowed-tools: Bash(*hon-maguro/bin/maguro*), Bash(*hon-maguro/bin/lighthouse-median*), Bash(curl:*), Bash(python3:*), Bash(npx:*), Read, Write, Edit, Grep, Glob
metadata:
  version: "0.17.0"
---

# hon-maguro

Binary quality gate: a project either meets every fixed bar (**HON MAGURO**) or it **Fails**. No partial credit. Bars → `STANDARDS.md`. Anti-gaming → `MEET.md`.

`bin/maguro` is a self-contained Bash CLI (curl + python3 only). Scripts ship next to this skill.

## Paths

Skill root (after install): `~/.agents/skills/hon-maguro/`

```bash
SKILL="$HOME/.agents/skills/hon-maguro"
"$SKILL/bin/maguro" eval  <path>
"$SKILL/bin/maguro" init  <path>
"$SKILL/bin/maguro" links <path>
"$SKILL/bin/maguro" help
"$SKILL/bin/lighthouse-median" <url> [runs]
```

From a clone of this repo: `./bin/maguro` (wrapper) or `./skills/hon-maguro/bin/maguro`.

## Invoke

```bash
bin/maguro eval  <path>   # full eval — writes HON-MAGURO-EVAL-REPORT.md
bin/maguro init  <path>   # drop blank HON-MAGURO-EVAL.md
bin/maguro links <path>   # SCORE3 only (curl, no install)
bin/maguro help

bin/lighthouse-median <url> [runs]   # SCORE1: Performance median of 3 (=100 to pass)
```

Typical flow:
1. `bin/maguro init <path>` — blank EVAL form (bar IDs + evidence cells).
2. Fill each evidence cell with a **number, count, or binary** (never prose).
3. For web UIs: `bin/lighthouse-median <url>` → paste Performance median into `SCORE1`.
4. `bin/maguro eval <path>` — per-bar table + verdict + fail tips.

## What `eval` checks

- **Auto:** `CODE3` (strict + 0 `any`), `REPO1` (secrets), `REPO2` (deps ≤20), `SCORE3` (links).
- **HUMAN (evidence required):** SPEED1–5, TEST1, SCORE1, SCORE2, DOCS1, CODE1, CODE2, REPO3, OPS1–6. Confirm against STANDARDS.md.

## Reading the output

- Status: `PASS` / `FAIL` / `HUMAN`.
- `result: HON MAGURO` only when FAIL=0 **and** HUMAN=0.
- On FAIL: **how to pass:** tips (also in `HON-MAGURO-EVAL-REPORT.md`).

## SCORE1 — Lighthouse

Bar: **Performance median of 3 runs = 100** (N/A if no web UI).

```bash
bin/lighthouse-median https://localhost:3000
bin/lighthouse-median https://myapp.com 3
```

- Shells out to `npx lighthouse` (no package.json dep); needs Node + Chrome; median via `python3`.
- Paste e.g. `Lighthouse perf median=100 (3 runs) — https://myapp.com` into SCORE1 evidence.
- Real product URL only; fix root cause — never suppress audits.

## Inspect → fix (capped, max 2 rounds)

Not open-ended. Infinite "until green" invites cheating the meter.

```bash
bin/maguro init  <path>   # if needed
bin/maguro eval  <path>   # round 0 baseline
# fix real FAILs (product, not meter)
bin/maguro eval  <path>   # round 1
# optional second fix
bin/maguro eval  <path>   # round 2 — last
```

**Stop when:** HON MAGURO · 2 fix cycles done · remaining is HUMAN/measure · only MEET-violating options left.

### Allowed fixes (product, not meter)

| FAIL | Honest fix |
|--|--|
| **CODE3** | `"strict": true`; replace `any` / `as unknown as` with `unknown` + narrowing |
| **REPO1** | Untrack `.env`; remove secret-shaped strings; rotate if real |
| **REPO2** | Drop unused deps; or one-line why for each past 20 in EVAL |
| **SCORE3** | Fix broken links (`maguro links`) |
| **TEST1** | Fix failures/flakes; add flow tests — never delete tests to go green |
| **DOCS1** | README alone boots a stranger (commands exit 0) |
| **CODE1/2** | Glossary↔schema 1:1; one auth path; 0 user-facing stack leaks |
| **SPEED\*** | Prefetch first; then real perf — measure every product URL |
| **SCORE1** | `bin/lighthouse-median`; fix root cause to median 100 |
| **SCORE2** | Fix React Doctor findings — don't disable rules |
| **OPS\*** | Real napkin/prod numbers; prove restore once |

### Forbidden (MEET)

- Secret eval mode / cherry-picked routes
- Suppress Lighthouse/Doctor/lint/tests to fake 100
- `@ts-ignore`, blanket `any`, delete tests, fake N/A
- Invent SPEED/OPS/Lighthouse numbers
- Loop past 2 fix rounds

### Report after fix rounds

```
rounds: <n>/2
result: HON MAGURO | FAIL
fixed: <bar ids>
still open: <FAIL + HUMAN needing measure>
next human step: <one line or none>
```

## Rules (MEET.md)

- Same path users take.
- Fix the product, not the meter.
- Named exception + measured number beats a fake pass.
