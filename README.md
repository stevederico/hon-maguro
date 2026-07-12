# Hon Maguro

**true tuna standards for software**

At Toyosu, only fish that clear the top cut are *hon-maguro*. Everything else is simply not.

**Hon Maguro** is that cut for software: first principles and a binary scorecard. Pass every standard or **fail**. No middle grades.

Inspired by [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) (estimate before you build) and the Toyosu tuna auction (ruthless grading).

---

## First principles

1. **Requirements before stack** — app + data shape dictate tools. Never reverse.
2. **Schema is the product** — the DB model *is* the domain. UI follows.
3. **Strip until essential** — if removing it doesn't break the job, remove it.
4. **Napkin before code** — cost, latency, and scale estimates before implementation.
5. **≤6 assumptions per decision** — more means you're guessing, not designing.
6. **High agency** — a sharp engineer should say "I could rebuild that."
7. **Measurable or it doesn't count** — no vibes-only claims about speed, cost, or quality.
8. **Local-first where it pays** — privacy, control, and offline before cloud default.

---

## Grade: Hon Maguro (must pass)

A project is **Hon Maguro** only if every item below is true. Partial credit = not this grade.

| # | Standard | Pass looks like |
|---|----------|-----------------|
| 1 | **Domain-first schema** | Tables/entities named for the business; app code reads as a thin shell over the model |
| 2 | **Architecture from load** | Written napkin: QPS, p99 target, storage/month, failure modes — before framework choice |
| 3 | **One path per concern** | Auth, data access, errors: one way each. No parallel "temporary" systems |
| 4 | **Strict types at boundaries** | Runtime validation on input/JSON; no `any`, no cast-through-unknown |
| 5 | **Secrets never in tree** | Env only; release artifact audited for leaks |
| 6 | **Delete is a feature** | Dead code, unused deps, unused flags gone. Diff shrinks over time |
| 7 | **Observable defaults** | Errors mapped to user-safe UI; ops can answer "what failed?" in one place |
| 8 | **Cost transparent** | Monthly infra napkin (CPU/mem/storage/egress) lives next to the design |
| 9 | **Perf budget written** | Hard numbers (e.g. TTFB, bundle, query p99) — and CI or smoke checks that catch blowups |
| 10 | **No cargo cult** | Every dependency and abstraction has a one-line "why we need this" |

Details and anti-patterns: [STANDARDS.md](./STANDARDS.md)  
Scannable audit form: [CHECKLIST.md](./CHECKLIST.md)

---

## Binary grade

| Result | Meaning |
|--------|---------|
| **Hon Maguro** | All 10 standards pass with evidence |
| **Fail** | Anything else — no middle tiers |

No export. No ground. No partial credit.

---

## How to use

### Tool (`bin/hm`)

Zero deps. Bash. Auto checks are **signals** — HUMAN rows still need a person.

```bash
# from this repo
./bin/hm init ~/path/to/project   # checklist + docs/napkin.md
./bin/hm grade ~/path/to/project  # scan → verdict + HON-MAGURO-REPORT.md
```

Optional: `ln -s "$(pwd)/bin/hm" /usr/local/bin/hm`

| Command | Does |
|---------|------|
| `hm init [path]` | Writes `HON-MAGURO-CHECKLIST.md` + `docs/napkin.md` |
| `hm grade [path]` | Auto PASS/FAIL/HUMAN per standard; honest verdict |

`grade` can auto-**fail** (missing napkin, tracked `.env`, `strict` off, etc.). It never auto-awards **Hon Maguro** — incomplete HUMAN rows = **fail** until you pass them.

### Manual

1. Open [CHECKLIST.md](./CHECKLIST.md) (or the file `hm init` dropped).
2. Mark each standard pass/fail with evidence.
3. Fail any row → not Hon Maguro.
4. Link the filled checklist when you claim the grade.

---

## Techniques (from napkin math + market floor)

- **Don't overcomplicate** — >6 assumptions → restart the design from requirements.
- **Keep the units** — "fast" is not a unit; ms, $/mo, and rows/s are.
- **Fermi first** — decompose cost/latency into guesses you can check.
- **Auction honesty** — graders don't negotiate with the fish. Neither should you with your checklist.
- **Buyers are real** — design for the person who pays (user, operator, future you at 2am).

---

## Related

- [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) — first-principles performance numbers
- Toyosu Market — successor to Tsukiji for Tokyo's wholesale tuna auction

## License

MIT — see [LICENSE](./LICENSE)
