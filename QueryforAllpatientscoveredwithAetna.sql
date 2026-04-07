SELECT
  p.patient_ID,
  p.full_name,
  p.email_clean,
  p.insurance_provider
FROM clean_patient_info AS p
JOIN clean_insurance_table AS i
  ON lower(trim(p.insurance_provider)) = lower(trim(i.insurance_provider))
WHERE lower(trim(p.insurance_provider)) = 'aetna';