-- Create a Table SalesPeople
create table SalesPeople ( 
Snum int(4),
PRIMARY KEY (Snum),
Sname varchar(10),
UNIQUE(Sname), 
City varchar(10), 
Comm int(10) 
);

Insert into SalesPeople values (1001, 'Peel', 'London', 12);
Insert into SalesPeople values (1002, 'Serres', 'Sanjose', 13);
Insert into SalesPeople values (1004, 'Motika', 'London', 11);
Insert into SalesPeople values (1007, 'Rifkin', 'Barcelona', 15);
Insert into SalesPeople values (1003, 'Axelrod', 'Newyork', 10);
select * from SalesPeople;

-- Create a Table Customers
create table Customers ( 
Cnum int(4),
PRIMARY KEY(Cnum), 
Cname varchar(10),
City varchar(10) NOT NULL, 
Snum int(4),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

Insert into Customers values (2001, 'Hoffman', 'London', 1001);
Insert into Customers values (2002, 'Giovanni', 'Rome', 1003);
Insert into Customers values (2003, 'Liu', 'Sanjose', 1002);
Insert into Customers values (2004, 'Grass', 'Berlin', 1002);
Insert into Customers values (2006, 'Clemens', 'London', 1001);
Insert into Customers values (2008, 'Cisneros', 'Sanjose', 1007);
Insert into Customers values (2007, 'Pereira', 'Rome', 1004);
select * from  Customers;

-- Create a Table Orders
create table Orders (
Onum int(4),
PRIMARY KEY(onum),
Amt int(7), 
Odate date, 
Cnum int(4),
FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
Snum int(4),
FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

Insert into Orders values (3001, 18.69, '1990-10-03', 2008, 1007);
Insert into Orders values ( 3003, 767.19, '1990-10-03', 2001, 1001);
Insert into Orders values (3002, 1900.10, '1990-10-03', 2007, 1004);
Insert into Orders values (3005, 5160.45, '1990-10-03', 2003, 1002);
Insert into Orders values (3006, 1098.16, '1990-10-03', 2008, 1007);
Insert into Orders values (3009, 1713.23, '1990-10-04', 2002, 1003);
Insert into Orders values (3007, 75.75, '1990-10-04', 2004, 1002);
Insert into Orders values (3008, 4273.00, '1990-10-05', 2006, 1001);
Insert into Orders values (3010, 1309.95, '1990-10-06', 2004, 1002);
Insert into Orders values (3011, 9891.88, '1990-10-06', 2006, 1001);
select * from Orders;


--  Count the number of Salesperson whose name begin with ‘a’/’A’.
select COUNT(Sname) from SalesPeople where Sname LIKE 'a%' or Sname LIKE 'A%';

--  Display all the Salesperson whose all orders worth is more than Rs.2000.
select Snum from Orders WHERE Amt>2000;  
   
--  Count the number of Salesperson belonging to Newyork.
select Count(Sname) from SalesPeople WHERE City = 'Newyork';

--  Display the number of Salespeople belonging to London and belonging to Paris.
select Count(Sname) from SalesPeople WHERE City ='London' and City ='Paris';

--   Display the number of orders taken by each Salesperson and their date of orders.
select Count(Snum) from Orders group by Snum, odate;