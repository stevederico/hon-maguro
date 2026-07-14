---
name: hon-maguro
description: >
  Evaluate any project against the fixed "Hon Maguro" software quality bars via the bundled bin/hm CLI. Auto-checks TypeScript strict/`any`, secrets in git, dependency count, and markdown links; scores the rest from a filled-in EVAL form. Use when the user says "eval this project", "hon maguro", "quality bar check", "is this project ready", "audit code quality", or wants a pass/fail quality verdict against fixed standards.
---

# hon-maguro

Binary quality gate: a project either meets every fixed bar (**HON MAGURO**) or it **Fails**. No partial credit. Bars are defined in `STANDARDS.md`; agent anti-gaming rules in `MEET.md`.

`bin/hm` is a self-contained Bash CLI (no deps beyond curl + python3, both preinstalled on macOS/Linux). Invoke it with the repo path of the project under review.

## Invoke

```bash
bin/hm eval  <path>   # full eval — writes HON-MAGURO-EVAL-REPORT.md
bin/hm init  <path>   # drop a blank HON-MAGURO-EVAL.md form to fill with evidence
bin/hm links <path>   # SCORE3 only — check markdown links (curl, no install)
bin/hm help
```

Typical flow:
1. `bin/hm init <path>` — writes `HON-MAGURO-EVAL.md` (a table of bar IDs + empty evidence cells).
2. Fill each evidence cell with a **number, count, or binary** (never prose — vague prose = fail). See `EVAL.md` for the form and `STANDARDS.md` for what each bar requires.
3. `bin/hm eval <path>` — prints a per-bar table and a verdict, and writes `HON-MAGURO-EVAL-REPORT.md`.

## What `eval` checks

- **Auto (hm decides pass/fail):**
  - `CODE3` — `tsconfig` has `"strict": true` and 0 `any`/cast-through-unknown hits.
  - `REPO1` — no tracked `.env`, no secret-shaped strings.
  - `REPO2` — prod+dev deps ≤ 20 (over 20 needs justification in evidence).
  - `SCORE3` — 0 broken markdown links (same as `hm links`).
- **HUMAN (evidence must be present; agent confirms against STANDARDS.md):** SPEED1–5, TEST1, SCORE1, SCORE2, DOCS1, CODE1, CODE2, REPO3, OPS1–6. `hm` verifies the evidence cell is non-empty and range-checks `ms` values for SPEED1/3/4; you must confirm the rest.

## Reading the output

- Per-row status: `PASS` / `FAIL` / `HUMAN`.
- `summary  PASS=.. FAIL=.. HUMAN=..`
- `result:` is `HON MAGURO` only when FAIL=0 **and** HUMAN=0. Any open HUMAN row or any FAIL = overall Fail.
- Resolve every `HUMAN` row by reading the evidence and checking it against the matching bar in `STANDARDS.md`, then report which bars truly pass.

## Bars that need external runners

- `SCORE1` (Lighthouse Performance median of 3 = 100) has no runner inside `hm`. Use the **lighthouse** skill (`skills/lighthouse/`) to produce the number, then paste it into the `SCORE1` evidence cell.
- `SCORE2` (React Doctor = 100) and the SPEED/TEST/OPS bars are measured by you with the project's own tooling; record the number as evidence.

## Inspect → fix (capped)

To improve a project toward the gate (not open-ended until green), use the **fix-rounds** skill (`skills/fix-rounds/`): baseline `hm eval` → fix real FAILs → re-eval, **max 2 fix rounds**. Stops on HUMAN / need measure; never games the meter.

## Rules (from MEET.md)

- Measure the same path users take — no secret eval mode.
- Fix the product, not the meter. Never suppress a tool to fake 100.
- A named exception + measured number beats a fake pass.
