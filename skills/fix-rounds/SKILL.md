---
name: fix-rounds
description: >
  Capped Hon Maguro inspect→fix→re-eval loop. Run hm eval, fix real product FAILs only, re-eval at most twice. Never open-ended until green; never game the meter. Use when the user says "fix until pass", "make it hon maguro", "inspect and fix", "quality fix loop", or wants an agent to improve a project against Maguro bars without infinite retry.
---

# fix-rounds

Capped loop against Hon Maguro. **Max 2 fix rounds** after the first eval. Stops early on **HON MAGURO**, on **HUMAN** rows that need real measurement, or when the next fix would violate [MEET.md](../../MEET.md).

Not open-ended. Infinite "until green" invites cheating the scoreboard.

## Invoke

```bash
# From the hon-maguro repo (or any checkout that has bin/hm):
bin/hm init  <path>    # if no HON-MAGURO-EVAL.md yet
bin/hm eval  <path>    # round 0 — baseline
# fix real FAILs in <path> (see Allowed fixes)
bin/hm eval  <path>    # round 1
# optional second fix pass
bin/hm eval  <path>    # round 2 — last
```

Round budget: **1 baseline eval + ≤2 fix→re-eval cycles**. Do not start a 3rd fix cycle.

## Algorithm

1. **Baseline** — `hm init` if missing; `hm eval <path>`. Record PASS / FAIL / HUMAN.
2. **If `result: HON MAGURO`** — stop. Report done.
3. **Triage FAILs only** (skip HUMAN until you have real numbers):
   - Map each FAIL id to [STANDARDS.md](../../STANDARDS.md).
   - Apply **Allowed fixes** below. Prefer root cause over workarounds.
4. **Re-eval** — `hm eval <path>`. Increment round.
5. **Stop when any is true:**
   - `result: HON MAGURO`
   - Round budget spent (2 fix cycles done)
   - Remaining work is **HUMAN** / needs external measure (Lighthouse, load test, restore drill)
   - Only remaining options violate MEET (see Forbidden)

## Allowed fixes (product, not meter)

| FAIL | Honest fix |
|--|--|
| **CODE3** | Enable `"strict": true`; replace `any` / `as unknown as` with `unknown` + narrowing |
| **REPO1** | Untrack `.env`; remove secret-shaped strings; rotate if they were real |
| **REPO2** | Drop unused deps; or justify each dep past 20 in EVAL evidence (one line why) |
| **SCORE3** | Fix broken markdown links (`hm links` lists them) |
| **TEST1** | Fix real failures/flakes; add missing flow tests — never delete tests to go green |
| **DOCS1** | Make README alone boot a stranger (commands that exit 0) |
| **CODE1/2** | Align glossary↔schema; one auth path; stop leaking stacks to users |
| **SPEED\*** | Prefetch / pre-warm first; then real perf work — measure every product URL |
| **SCORE1** | Use **lighthouse** skill; fix root cause to median 100 — never suppress audits |
| **SCORE2** | Fix React Doctor findings — never disable rules to fake 100 |
| **OPS\*** | Fill real numbers from napkin math / prod; prove restore once |

Fill EVAL evidence with **number, count, or binary** only. Empty evidence = fail.

## Forbidden (MEET)

- Secret eval mode / cherry-picked routes to hit a budget
- Suppress Lighthouse / Doctor / lint / tests to fake 100
- `@ts-ignore`, blanket `any`, delete tests, fake **N/A** when the surface exists
- One lucky run when **3**/3 is required
- Invent SPEED / OPS / Lighthouse numbers you did not measure
- Loop past round budget or "keep going until green"

## HUMAN rows

`hm` leaves many bars as **HUMAN** when evidence is present. You must:

1. Confirm evidence against STANDARDS.md (number in range, scope listed).
2. If evidence is missing or only prose — measure or mark what is needed; **do not invent**.
3. SCORE1: run `skills/lighthouse/lighthouse-median.sh <url>` when a web UI exists; paste median into evidence.

After confirmation, if every bar truly passes, report **HON MAGURO** even if the raw `hm` summary still says HUMAN open — state which rows you confirmed.

## Report (always)

```
rounds: <n>/2
result: HON MAGURO | FAIL
fixed: <bar ids>
still open: <FAIL ids + HUMAN ids that need measure>
next human step: <one line or none>
```

## Rules

- Same path users take.
- Fix the product, not the meter.
- Named exception + measured number beats a fake pass.
- Cap is the product: **stop after 2 fix rounds**.
