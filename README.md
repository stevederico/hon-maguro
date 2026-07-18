# Hon Maguro

[![skills.sh](https://skills.sh/b/stevederico/hon-maguro)](https://skills.sh/stevederico/hon-maguro)

![Golden tuna banner](./assets/banner.jpg)

**true tuna standards for software**

| | |
|--|--|
| **Standards** | Fixed bars → [STANDARDS.md](./STANDARDS.md) |
| **Meet** | Agent tips (no gaming) → [MEET.md](./MEET.md) |
| **Eval** | Score a project → [EVAL.md](./EVAL.md) · `maguro eval` |
| **Skill** | [skills/hon-maguro](./skills/hon-maguro/) · `npx skills add stevederico/hon-maguro` |

Meet every standard → **Hon Maguro**. Miss any → **Fail**.

```bash
npx skills add stevederico/hon-maguro

./bin/maguro init ~/path/to/project
./bin/maguro links ~/path/to/project   # SCORE3 — no extra install
./bin/maguro eval ~/path/to/project
./bin/lighthouse-median https://localhost:3000   # SCORE1
# agents: capped fix loop (≤2 rounds) is in SKILL.md
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

**Author:** Steve Derico  
MIT — [LICENSE](./LICENSE)
