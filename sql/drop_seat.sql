create or replace procedure drop_seat
is 
begin
update seats
set res_id=Null,
res_date=Null
where res_date + (interval '6' hour) <= sysdate ; 
commit;
end;
/