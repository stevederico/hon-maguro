# Hon Maguro checklist

**Project:**  
**Date:**  
**Reviewer:**  
**Verdict:** ☐ Hon Maguro · ☐ Fail

Empty value = fail. Units required (ms, QPS, $, GB).

## Napkin standards (required numbers)

These *are* the standard — not optional notes.

| # | Standard | Value | Pass? |
|---|----------|-------|-------|
| N1 | Peak QPS (or equiv. load) | ___ | ☐ |
| N2 | Steady load (QPS or DAU) | ___ | ☐ |
| N3 | Critical path p99 | ___ ms | ☐ |
| N4 | Data now → growth | ___ GB → ___ GB/mo | ☐ |
| N5 | Failure mode (primary dies →) | ___ | ☐ |
| N6 | Monthly cost ceiling | $___ | ☐ |
| N7 | Cost: CPU/mem | $___ /mo | ☐ |
| N8 | Cost: storage | $___ /mo | ☐ |
| N9 | Cost: egress | $___ /mo | ☐ |
| N10 | Cost: third-party | $___ /mo | ☐ |
| N11 | Perf budget: API p99 | ___ ms | ☐ |
| N12 | Perf budget: key query | ___ ms | ☐ |
| N13 | Perf budget: client/bundle | ___ | ☐ |
| N14 | How budgets are checked | ___ | ☐ |
| N15 | Assumptions listed (≤6) | ___ | ☐ |

## Build standards

| # | Standard | Pass? | Evidence (path / note) |
|---|----------|-------|------------------------|
| B1 | Domain-first schema | ☐ | |
| B2 | One path per concern | ☐ | |
| B3 | Strict types at boundaries | ☐ | |
| B4 | Secrets never in tree | ☐ | |
| B5 | Delete is a feature | ☐ | |
| B6 | Observable defaults | ☐ | |
| B7 | No cargo cult (deps justified) | ☐ | |

**Rules**
- Every N* and B* row pass → **Hon Maguro**
- Any fail or blank → **Fail**
- "N/A" only if the concern cannot exist — write why in Value/Evidence
