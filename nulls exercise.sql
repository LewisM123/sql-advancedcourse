/*
 * NULLS Exercise
*/
/*
 * Add a WHERE clause to the SQL query below to filter to those patients for whom ethnicity is not known  
*/
SELECT ps.PatientId,
       ps.Ethnicity
FROM   PatientStay AS ps
WHERE  ps.Ethnicity IS NULL;

/*
 * Improve the SQL query below so that the values of the EthnicityIsNull calculated column is 'Not Known' rather than NULL
 * Use the ISNULL() function
*/
SELECT ps.PatientId,
       ps.Ethnicity,
       ISNULL(ps.Ethnicity, 'Not Known') AS EthnicityIfNull
FROM   PatientStay AS ps;

/*
 * Improve the SQL query below so that the values of the EthnicityCoalesce calculated column is 'Not Known' rather than NULL
 * Use the COALESCE() function
*/
SELECT ps.PatientId,
       ps.Ethnicity,
       COALESCE(ps.Ethnicity, 'Not Known') AS EthnicityCoalesce
FROM   PatientStay AS ps;


/* 
 * Summarise the PatientStay table in a query that returns one row and two columns named:
 * NumberOfPatients
 * NumberOfPatientsWithKnownEthnicity
*/

SELECT COUNT(*) AS NumPatients,
       SUM(CASE WHEN ps.Ethnicity IS NOT NULL
                      THEN 1 ELSE 0 END) AS NumberOfPatientsWithKnownEthnicity
FROM   PatientStay AS ps;