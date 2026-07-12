# Meeting standards (for agents)

Evidence = **number, count, or binary**. Story-only answers fail.

## Laws

1. **Same path users take** — no secret eval mode.  
2. **Fix the product, not the meter.**  
3. **Prefetch / pre-warm before micro-opt**; name background cost.  
4. **Named exception + measured number** beats a fake pass.  
5. **Reproducible** — command, scope, date.

## Don’t

- Drop slow routes/pages from the list to hit a budget  
- Suppress Lighthouse/Doctor/rules to fake 100  
- `@ts-ignore` / blanket `any` / delete tests to go green  
- Secrets in git; fake N/A when the surface exists  
- One lucky run when **3**/3 is required  

## By domain

| | Honest move |
|--|--|
| **P** | Measure every listed product URL/route/query; prefetch before quality cuts |
| **Q** | Fix flakes; map inventory → tests; 3 full greens |
| **T** | Re-run full tool; fix root cause; **`hm links`** for T3 |
| **D** | README alone boots a stranger once |
| **C** | 1:1 glossary; one auth/data path; 0 user-facing leaks; 0 claim mismatches |
| **R** | 0 secrets; deps counted; every dep has a why; changelog caught up |
| **O** | Fill every required number; prove restore once |
