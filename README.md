# Hon Maguro

**true tuna standards for software**

Binary scorecard with **hardcoded bars**. You do not invent the grade line — meet it or **fail**.

Inspired by [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) (fixed reference numbers) and Toyosu grading (pass/fail, no middle).

---

## First principles

1. Requirements before stack  
2. Schema is the product  
3. Strip until essential  
4. Numbers before big choices  
5. ≤6 assumptions  
6. High agency (“I could rebuild that”)  
7. Measurable or it doesn’t count  
8. Local-first where it pays  

---

## Hardcoded bars (must all pass)

### Napkin

| # | Bar |
|---|-----|
| N1–N2 | Peak + steady load with units |
| N3 | Critical path **p99 ≤ 300 ms** |
| N4 | Data now + growth with units |
| N5 | Failure mode written |
| N6–N10 | Cost ceiling + CPU/mem, storage, egress, third-party in **$/mo** |
| N11 | API p99 budget **≤ 300 ms** |
| N12 | Key query **≤ 100 ms** |
| N13 | Main JS **≤ 200 KiB** gzip (or named exception) |
| N14 | Budgets checked in **CI or named script** |
| N15 | Assumptions **≤ 6** |

### Build

| # | Bar |
|---|-----|
| B1 | Domain-first schema |
| B2 | One path each: auth, data, errors |
| B3 | `strict: true`; no boundary `any` |
| B4 | Zero secrets in git |
| B5 | Deps **≤ 40** (or each extra justified) |
| B6 | One observable error path |
| B7 | One-line why per heavy dep |

Full text: [STANDARDS.md](./STANDARDS.md) · Scorecard: [CHECKLIST.md](./CHECKLIST.md)

---

## Binary grade

**Hon Maguro** = every bar met with evidence.  
**Fail** = anything else.

---

## Tool

```bash
./bin/hm init ~/path/to/project
./bin/hm grade ~/path/to/project
```

`grade` auto-checks what it can (strict, secrets, dep count, checklist ticks). Human still confirms domain/schema honesty.

---

## Related

- [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math)

## License

MIT — see [LICENSE](./LICENSE)
