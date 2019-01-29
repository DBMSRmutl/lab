use thailand;
-- LOAD DATA INFILE '/var/lib/mysql-files/es-trim-csv-ascii.csv' INTO TABLE villageThailandTest FIELDS TERMINATED BY ',' ENCLOSED BY "'" LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

LOAD DATA INFILE '/var/lib/mysql-files/es-trim-csv-utf-8.csv' INTO TABLE villageThailandTest FIELDS TERMINATED BY '\t' ENCLOSED BY "'" LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

