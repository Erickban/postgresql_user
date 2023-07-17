erick@MV:~$ sudo -i

create database  particion_tablas;

 create table product (id int,product_name text, price float)PARTITION BY RANGE (price);

 create table particion_product_1 PARTITION OF product for values from (1.00) TO (3000);

 create table particion_product_2 PARTITION OF product for values from (3001) TO (6000);
 create table particion_product_3 PARTITION OF product for values from (6001) TO (10000);
 alter table particion_product_1 add constrain particion_1_check check (price >= 1.00 and price <= 3000);
 alter table particion_product_1 add constraint particion_1_check check (price >= 1.00 and price <= 3000);
alter table particion_product_1 add constraint particion_1_check check (price >= 3001 and price <= 6000);
 alter table particion_product_2 add constraint particion_2_check check (price >= 3001 and price <= 6000);
 
 \i /var/lib/postgresql/product.sql

select count(*) from product;
select count(*) from particion_product_1;
select count(*) from particion_product_2;
select count(*) from particion_product_3;


create table client (id_client INT, first_name TEXT, last_name TEXT, adreess TEXT, country TEXT,
 email TEXT, cellphone TEXT, telephone TEXT, job_title TEXT, gender TEXT, college TEXT) PARTITION BY LIST (gender);


alter table particion_client_1 add constraint particion1_check check (gender= 'Female' OR gender='female');
alter table particion_client_2 add constraint particion2_check check (gender= 'Male' OR gender='male');
 create table particion_client_1 partition of client1 for values IN ('Female', 'female');
 create table particion_client_2 partition of client1 for values IN ('Male', 'male');
  

 \i /var/lib/postgresql/product.sql

select count(*) from particion_client_1;
select count(*) from particion_client_2;

select * from cliente;
select * from particion_client_1;
select * from particion_client_2;

