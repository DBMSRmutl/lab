use computer;
-- a
select model, ram, screen
from Laptop
where price > 1200;

-- b
select *
from Printer
where color = TRUE;

-- c
select model, hd
from PC
where speed = 3.0 and price < 1000;

-- d
select model, speed, hd
from PC
where price < 800;

-- e
select model, ram/1024 as gigabytes, screen
from Laptop
where price > 1200;

-- f
select maker
from Product
where type = 'laptop';

-- f-1
select distinct (maker)
from Product
where type = 'laptop';


