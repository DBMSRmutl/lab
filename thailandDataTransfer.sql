-- transfer data from villageThailand to other tables

use thailand;

-- populate village
delete from village;
insert into village
select village_ID, village_name, village_number, left(village_ID, 6), population
from villageThailand;

-- populate subdistrict
delete from subdistrict;
insert into subdistrict
select distinct left(village_ID,6),subdistrict_name,
left(village_ID,4) from villageThailand;

-- populate district
delete from district;
insert into district
select distinct left(village_ID,4),district_name, left(village_ID,2)
from villageThailand;

-- populate province
delete from province;
insert into province
select distinct left(village_ID,2),province_name
from villageThailand

