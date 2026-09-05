# sales_analytics — dbt Core + MotherDuck demo

A small, complete dbt project showing how a trustworthy revenue number is built: layered
models, tests (generic + singular + unit), documentation with lineage, and CI. Companion to
the blog post "You Don't Have a Dashboard Problem. You Have a Process Problem."

## What it does
Raw sales data (loaded via dbt seeds) is cleaned in **staging**, enriched in **intermediate**,
and served in **marts**. `fct_revenue_monthly` is the single source of truth for revenue:
completed, non-test orders only.

## Architecture
`seeds (raw)` → `staging` (clean) → `intermediate` (join + economics) → `marts` (dim/fct)

![lineage](docs/lineage.png) <!-- TODO: screenshot from `dbt docs serve` -->

## Business rules (deliberate)
- Internal test accounts are excluded from all marts.
- Revenue counts `completed` orders only; cancelled/pending/refunded contribute zero.

## Run it locally
```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
dbt deps
dbt build            # seeds + models + tests, local DuckDB
dbt docs generate && dbt docs serve
```

## Run against MotherDuck
```bash
export MOTHERDUCK_TOKEN="your_token"
dbt build --target prod
```
<!-- TODO: screenshot of a green `dbt build --target prod` -->

## Tests
- Generic: unique, not_null, relationships, accepted_values, dbt_utils.accepted_range
- Singular: completed orders must have a positive amount
- Unit: revenue sums only completed orders (`dbt test --select test_type:unit`)

## CI
GitHub Actions runs `dbt build` on every push and PR (see badge above).

## Notes
