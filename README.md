# Hon Maguro

![Golden tuna banner](./assets/banner.jpg)

**true tuna standards for software**

| | |
|--|--|
| **Standards** | Fixed bars → [STANDARDS.md](./STANDARDS.md) |
| **Meet** | Agent tips (no gaming) → [MEET.md](./MEET.md) |
| **Eval** | Score a project → [EVAL.md](./EVAL.md) · `hm eval` |
| **Skills** | [lighthouse](./skills/lighthouse/) · [fix-rounds](./skills/fix-rounds/) (≤2 fix cycles) |

Meet every standard → **Hon Maguro**. Miss any → **Fail**.

```bash
./bin/hm init ~/path/to/project
./bin/hm links ~/path/to/project   # SCORE3 — no extra install
./bin/hm eval ~/path/to/project
# agents: skills/fix-rounds — eval → fix real FAILs → re-eval (max 2 rounds)
```

## Lessons from Japanese engineering

The standards borrow the discipline of Japan's best manufacturers — build quality in, don't inspect it in.

- **Jidoka** (Toyota, stop-the-line) → miss any bar = **Fail**; no proceeding on a red build.
- **Genchi genbutsu** (go and see) → every bar needs a real **number/count/binary**, never prose.
- **Poka-yoke** (mistake-proofing) → make bad states unrepresentable: strict types, 0 boundary `any` (CODE3).
- **Kaizen** (continuous improvement) → fix the product, not the meter ([MEET.md](./MEET.md)).
- **Complexity kills** (Toyota's unintended-acceleration firmware: 67 functions >50 cyclomatic) → keep functions small and testable.
- **Zero-defect gate** (MISRA: 0 mandatory violations) → binary pass/fail, exceptions only with a documented deviation.

### Companies studied

| Company | What they set | Status here |
|--|--|--|
| **Toyota** | Jidoka, poka-yoke, kaizen; killer-firmware complexity (67 fns >50 cyclomatic) | Baked into the standards + binary Fail |
| **MISRA** (auto industry) | 0 mandatory violations; deviations documented | = our binary pass/fail |
| **Mercari** | SLO 99.95% success + p95 ≤ 350 ms | LATER — needs prod telemetry ([todo.md](./todo.md)) |
| **Honda / Six Sigma** | ≤ 3.4 defects per 1M (or ≤ 50 PPM at customer) | LATER — needs prod telemetry |
| **Nintendo** | Lot Check: 1 major or 3 minor failures → stop, resubmit | Process/CI gate, not a repo bar |
| **Sony, Panasonic, Hitachi, NTT, Rakuten, LINE, Preferred Networks** | No public numeric software bars found | Studied, nothing adoptable |

Inspired by [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math).

MIT — [LICENSE](./LICENSE)
