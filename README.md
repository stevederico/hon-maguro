# Hon Maguro

**true tuna standards for software**

At Toyosu, only fish that clear the top cut are *hon-maguro*. Everything else is simply not.

**Hon Maguro** is that cut for software: a binary scorecard. Pass every standard or **fail**. No middle grades.

Inspired by [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) (numbers with units) and the Toyosu tuna auction (ruthless pass/fail).

---

## First principles

1. **Requirements before stack** — app + data shape dictate tools. Never reverse.
2. **Schema is the product** — the DB model *is* the domain. UI follows.
3. **Strip until essential** — if removing it doesn't break the job, remove it.
4. **Napkin before code** — load, cost, latency numbers before big choices.
5. **≤6 assumptions per decision** — more means you're guessing, not designing.
6. **High agency** — a sharp engineer should say "I could rebuild that."
7. **Measurable or it doesn't count** — no vibes-only claims.
8. **Local-first where it pays** — privacy/control before cloud default.

---

## Standards (must all pass)

### Napkin (numbers *are* the standard)

| # | Standard | Pass looks like |
|---|----------|-----------------|
| N1 | Peak load | e.g. `120 QPS` |
| N2 | Steady load | QPS or DAU with units |
| N3 | Critical path p99 | e.g. `200 ms` |
| N4 | Data size + growth | `X GB → Y GB/mo` |
| N5 | Failure mode | primary dies → ___ |
| N6 | Cost ceiling | `$___ /mo` |
| N7–N10 | Cost lines | CPU/mem, storage, egress, third-party `$/mo` |
| N11–N13 | Perf budgets | API p99, query, client/bundle |
| N14 | Budget check | CI, script, or named smoke |
| N15 | Assumptions | ≤6 listed |

### Build

| # | Standard | Pass looks like |
|---|----------|-----------------|
| B1 | Domain-first schema | business-named model; app is thin shell |
| B2 | One path per concern | one auth, one data access, one error path |
| B3 | Strict types at boundaries | validate input; no `any` / cast hacks |
| B4 | Secrets never in tree | env only; no tracked secrets |
| B5 | Delete is a feature | no dead weight |
| B6 | Observable defaults | user-safe errors; ops can diagnose |
| B7 | No cargo cult | one-line why per heavy dep |

Full write-ups: [STANDARDS.md](./STANDARDS.md)  
Scorecard: [CHECKLIST.md](./CHECKLIST.md)

---

## Binary grade

| Result | Meaning |
|--------|---------|
| **Hon Maguro** | Every N* and B* standard passes |
| **Fail** | Anything else |

---

## How to use

### Tool (`bin/hm`)

```bash
./bin/hm init ~/path/to/project   # drops HON-MAGURO-CHECKLIST.md
./bin/hm grade ~/path/to/project  # auto signals + FAIL until complete
```

| Command | Does |
|---------|------|
| `hm init [path]` | Writes the scorecard (napkin + build rows) |
| `hm grade [path]` | Scans; never awards Hon Maguro without full pass |

### Manual

1. Fill [CHECKLIST.md](./CHECKLIST.md) values (napkin numbers first).
2. Any blank/fail → **Fail**.
3. Link the filled checklist only if you claim Hon Maguro.

---

## Techniques

- **Keep the units** — ms, $/mo, QPS. Not "fast" or "cheap".
- **≤6 assumptions** — more → restart.
- **Fermi first** — decompose until you can guess-check.
- **No negotiation** — graders don't bargain with the fish.

---

## Related

- [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) — first-principles performance numbers
- Toyosu Market — Tokyo wholesale tuna auction

## License

MIT — see [LICENSE](./LICENSE)
