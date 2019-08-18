/*
SQLZoo Helpdesk Hard Solutions
*/

--#11
/*
Show the manager and number of calls received for each hour of the day on 2017-08-12
*/
SELECT m.staff_code as Manager, LEFT(call_date,13) AS Hr, COUNT(*) AS cc
FROM Shift 
  JOIN Staff m ON m.staff_code=Shift.manager
  JOIN Staff o ON o.staff_code=Shift.operator
  JOIN Issue ON Issue.taken_by=o.staff_code
GROUP BY 1,2
HAVING LEFT(Hr,10)='2017-08-12'
ORDER BY 2
