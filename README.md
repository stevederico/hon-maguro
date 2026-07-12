# Hon Maguro

**true tuna standards for software**

| | |
|--|--|
| **Standards** | Fixed bars → [STANDARDS.md](./STANDARDS.md) |
| **Meet** | Agent tips (no gaming) → [MEET.md](./MEET.md) |
| **Eval** | Score a project → [EVAL.md](./EVAL.md) · `hm eval` |

Meet every standard → **Hon Maguro**. Miss any → **Fail**.

```bash
./bin/hm init ~/path/to/project
./bin/hm links ~/path/to/project   # SCORE3 — no extra install
./bin/hm eval ~/path/to/project
```

## Lessons from Japanese engineering

The standards borrow the discipline of Japan's best manufacturers — build quality in, don't inspect it in.

- **Jidoka** (Toyota, stop-the-line) → miss any bar = **Fail**; no proceeding on a red build.
- **Genchi genbutsu** (go and see) → every bar needs a real **number/count/binary**, never prose.
- **Poka-yoke** (mistake-proofing) → make bad states unrepresentable: strict types, 0 boundary `any` (CODE3).
- **Kaizen** (continuous improvement) → fix the product, not the meter ([MEET.md](./MEET.md)).
- **Complexity kills** (Toyota's unintended-acceleration firmware: 67 functions >50 cyclomatic) → keep functions small and testable.
- **Zero-defect gate** (MISRA: 0 mandatory violations) → binary pass/fail, exceptions only with a documented deviation.

Inspired by [sirupsen/napkin-math](https://github.com/sirupsen/napkin-math).

MIT — [LICENSE](./LICENSE)
