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

--#7
/*
Find the callers who have never made a call. Show first name and last name
*/
SELECT first_name, last_name
FROM Caller 
  LEFT JOIN Issue ON Caller.caller_id=Issue.caller_id
WHERE Issue.caller_id IS NULL

--#8
/*
For each customer show: Company name, contact name, number of calls where the number of calls is fewer than 5
*/

SELECT company_name,c.first_name, c.last_name, COUNT(*) as nc
FROM Customer
  JOIN Caller ON Customer.company_ref = Caller.company_ref
  JOIN Issue on Caller.caller_id=Issue.caller_id
  JOIN Caller c ON Customer.contact_id = c.caller_id
GROUP BY 1,2,3
HAVING nc < 5
