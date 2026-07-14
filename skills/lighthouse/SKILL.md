---
name: lighthouse
description: >
  Run Google Lighthouse against a URL, take the median of 3 runs per category, and score it against the Hon Maguro SCORE1 bar (Performance median = 100). Uses `npx lighthouse` — no dependency added. Use when the user says "lighthouse", "pagespeed", "page speed", "web performance score", "core web vitals score", or needs the SCORE1 number for a Hon Maguro eval.
---

# lighthouse

Produces the number the Hon Maguro `SCORE1` bar needs: **Lighthouse Performance, median of 3 runs = 100** (see `../../STANDARDS.md`). Fails the bar unless the Performance median hits 100. Also reports the median for every other category (Accessibility, Best Practices, SEO) so you can spot regressions.

No dependency is installed — it shells out to `npx lighthouse` (Chrome headless) per YAGNI, and parses JSON with the preinstalled `python3`.

## Invoke

```bash
skills/lighthouse/lighthouse-median.sh <url> [runs]   # runs defaults to 3
```

Example:

```bash
skills/lighthouse/lighthouse-median.sh https://localhost:3000
skills/lighthouse/lighthouse-median.sh https://myapp.com 3
```

## Output

- One line per category: `median=<n>  runs=[...]`.
- Final line: `SCORE1 PASS  performance median=100` (exit 0) or `SCORE1 FAIL  performance median=<n> < 100` (exit 1).

## How it works

1. Runs `npx --yes lighthouse <url> --output=json --quiet --chrome-flags="--headless --no-sandbox"` `runs` times (default 3) into a temp dir.
2. For each Lighthouse category, converts the 0–1 score to 0–100 and takes the median across runs.
3. Performance drives pass/fail against the `= 100` bar; other categories are informational.

## Requirements

- Node/`npx` on PATH (Lighthouse is fetched on demand; nothing added to `package.json`).
- Chrome/Chromium available for headless runs (Lighthouse locates it, or set `CHROME_PATH`).
- `python3` (preinstalled on macOS/Linux) for median math.

## Feeding it back into Hon Maguro

Take the reported Performance median and paste it into the `SCORE1` evidence cell of `HON-MAGURO-EVAL.md`, e.g. `Lighthouse perf median=100 (3 runs) — https://myapp.com`, then re-run `bin/maguro eval <path>`. Mark `SCORE1` **N/A** only if the project has no web UI.

## Rules (MEET.md)

- Measure the real product URL users hit — don't cherry-pick a fast page.
- Fix the root cause to reach 100; never suppress or disable audits to fake the score.
