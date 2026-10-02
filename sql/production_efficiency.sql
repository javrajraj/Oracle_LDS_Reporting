SELECT
    TRUNC(t.DATE_OF_REPORT) AS report_date,
    t.LOOMID AS loom_id,
    t.SHIFT AS shift_code,
    SUM(t.PRODUCTION) AS total_production,
    SUM(t.PROD_METER) AS total_production_meters,
    SUM(t.PRODKG) AS total_production_kg,
    AVG(t.STDEFF) AS average_standard_efficiency,
    AVG(t.AVGEFF) AS average_reported_efficiency
FROM C##LDS.RPT_DAILY_LOOM_SUMMARY t
WHERE t.DATE_OF_REPORT >= :start_date
  AND t.DATE_OF_REPORT < :end_date
  AND (:loom_id IS NULL OR t.LOOMID = :loom_id)
  AND (:shift_code IS NULL OR t.SHIFT = :shift_code)
GROUP BY
    TRUNC(t.DATE_OF_REPORT),
    t.LOOMID,
    t.SHIFT
ORDER BY
    report_date,
    loom_id,
    shift_code;
