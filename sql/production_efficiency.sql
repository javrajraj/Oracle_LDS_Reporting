VARIABLE start_date DATE
VARIABLE end_date DATE
VARIABLE loom_id NUMBER
VARIABLE shift_code VARCHAR2(20)

EXEC :start_date := DATE '2022-06-10';
EXEC :end_date := DATE '2022-06-11';
EXEC :loom_id := 25;
EXEC :shift_code := NULL;
