-- list province name accending
use thailand
select province_name, province_ID
from province
order by convert (province_name using tis620);

select village_name, subdistrict_name, district_name
from villageThailand
where subdistrict_name='ช้างเผือก' and province_name = 'เชียงใหม่';

select village_name, subdistrict_name, district_name, province_name
from villageThailand
where subdistrict_name='อำเภอเมือง' and province_name = 'ลำปาง' 
 or province_name = 'บึงกาฬ'
order by population, subdistrict_name
limit 10;
