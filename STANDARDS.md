# Standards (full)

Each standard: rule, why, pass evidence, common fails.

---

## 1. Domain-first schema

**Rule:** Model the business in data first. Application code is a client of that model.

**Why:** Schema outlives frameworks. Wrong tables → every feature pays interest.

**Pass evidence:**
- ERD or migration set that a domain expert can read
- Feature PRs change schema intentionally, not "add a JSON blob column"

**Fails:**
- UI components invent fields the DB never stores
- "Flexible" `metadata` JSON as the real model
- ORM entities that don't match how the business talks

---

## 2. Architecture from load

**Rule:** Write the napkin before choosing the stack.

Minimum napkin fields:
- Peak and steady QPS (or DAU × actions)
- p50 / p99 latency target for the critical path
- Data size / growth per month
- Failure modes (what dies when primary dies?)
- Monthly cost ceiling

**Pass evidence:** `docs/napkin.md` or design note with numbers and units.

**Fails:**
- "We'll use Kubernetes because scale" with no QPS
- Database choice from Twitter threads
- Infinite horizontal scale talk for 200 users

---

## 3. One path per concern

**Rule:** Exactly one way for auth, data access, config, and error reporting.

**Why:** Dual paths = dual bugs and nobody knows which is real.

**Pass evidence:** Grep shows one auth middleware, one DB access layer, one error mapper.

**Fails:**
- Session cookies *and* JWT *and* API keys with three validators
- Some routes use the repository; others raw SQL in handlers "just this once"
- Feature flags forever that never delete the old path

---

## 4. Strict types at boundaries

**Rule:** Trust ends at the process boundary. Validate input; narrow unknowns; never silence the typechecker.

**Pass evidence:**
- Request bodies validated (schema lib or manual guards)
- `strict` TypeScript (or equivalent) on
- No `any`, no `as T` on `JSON.parse`, no blanket `!`

**Fails:**
- `JSON.parse(body) as User`
- `@ts-ignore` to ship
- Shared "utils" that return `any`

---

## 5. Secrets never in tree

**Rule:** Credentials only via environment / secret store. Pre-publish artifacts get a leak audit.

**Pass evidence:**
- `.env` gitignored; example `.env.example` with dummy values
- No tokens in git history for current secrets
- Release checklist includes secret scan for `.app` / Docker / zip

**Fails:**
- API keys in source, README, or committed `.env`
- Symlinks into secret dirs packed into release bundles

---

## 6. Delete is a feature

**Rule:** The highest-leverage change is often removal.

**Pass evidence:**
- Unused dependencies removed after feature deletion
- CHANGELOG or commits that shrink surface area
- No commented-out blocks "in case we need it"

**Fails:**
- Dependencies added for one demo call and left forever
- Three CSS systems, two state libraries
- Feature flags with both branches living years

---

## 7. Observable defaults

**Rule:** Failures are diagnosable without SSH folklore.

**Pass evidence:**
- User sees a safe message; logs have request id + cause
- One error-handling path maps domain errors → UI/HTTP
- Health or smoke check for the critical dependency (DB)

**Fails:**
- Empty 500s with no log line
- `console.log` as the only observability
- Errors swallowed in catch blocks

---

## 8. Cost transparent

**Rule:** Someone can estimate monthly cost from the napkin without asking finance.

**Pass evidence:** Table: CPU, memory, storage, egress, third-party APIs — units and $/mo.

**Fails:**
- "It's cheap on the free tier" with no growth line
- Logging/metrics vendors unbounded
- Chatty microservices with cross-AZ tax ignored

---

## 9. Perf budget written

**Rule:** Numbers exist before optimization theater.

Suggested starter budgets (adjust with napkin):
- Critical API p99 under agreed ms
- Initial JS for main path under agreed KiB (or framework-justified)
- Key query under agreed ms with realistic data volume

**Pass evidence:** Budget doc + at least one automated or scripted check.

**Fails:**
- "Feels fast on my laptop"
- Optimization PRs with no before/after
- Unindexed tables "until we need it" at 10M rows

---

## 10. No cargo cult

**Rule:** Every dependency and layer must earn a one-line justification.

**Pass evidence:** README or ADR: "We use X because Y; alternative Z rejected because W."

**Fails:**
- Microservices for a single team and single deployable
- Abstract factory for one implementation
- New framework because it is trending

---

## Climbing the ladder (build discipline)

Before adding code, stop at the first rung that holds:

1. Does this need to exist?
2. Already in this codebase?
3. Stdlib / platform already does it?
4. Already-installed dependency?
5. One line?
6. Only then: minimum that works

Mark deliberate shortcuts with a debt tag naming the ceiling and upgrade path.
