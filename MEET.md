# Meeting standards (for agents)

Bars measure **real product state**. Gaming the number → **Fail** even if the script goes green.

## Laws

1. **Same path users take** — measure prod-like path; no secret “eval mode.”
2. **Fix the cause, not the meter** — change product behavior, not the check.
3. **Prefer hide-the-wait before micro-opt** — preload / pre-warm / keep-mounted / optimistic UI first; then real speed work. Name the tradeoff (background cost).
4. **Named exception beats fake pass** — write the real number + why; never strip features only for the score.
5. **Evidence is reproducible** — command, scope, date; another agent can re-run it.

## Do this

| Domain | Bars | Honest moves |
|--------|------|----------------|
| **Perf** | P1–P4 | Cache, index, fewer round-trips, CDN, edge, **prefetch on idle/hover**, stream, code-split — keep UX intact |
| **QA** | Q1 | Stabilize flakes at root; test critical paths; don’t delete/skip to green |
| **Tools** | T1–T3 | Real Lighthouse/Doctor fixes; re-run full scan; fix or remove dead links — no suppressions to fake 100 |
| **Docs** | D1 | Fix README/setup so a stranger boots; docs match code |
| **Correctness** | C1–C4 | Real schema names; one auth/data/error path; narrow types; claims match product |
| **Repo** | R1–R4 | No secrets; drop unused deps; justify keepers; changelog for users |
| **Ops** | O1–O6 | Write real load/data/cost/assumptions; prove restore once |

## Don’t (auto-fail spirit)

- Exclude slow pages / queries from the sample to hit p99 or 50 ms  
- Stub, mock, or `display:none` away work only during the check  
- `@ts-ignore`, blanket `any`, Doctor/Lighthouse suppressions, or delete tests/features to clear a scoreboard  
- Commit secrets “temporarily,” track `.env`, or fake empty secret scan  
- Pad CHANGELOG / docs that don’t match code  
- Claim “N/A” when the surface exists (prod, data, claims, users)  
- One-off hand-tuned run that CI can’t repeat  

## Perf note (P1–P4)

**Wrong instinct:** recompress, strip quality, or lie about scope for a few %.  
**Right instinct:** do expensive work **before** the user waits (prefetch, pre-warm, keep-mounted). If the bar is still missed, fix the hot path for **all** users, remeasure under the **same** named check.
