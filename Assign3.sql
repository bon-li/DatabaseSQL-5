select * from si.car;

set serveroutput on
accept car_serial prompt 'Enter Car Serial Number:';
declare
    c_car si.car%rowtype;
    noowner exception;
begin
    select *
    into c_car
    from si.car
    where carserial=upper('&car_serial');
    if (c_car.custname is NULL) then
        raise noowner;
    end if;
    dbms_output.put_line('Car owner: ' || c_car.custname);
exception
    when noowner then
        dbms_output.put_line('Car has no owner');
    when no_data_found then
        dbms_output.put_line('There is no such car');
end;