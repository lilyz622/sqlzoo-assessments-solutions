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

--#9
/*
For each shift show the number of staff assigned. Beware that some roles may be NULL and that the same person might have been assigned to multiple roles (The roles are 'Manager', 'Operator', 'Engineer1', 'Engineer2').
*/
select shift_date, shift_type, count(distinct p) from (
(select shift_date, shift_type, manager p
  from Shift
)
union
(select shift_date, shift_type, operator p
  from Shift
)
union
(select shift_date, shift_type, engineer1 p
 from Shift)
union
(select shift_date, shift_type, engineer2 p
 from Shift)) x
group by 1,2
 
--#10 
/*
 Caller 'Harry' claims that the operator who took his most recent call was abusive and insulting. Find out who took the call (full name) and when.
*/
SELECT Staff.first_name, Staff.last_name, call_date
FROM Caller
  JOIN Issue ON Caller.caller_id=Issue.caller_id
  JOIN Staff ON Issue.taken_by=Staff.staff_code
WHERE Caller.first_name='Harry'
ORDER BY call_date DESC
LIMIT 1
