# To-Do

## Later — production telemetry (runtime SLOs)

These need live prod metrics (Datadog/Prometheus), not a static clone. Integrate if `hm` ever ingests a telemetry source.

- [ ] Telemetry ingest: point `hm` at a metrics source (URL/export) so runtime bars can be scored
- [ ] SPEED-RUNTIME: production p95 ≤ 350 ms + success ≥ 99.95% (Mercari SLO)
- [ ] Escaped defects: ≤ 3.4 defects per 1M requests (Six Sigma) — or automotive ≤ 50 PPM at customer
- [ ] Error budget: releases halt when the monthly budget is spent (Google SRE stop-the-line)
- [ ] Uptime gate: pick a tier — 99.9% (43m/mo down) or 99.99% (4m23s/mo)
