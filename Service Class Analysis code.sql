
--Discharged Inpatients Service Analysis
SELECT InpatientServiceID, InpatientServiceName, AccountNumber,AdmitDateTime,DischargeDateTime,InpatientOrOutpatient,
DATEDIFF(DAY,CASE when AdmitDateTime < '2/1/2019' THEN CONVERT(datetime,'2/1/2019') ELSE AdmitDateTime END,DischargeDateTime) As ESTPatientDays,
datediff(d,AdmitDateTime,DischargeDateTime)
FROM [PTSEDW].[dbo].[AdmVisits]
  WHERE InpatientOrOutpatient ='DIS I'
  AND DischargeDateTime BETWEEN '2/1/2019' AND '2/3/2019 23:59'
 ORDER BY InpatientServiceID 

  -- Original Discharged Inpatients Service Analysis
  SELECT InpatientServiceID, InpatientServiceName, AccountNumber,AdmitDateTime,DischargeDateTime,InpatientOrOutpatient,
DATEDIFF(DAY,CASE when AdmitDateTime < '2/1/2019' THEN CONVERT(datetime,'2/1/2019') ELSE AdmitDateTime END,DischargeDateTime) As ESTPatientDays,
datediff(d,AdmitDateTime,DischargeDateTime)As ESTPatientDays2
FROM [PTSEDW].[dbo].[AdmVisits]
  WHERE InpatientOrOutpatient ='ADM I'
  AND DischargeDateTime Is Null
  ORDER BY InpatientServiceID
  