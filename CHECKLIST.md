# Hon Maguro checklist

**Project:**  
**Date:**  
**Reviewer:**  
**Verdict:** ☐ Hon Maguro · ☐ Fail

Evidence = path, link, or short note. Empty evidence = fail.

| # | Standard | Pass? | Evidence |
|---|----------|-------|----------|
| 1 | Domain-first schema | ☐ | |
| 2 | Architecture from load (napkin with units) | ☐ | |
| 3 | One path per concern | ☐ | |
| 4 | Strict types at boundaries | ☐ | |
| 5 | Secrets never in tree | ☐ | |
| 6 | Delete is a feature (no dead weight) | ☐ | |
| 7 | Observable defaults | ☐ | |
| 8 | Cost transparent ($/mo napkin) | ☐ | |
| 9 | Perf budget written + checked | ☐ | |
| 10 | No cargo cult (deps justified) | ☐ | |

**Rules**
- All 10 pass → **Hon Maguro**
- Any fail → **Fail** (no middle grades)
- "N/A" only if the concern truly does not exist (e.g. no network secrets in a pure lib) — write why

## Napkin stub (paste into evidence for #2 / #8 / #9)

```text
Workload: ___ QPS peak / ___ DAU
Critical path p99: ___ ms
Data: ___ GB now → ___ GB / month
Failure mode: ___
Monthly cost ceiling: $___
  CPU/mem: $___
  Storage: $___
  Egress: $___
  Third-party: $___
Perf budgets: API p99 ___ · query ___ · bundle ___
```

## Notes

-
