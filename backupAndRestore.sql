mysqldump -u bonn -p --all-databases >  alldb.sql
mysqldump -u bonn -p thailand >  thailanddb.sql
mysql -u bonn -p --one-database thailandTest < thailanddb.sql
DROP DATABASE IF EXISTS thailandTest;
create database thailandTest;
mysql -u bonn -p --one-database thailandTest < thailanddb.sql
mysqldump -u bonn -p thailand villageThailandTest >  thailandVillageThailandTest.sql

