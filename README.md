# Oracle LDS Loom Reporting

A lightweight, read-only SQL workspace for reports against `C##LDS.RPT_DAILY_LOOM_SUMMARY`. The report scripts contain `SELECT` statements only and do not store connection details.

## Setup

1. Open `Oracle LDS Loom Reporting.code-workspace` in VS Code.
2. Connect to Oracle with an approved SQL client (such as SQLcl, SQL Developer, or your organization's VS Code Oracle extension). Use a read-only account with `SELECT` access to `C##LDS.RPT_DAILY_LOOM_SUMMARY`.
3. Set the bind variables below in your client, then run a script from `sql/`. The dates are Oracle `DATE` binds; `start_date` is inclusive and `end_date` is exclusive. Set either optional filter to `NULL` to include all looms or shifts.

Example in SQLcl:

```sql
VARIABLE start_date DATE
VARIABLE end_date DATE
VARIABLE loom_id NUMBER
VARIABLE shift_code VARCHAR2(20)

EXEC :start_date := DATE '2026-09-01';
EXEC :end_date := DATE '2026-10-01';
EXEC :loom_id := NULL;
EXEC :shift_code := NULL;
```

Replace the example dates with the desired period. For a single day, use midnight on that day as `start_date` and midnight on the following day as `end_date`. In other clients, create equivalent typed bind variables before executing the SQL.

## Reports

- `sql/production_efficiency.sql`: daily production and reported efficiency by loom and shift.
- `sql/warp_weft_stops.sql`: warp/weft stop counts and source duration fields by day, loom, and shift.
- `sql/loom_picks.sql`: loom picks and reported picks-per-inch by day, loom, and shift.
- `sql/quality_code_trends.sql`: monthly production and reported efficiency grouped by quality code.

The duration and `MND` columns are returned in their stored values; confirm their units and business definitions with your LDS reporting conventions. The date filter applies to `DATE_OF_REPORT`. The scripts schema-qualify the table as `C##LDS`; adjust that owner only if your authorized environment uses a different one.
