#!/usr/bin/env bash
# Lighthouse median-of-3 runner for the Hon Maguro SCORE1 bar.
# Runs `npx lighthouse` 3x (no dep added), reports the median score per
# category, and passes only when the Performance median = 100.
# Usage: lighthouse-median.sh <url> [runs]
set -euo pipefail

URL="${1:-}"
RUNS="${2:-3}"
[[ -n "$URL" ]] || { echo "usage: lighthouse-median.sh <url> [runs]" >&2; exit 2; }
command -v npx >/dev/null 2>&1 || { echo "error: npx required (comes with Node)" >&2; exit 2; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "SCORE1 Lighthouse — $URL ($RUNS runs)" >&2
for i in $(seq 1 "$RUNS"); do
  echo "  run $i/$RUNS..." >&2
  npx --yes lighthouse "$URL" \
    --output=json --output-path="$TMP/run$i.json" \
    --quiet --chrome-flags="--headless --no-sandbox" >/dev/null 2>&1 \
    || { echo "error: lighthouse run $i failed" >&2; exit 1; }
done

# Median per category across runs; Performance drives pass/fail. python3 is
# preinstalled (macOS/Linux) — same dep maguro already relies on.
python3 - "$TMP" "$RUNS" <<'PY'
import glob, json, statistics, sys
tmp, runs = sys.argv[1], int(sys.argv[2])
cats = {}
for f in sorted(glob.glob(f"{tmp}/run*.json")):
    with open(f) as fh:
        d = json.load(fh)
    for key, c in d.get("categories", {}).items():
        s = c.get("score")
        if s is not None:
            cats.setdefault(key, {"title": c.get("title", key), "scores": []})["scores"].append(round(s * 100))
if not cats:
    print("error: no category scores parsed", file=sys.stderr); sys.exit(1)

perf = None
for key, c in cats.items():
    med = round(statistics.median(c["scores"]))
    if key == "performance":
        perf = med
    print(f"  {c['title']:<16} median={med:>3}  runs={c['scores']}")

if perf is None:
    print("error: no performance category (is this a web UI?)", file=sys.stderr); sys.exit(1)
if perf == 100:
    print(f"SCORE1 PASS  performance median=100 (of {runs})")
    sys.exit(0)
print(f"SCORE1 FAIL  performance median={perf} < 100 — fix root cause, do not suppress audits")
sys.exit(1)
PY
