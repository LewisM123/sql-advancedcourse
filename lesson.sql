/*
Example lesson stub
*/
--a
SELECT   ps.PatientId,
         ps.AdmittedDate,
         ps.DischargeDate,
         ps.Hospital,
         ps.Ward,
         ps.ethnicity,
         DATEDIFF(day, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
FROM     PatientStay AS ps
WHERE    ps.hospital IN ('Kingston', 'PRUH')
         AND --AND ps.Ward LIKE '%Surgery'
         ps.AdmittedDate BETWEEN DATEFROMPARTS(2024, 2, 28) AND DATEFROMPARTS(2024, 3, 1)
ORDER BY LengthOfStay DESC, ps.AdmittedDate DESC;

SELECT   ps.hospital,
         ps.ward,
         SUM(ps.tariff) AS TotalTariff,
         MAX(ps.Tariff) AS biggestTariff,
         COUNT(*) AS TotalPatients
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.ward
HAVING   SUM(ps.tariff) >= 10
ORDER BY TotalTariff DESC;