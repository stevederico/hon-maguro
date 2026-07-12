# Standards (full)

Binary: every standard below passes, or the project **fails**.

---

## Napkin standards

Required numbers with units. Empty or vibes-only = fail.

### N1. Peak QPS (or equivalent load)

**Rule:** Write the busiest load you design for.

**Pass:** Number + unit (e.g. `120 QPS`, `50k DAU × 3 actions`).

**Fails:** "we'll scale", "lots of users", blank.

### N2. Steady load

**Rule:** Typical day load, not only peak.

**Pass:** Steady QPS or DAU (or RPS) with units.

### N3. Critical path p99

**Rule:** Latency target for the path that defines the product.

**Pass:** Number in ms (or µs) — e.g. `p99 200ms`.

### N4. Data now → growth

**Rule:** Size and monthly growth of the data that matters.

**Pass:** `X GB now → Y GB/mo` (or rows, with conversion).

### N5. Failure mode

**Rule:** What happens when the primary dependency dies.

**Pass:** One concrete sentence (failover, read-only, hard down).

### N6–N10. Cost

**Rule:** Monthly money is part of the design.

| ID | Field |
|----|--------|
| N6 | Ceiling ($/mo) |
| N7 | CPU/mem |
| N8 | Storage |
| N9 | Egress |
| N10 | Third-party APIs |

**Pass:** Dollar amounts (order-of-magnitude OK). Use napkin-math style tables.

**Fails:** "cheap free tier", no numbers.

### N11–N14. Perf budgets

| ID | Field |
|----|--------|
| N11 | API p99 (ms) |
| N12 | Key query (ms) |
| N13 | Client/bundle (size or TTI) |
| N14 | How checked (CI, script, manual smoke — name it) |

**Pass:** Targets + a real check method. Budget with no check = fail N14.

### N15. Assumptions ≤6

**Rule:** List the guesses under the design (≤6). More → restart.

**Pass:** Numbered list of assumptions.

---

## Build standards

### B1. Domain-first schema

**Rule:** Model the business in data first. App code is a client of that model.

**Pass:** Readable schema/migrations; names match the domain.

**Fails:** UI-invented fields; JSON blob as the real model.

### B2. One path per concern

**Rule:** One way for auth, data access, config, errors.

**Pass:** Grep shows one path each.

**Fails:** Dual auth, dual DB layers, eternal feature flags.

### B3. Strict types at boundaries

**Rule:** Validate input; no `any` / cast-through-unknown silencing.

**Pass:** `strict` on (or equiv.); runtime validation at edges.

### B4. Secrets never in tree

**Rule:** Env/secret store only; no tracked `.env`; release leak audit when shipping artifacts.

### B5. Delete is a feature

**Rule:** Dead code, unused deps, dead flags gone.

### B6. Observable defaults

**Rule:** User-safe errors; ops can answer "what failed?" in one place.

### B7. No cargo cult

**Rule:** Every non-trivial dep/abstraction has a one-line why.

---

## Build discipline

Before adding code, stop at the first rung that holds:

1. Need to exist?
2. Already in this codebase?
3. Stdlib / platform?
4. Already-installed dep?
5. One line?
6. Minimum that works

Mark deliberate shortcuts with a debt tag naming ceiling + upgrade path.
