select manager, substring(call_date,1,13), count(call_ref) from Issue join Staff on (staff_code=taken_by)
  join Shift s on (s.shift_date = substring(Issue.call_date,1,10))
where (Staff.staff_code = s.manager
  or staff_code = s.operator)
  and ((shift_type='late'
    and cast(substring(call_date,11,13) as int)>=14)
    or (shift_type='early'
    and substring(call_date,11,13)<'14'))
  and shift_date = '2017-08-12'
group by 1,2