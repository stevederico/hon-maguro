# Hon Maguro

**true tuna standards for software**

| Term | Meaning |
|------|---------|
| **Standards** | Fixed bars (what “good” means) — [STANDARDS.md](./STANDARDS.md) |
| **Eval** | Score a project against those standards — [EVAL.md](./EVAL.md) + `hm eval` |

Binary: meet every standard → **Hon Maguro**. Miss any → **Fail**.

Inspired by [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math) and Toyosu pass/fail grading.

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

## Standards (summary)

### Napkin

| # | Standard |
|---|----------|
| N1–N2 | Peak + steady load with units |
| N3 | Critical path **p99 ≤ 300 ms** |
| N4 | Data now + growth with units |
| N5 | Failure mode written |
| N6–N10 | Cost ceiling + CPU/mem, storage, egress, third-party **$/mo** |
| N11 | API p99 **≤ 300 ms** |
| N12 | Key query **≤ 100 ms** |
| N13 | Main JS **≤ 200 KiB** gzip (or named exception) |
| N14 | Budgets checked in **CI or named script** |
| N15 | Assumptions **≤ 6** |

### Build

| # | Standard |
|---|----------|
| B1 | Domain-first schema |
| B2 | One path each: auth, data, errors |
| B3 | `strict: true`; no boundary `any` |
| B4 | Zero secrets in git |
| B5 | Deps **≤ 40** (or each extra justified) |
| B6 | One observable error path |
| B7 | One-line why per heavy dep |

---

## Eval

```bash
./bin/hm init ~/path/to/project   # drop eval form
./bin/hm eval ~/path/to/project   # run eval against standards
./bin/hm bars                     # print numeric bars
```

`eval` auto-checks what it can; human confirms the rest. Fill evidence on the eval form.

---

## Related

- [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math)

## License

MIT — see [LICENSE](./LICENSE)
