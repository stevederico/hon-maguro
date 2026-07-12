# Meeting standards (for agents)

Bars measure **real product state**. Gaming the number → **Fail** even if the script goes green.

## Laws

1. **Same path users take** — measure prod-like path; no secret “eval mode.”
2. **Fix the cause, not the meter** — change product behavior, not the check.
3. **Prefer hide-the-wait before micro-opt** — preload / pre-warm / keep-mounted / optimistic UI first; then real speed work. Name the tradeoff (background cost).
4. **Named exception beats fake pass** — write the real number + why; never strip features only for the score.
5. **Evidence is reproducible** — command, scope, date; another agent can re-run it.

## Do this

| Bar | Honest moves |
|-----|----------------|
| **N2 / N6 / S1** | Cache, index, fewer round-trips, CDN, edge, **prefetch on idle/hover**, stream, shrink critical path |
| **N7** | Code-split by route; defer non-main; drop unused deps — keep UX intact |
| **B2** | One auth / data / error path; user-safe copy + recovery; log detail server-side |
| **B3** | Narrow types at boundaries; no `as any` / cast-through-unknown to silence |
| **B5 / B6** | Delete unused deps; justify keepers in one line |
| **S2** | Fix README/setup/docs so a stranger boots; don’t paper over with “works on my machine” |
| **S3** | Fix root findings; re-run full scoreboard |
| **S4** | Stabilize flakes at root; test critical paths; don’t delete/skip to green |
| **S5** | Change product **or** change the claim |
| **S6** | Record what users should know |
| **S7** | Restore real backup in a clean room once |

## Don’t (auto-fail spirit)

- Exclude slow pages / queries from the sample to hit p99 or 50 ms  
- Stub, mock, or `display:none` away work only during the check  
- `@ts-ignore`, blanket `any`, rule disable, or delete tests/features to clear a scoreboard  
- Commit secrets “temporarily,” track `.env`, or fake empty secret scan  
- Pad CHANGELOG / docs that don’t match code  
- Claim “N/A” when the surface exists (prod, data, claims, users)  
- One-off hand-tuned run that CI can’t repeat  

## Perf note (S1 / N2 / N7)

**Wrong instinct:** recompress, strip quality, or lie about scope for a few %.  
**Right instinct:** do expensive work **before** the user waits (prefetch, pre-warm, keep-mounted). If the bar is still missed, fix the hot path for **all** users, remeasure under the **same** named check.
