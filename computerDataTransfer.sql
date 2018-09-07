use computer;
delete from computer.Laptop;
insert into computer.Laptop
 select model, speed, ram, hd, screen, price from computer1.Laptop;

delete from computer.PC;
insert into computer.PC
 select model, speed, ram, hd, price from computer1.PC;

delete from computer.Printer;
insert into computer.Printer
 select model, color, type, price from computer1.Printer;

delete from computer.Product;
insert into computer.Product
 select maker, model, type from computer1.Product;
