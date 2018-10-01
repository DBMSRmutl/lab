mysqldump -u bonn -p --all-databases >  alldb.sql
mysqldump -u bonn -p thailand >  thailanddb.sql
mysql -u bonn -p --one-database thailandTest < thailanddb.sql
create database thailandTest;
mysql -u bonn -p --one-database thailandTest < thailanddb.sql

