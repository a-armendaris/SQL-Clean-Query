SELECT
  patient_ID AS patient_id,
  first_name || ' ' || last_name AS full_name,
  CASE
    WHEN email IS NULL OR trim(email) = '' THEN 'no email given'
    ELSE lower(trim(email))
  END AS email_clean
FROM messy_patient_info;