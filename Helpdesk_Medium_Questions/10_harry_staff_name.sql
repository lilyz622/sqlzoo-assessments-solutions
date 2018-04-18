select Staff.first_name, Staff.last_name, Issue.call_date
from Staff join Issue on (staff_code=taken_by)
  join Caller on (Caller.caller_id=Issue.caller_id)
where Caller.first_name='Harry'
order by 3 desc limit 1