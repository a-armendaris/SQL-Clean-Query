SELECT
  CASE lower(trim(insurance_provider))
    WHEN 'aetna' THEN 'Aetna'
    WHEN 'bluecross' THEN 'BlueCross'
    WHEN 'cigna' THEN 'Cigna'
    WHEN 'united health' THEN 'United Health'
    WHEN 'humana' THEN 'Humana'
    WHEN 'kaiser permanente' THEN 'Kaiser Permanente'
    WHEN 'molina healthcare' THEN 'molina healthcare'
    WHEN 'centene' THEN 'centene'
    WHEN 'oscar health' THEN 'Oscar Health'
    WHEN 'wellcare' THEN 'WellCare'
    WHEN 'ambetter' THEN 'Ambetter'
    WHEN 'bright health' THEN 'Bright Health'
    ELSE insurance_provider
  END AS insurance_provider,
  NULLIF(customer_service_number, '') AS customer_service_number,
  NULLIF(trim(coverage_type), '') AS coverage_type,
  CASE
    WHEN hours_of_operation LIKE '%24/7%' THEN 'Monday-Sunday'
    WHEN hours_of_operation LIKE '%Weekdays%' THEN 'Monday-Friday'
    WHEN hours_of_operation LIKE '%M-F%' THEN 'Monday-Friday'
    WHEN hours_of_operation LIKE '%Mon-Fri%' THEN 'Monday-Friday'
    ELSE NULL
  END AS days_open,
  CASE
    WHEN hours_of_operation LIKE '%9am-5pm%' THEN '09:00:00'
    WHEN hours_of_operation LIKE '%8:00 AM - 6:00 PM%' THEN '08:00:00'
    WHEN hours_of_operation LIKE '%7am-7pm%' THEN '07:00:00'
    ELSE NULL
  END AS open_time,
  CASE
    WHEN hours_of_operation LIKE '%9am-5pm%' THEN '17:00:00'
    WHEN hours_of_operation LIKE '%8:00 AM - 6:00 PM%' THEN '18:00:00'
    WHEN hours_of_operation LIKE '%7am-7pm%' THEN '19:00:00'
    ELSE NULL
  END AS close_time
FROM messy_insurance_table;

