

set serveroutput on;

declare
begin
dbms_output.put_line('Press 2 to see how many teams');
dbms_output.put_line('Press 1 to see polling seats');
end;
/

declare
v_seat_no candidate.seat_no%type;
v_seat_name candidate.seat_name%type;
 
x number;
begin
x:=&x;
if x=1 then
for p in (select distinct seat_no,seat_name into v_seat_no,v_seat_name
from candidate
order by seat_no,seat_name)
loop
dbms_output.put_line(v_seat_no ||v_seat_name);
end loop;
end if;
end;
/


set verify off;
select ss prompt 'Enter District to show its candidate';

select name,seat_name
from candidate
where seat_name like '%'||'&ss'||'%';
/*set verify on;*/
