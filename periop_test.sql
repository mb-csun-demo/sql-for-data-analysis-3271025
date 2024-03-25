
/* This will show you the schema of the table */
DESCRIBE SurgicalProcedures;

/* Drop the table and start over again */
Drop Table SurgicalProcedures;

/* Show all rows */
select * from SurgicalProcedures;

/* Count total procedures in table */
Select count(procedurename) from SurgicalProcedures;

/* Count how many of each procedures in table */
select Procedurename, count(patientID) 
from SurgicalProcedures GROUP BY ProcedureName
Order by count(patientID) desc ;


/* Calculated the Wait Weeks */
select round((SurgeryDate-CaseRequestDate)/7,1) as Wait
, patientID 
from SurgicalProcedures;




