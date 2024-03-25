
/* This will show you the schema of the table */
DESCRIBE SurgicalProcedures;

/* Drop the table and start over again */
Drop Table SurgicalProcedures;

/* Show all rows */
select * from SurgicalProcedures
order by PatientID;

DESCRIBE SurgicalProcedures;




/* Count distinct patients in the table */

select count(DISTINCT patientID) from SurgicalProcedures;
/* Find earliest and latest request dates */
Select min(CaseRequestDate) earliest, max(CaseRequestDate) from SurgicalProcedures;

/* Count total procedures in table */
Select ProcedureName, count(procedurename) from SurgicalProcedures
GROUP BY ProcedureName;




/* Count how many of each procedures in table */
select Procedurename, count(patientID) 
from SurgicalProcedures GROUP BY ProcedureName
Order by count(patientID) desc ;


/* Calculated the Wait Weeks */
select ProcedureName, avg(sub_a.PatientWait) from (
select procedurename, round((SurgeryDate-CaseRequestDate)/7,1) as PatientWait
, patientID 
from SurgicalProcedures
group by ProcedureName)
sub_a
group by ProcedureName
;

/* Find the patinet with the longest wait */
select PatientID, round((SurgeryDate-CaseRequestDate)/7,1) as PatientWait
, patientID 
from SurgicalProcedures
group by PatientID
order by round((SurgeryDate-CaseRequestDate)/7,1) desc
;
/* isolate there detail information */
select *, round((SurgeryDate-CaseRequestDate)/7,1) as PatientWait from SurgicalProcedures
where PatientID in ('PID-1303','PID-1055','PID-1021','PID-1153')


select round((SurgeryDate-CaseRequestDate)/7,1) as Wait
, patientID 
from SurgicalProcedures;




