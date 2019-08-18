/*
SQLZoo Helpdesk Medium Questions and Solutions
*/

--#6
/*
List the Company name and the number of calls for those companies with more than 18 calls.
*/
SELECT company_name, count(call_ref) as cc
FROM Customer 
  JOIN Caller ON Customer.Company_ref=Caller.Company_ref
  JOIN Issue ON Caller.Caller_id=Issue.Caller_id
GROUP BY company_name
HAVING cc > 18
