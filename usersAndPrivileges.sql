use thailand;
create user IF NOT EXISTS 'testUser'@'localhost' identified by '3333';

create user if not exists myuser identified by '1234';

grant all privileges on *.* to myuser with grant option;

-- revoke all privileges on *.* from myuser;

revoke all privileges, grant option from myuser;

drop user if exists myuser;
