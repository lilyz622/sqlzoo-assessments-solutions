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
