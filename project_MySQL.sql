drop database if exists Mysql_project;
create database Mysql_Project;
use Mysql_Project;
show databases;
drop database Mysql_Project;

-- Creating table 'Geo' 

drop database if exists geo;
create table geo (
  `GeoID` varchar(4) primary key,
  `Geo` text,
  `Region` text
);
describe geo;

-- Inserting in table 'geo'
lock tables `geo` write;
insert into `geo` values ('G1','India','APAC'),('G2','USA','Americas'),('G3','Canada','Americas'),('G4','New Zealand','APAC'),('G5','Australia','APAC'),('G6','UK','Europe');
unlock tables;

drop database if exists people;
-- Creating table `people`
create table people (
  `Salesperson` text,
  `SPID` varchar(6) primary key,
  `Team` text,
  `Location` text
);

-- Inserting into `people`
lock tables `people` write;
insert into `people` values ('Barr Faughny','SP01','Yummies','Hyderabad'),('Dennison Crosswaite','SP02','Yummies','Hyderabad'),('Gunar Cockshoot','SP03','Yummies','Hyderabad'),
                            ('Wilone O\'Kielt','SP04','Delish','Hyderabad'),('Gigi Bohling','SP05','Delish','Hyderabad'),('Curtice Advani','SP06','Delish','Hyderabad'),
                            ('Kaine Padly','SP07','Delish','Hyderabad'),('Ches Bonnell','SP08','Unassigned','Hyderabad'),('Andria Kimpton','SP09','Jucies','Hyderabad'),
                            ('Brien Boise','SP10','Jucies','Wellington'),('Husein Augar','SP11','Yummies','Wellington'),('Karlen McCaffrey','SP12','Yummies','Wellington'),
                            ('Jan Morforth','SP13','Delish','Wellington'),('Dotty Strutley','SP14','Delish','Wellington'),('Kelci Walkden','SP15','Yummies','Wellington'),
                            ('Marney O\'Breen','SP16','Jucies','Wellington'),('Rafaelita Blaksland','SP17','Unassigned','Wellington'),('Madelene Upcott','SP18','Jucies','Wellington'),
                            ('Beverie Moffet','SP19','Jucies','Seattle'),('Oby Sorrel','SP20','Jucies','Seattle'),('Mallorie Waber','SP21','Unassigned','Seattle'),
                            ('Jehu Rudeforth','SP22','Unassigned','Seattle'),('Van Tuxwell','SP23','Yummies','Seattle'),('Roddy Speechley','SP24','Delish','Seattle'),
                            ('Camilla Castle','SP25','Delish','Seattle'),('Janene Hairsine','SP26','Delish','Paris'),('Niall Selesnick','SP27','Jucies','Paris'),
                            ('Ebonee Roxburgh','SP28','Unassigned','Paris'),('Zach Polon','SP29','Yummies','Paris'),('Orton Livick','SP30','Yummies','Paris'),
                            ('Gray Seamon','SP31','Delish','Paris'),('Benny Karolovsky','SP32','Jucies','Paris'),('Dyna Doucette','SP33','Jucies','Paris');
unlock tables;

drop tables if exists products;
-- Creating table `products`
create table products (
  `PID` varchar(6) primary key,
  `Product` text,
  `Category` text,
  `Size` text,
  `Cost_per_box` double default null
);
lock tables `products` write;

-- Inserting into `products`
insert into `products` values ('P01','Milk Bars','Bars','LARGE',1.52),('P02','50% Dark Bites','Bites','LARGE',2.57),('P03','Almond Choco','Bars','LARGE',9.6),
                              ('P04','Raspberry Choco','Bars','LARGE',4.09),('P05','Mint Chip Choco','Bars','LARGE',1.54),('P06','Eclairs','Bites','LARGE',2.24),
                              ('P07','Drinking Coco','Other','LARGE',1.62),('P08','99% Dark & Pure','Bars','LARGE',2.47),('P09','Orange Choco','Bars','LARGE',7.14),
                              ('P10','Spicy Special Slims','Bites','LARGE',5.79),('P11','After Nines','Bites','LARGE',4.43),('P12','Fruit & Nut Bars','Bars','LARGE',1.58),
                              ('P13','85% Dark Bars','Bars','SMALL',0.64),('P14','White Choc','Other','SMALL',0.16),('P15','Baker\'s Choco Chips','Bars','SMALL',3.4),
                              ('P16','Organic Choco Syrup','Other','SMALL',1.47),('P17','Caramel Stuffed Bars','Bars','SMALL',0.54),
                              ('P18','Manuka Honey Choco','Other','SMALL',4.75),('P19','70% Dark Bites','Bites','SMALL',4.97),('P20','Smooth Sliky Salty','Bars','SMALL',2.97),
                              ('P21','Choco Coated Almonds','Bites','SMALL',6.17),('P22','Peanut Butter Cubes','Bites','SMALL',3.57);
unlock tables;

drop tables if exists sales;
-- Creating table `sales`
create table sales (
  `SPID` varchar(6),
  `GeoID` varchar(4),
  `PID` varchar(6),
  `SaleDate` datetime default null,
  `Amount` int default null,
  `Customers` int default null,
  `Boxes` int default null,
  foreign key(GeoID) references geo(GeoID),
  foreign key(SPID) references people(SPID),
  foreign key(PID) references products(PID)
);

-- Inserting into `sales`
lock tables `sales` write;
insert into `sales` values ('SP01','G4','P04','2021-01-01 00:00:00',8414,276,495),('SP02','G3','P14','2021-01-01 00:00:00',532,317,54),('SP12','G2','P08','2021-01-01 00:00:00',5376,178,269),('SP01','G4','P15','2021-01-01 00:00:00',259,32,22),
('SP19','G2','P18','2021-01-01 00:00:00',5530,4,179),('SP17','G1','P13','2021-01-01 00:00:00',2184,63,122),('SP20','G6','P04','2021-01-01 00:00:00',1057,295,71),('SP14','G5','P16','2021-01-01 00:00:00',1036,370,37),
('SP10','G5','P17','2021-01-01 00:00:00',4039,536,176),('SP06','G4','P01','2021-01-01 00:00:00',12894,115,478),('SP18','G2','P01','2021-01-01 00:00:00',4669,121,180),('SP04','G4','P16','2021-01-01 00:00:00',6377,184,246),
('SP22','G3','P05','2021-01-01 00:00:00',4599,106,256),('SP22','G2','P09','2021-01-01 00:00:00',2751,228,251),('SP10','G1','P06','2021-01-01 00:00:00',15596,32,975),('SP06','G1','P11','2021-01-01 00:00:00',8561,111,330),
('SP25','G6','P05','2021-01-01 00:00:00',14273,335,752),('SP02','G4','P13','2021-01-01 00:00:00',2506,99,148),('SP19','G3','P10','2021-01-01 00:00:00',2387,134,89),('SP09','G2','P07','2021-01-01 00:00:00',7553,67,280),
('SP22','G4','P22','2021-01-01 00:00:00',3409,93,171),('SP15','G2','P22','2021-01-01 00:00:00',3878,24,216),('SP12','G2','P04','2021-01-01 00:00:00',3052,76,204),('SP18','G2','P21','2021-01-04 00:00:00',19229,64,1013),
('SP15','G6','P21','2021-01-04 00:00:00',1988,179,95),('SP12','G6','P09','2021-01-04 00:00:00',147,9,11),('SP20','G6','P12','2021-01-04 00:00:00',2401,407,134),('SP11','G2','P17','2021-01-04 00:00:00',2814,296,94),
('SP06','G6','P17','2021-01-04 00:00:00',5390,61,216),('SP23','G3','P02','2021-01-04 00:00:00',3920,16,262),('SP19','G3','P19','2021-01-04 00:00:00',7539,502,943),('SP23','G1','P16','2021-01-05 00:00:00',17248,163,664),
('SP18','G6','P03','2021-01-05 00:00:00',1176,152,66),('SP17','G5','P13','2021-01-05 00:00:00',9730,361,573),('SP16','G4','P13','2021-01-05 00:00:00',2226,129,140),('SP18','G6','P12','2021-01-05 00:00:00',7063,250,643),
('SP07','G4','P11','2021-01-05 00:00:00',7399,420,275),('SP04','G2','P09','2021-01-05 00:00:00',4284,230,306),('SP07','G4','P04','2021-01-05 00:00:00',4865,168,271),('SP06','G4','P19','2021-01-05 00:00:00',3780,111,315),
('SP13','G1','P09','2021-01-05 00:00:00',3059,484,279),('SP11','G6','P11','2021-01-05 00:00:00',6622,57,276),('SP04','G1','P20','2021-01-06 00:00:00',644,116,34),('SP08','G1','P11','2021-01-06 00:00:00',4935,87,171),
('SP13','G6','P22','2021-01-06 00:00:00',7182,29,378),('SP09','G5','P09','2021-01-06 00:00:00',539,10,77),('SP20','G6','P19','2021-01-06 00:00:00',637,79,91),('SP07','G2','P15','2021-01-06 00:00:00',1470,57,184),
('SP10','G2','P13','2021-01-06 00:00:00',1442,108,61),('SP11','G2','P20','2021-01-06 00:00:00',9023,224,564),('SP03','G6','P01','2021-01-06 00:00:00',2709,27,101),('SP19','G3','P21','2021-01-07 00:00:00',5733,193,338),
('SP05','G3','P02','2021-01-07 00:00:00',10451,155,1307),('SP18','G1','P18','2021-01-07 00:00:00',11228,236,388),('SP15','G6','P17','2021-01-07 00:00:00',3073,137,129),('SP09','G5','P13','2021-01-07 00:00:00',5467,109,288),
('SP08','G2','P20','2021-01-07 00:00:00',4067,272,226),('SP02','G1','P05','2021-01-08 00:00:00',2814,69,149),('SP24','G4','P17','2021-01-08 00:00:00',2716,299,105),('SP22','G5','P09','2021-01-08 00:00:00',3570,61,325),
('SP12','G1','P13','2021-01-08 00:00:00',9562,123,479),('SP17','G4','P22','2021-01-08 00:00:00',2373,2,104),('SP08','G1','P17','2021-01-08 00:00:00',2807,236,123),('SP10','G2','P01','2021-01-08 00:00:00',420,196,14),
('SP06','G2','P04','2021-01-08 00:00:00',8239,157,515),('SP05','G4','P02','2021-01-08 00:00:00',6797,114,486),('SP22','G4','P13','2021-01-08 00:00:00',6048,56,319),('SP05','G5','P04','2021-01-08 00:00:00',364,14,21),
('SP19','G5','P14','2021-01-08 00:00:00',6496,15,406),('SP24','G2','P09','2021-01-08 00:00:00',1057,45,106),('SP08','G6','P04','2021-01-08 00:00:00',357,185,17),('SP08','G5','P07','2021-01-08 00:00:00',6419,359,257),
('SP08','G3','P10','2021-01-08 00:00:00',12726,179,579),('SP16','G2','P13','2021-01-11 00:00:00',6006,109,376),('SP15','G6','P08','2021-01-11 00:00:00',5124,33,285),('SP23','G4','P01','2021-01-11 00:00:00',2709,188,113),
('SP01','G5','P01','2021-01-11 00:00:00',7238,67,315),('SP06','G1','P14','2021-01-12 00:00:00',6776,68,424),('SP11','G6','P01','2021-01-12 00:00:00',189,123,8),('SP08','G2','P12','2021-01-12 00:00:00',4669,217,390),
('SP01','G3','P19','2021-01-12 00:00:00',490,188,35),('SP08','G5','P19','2021-01-12 00:00:00',4235,76,283),('SP13','G2','P07','2021-01-12 00:00:00',4487,161,187),('SP02','G3','P15','2021-01-12 00:00:00',2653,147,332),
('SP04','G4','P10','2021-01-12 00:00:00',5306,5,253),('SP16','G2','P02','2021-01-12 00:00:00',6888,112,689),('SP08','G4','P16','2021-01-12 00:00:00',721,45,24),('SP14','G1','P10','2021-01-12 00:00:00',8610,124,345),
('SP10','G2','P12','2021-01-12 00:00:00',11739,22,903),('SP16','G1','P09','2021-01-13 00:00:00',4774,206,341),('SP10','G3','P02','2021-01-13 00:00:00',6307,123,789),('SP21','G3','P08','2021-01-13 00:00:00',4340,168,217),
('SP09','G1','P19','2021-01-13 00:00:00',1078,76,77),('SP13','G6','P03','2021-01-13 00:00:00',5418,287,247),('SP03','G2','P21','2021-01-13 00:00:00',6069,268,434),('SP15','G2','P21','2021-01-13 00:00:00',12334,119,686),
('SP08','G6','P07','2021-01-13 00:00:00',728,234,32),('SP21','G1','P15','2021-01-13 00:00:00',2135,179,165),('SP07','G4','P13','2021-01-13 00:00:00',2121,130,89),('SP12','G6','P01','2021-01-14 00:00:00',6881,10,222),
('SP24','G4','P07','2021-01-14 00:00:00',1239,97,50),('SP16','G5','P05','2021-01-14 00:00:00',3598,365,257),('SP18','G3','P20','2021-01-14 00:00:00',6580,210,347),('SP08','G6','P10','2021-01-14 00:00:00',1127,97,54),
('SP22','G1','P22','2021-01-14 00:00:00',3605,345,139),('SP09','G4','P11','2021-01-14 00:00:00',5096,201,196),('SP25','G2','P08','2021-01-14 00:00:00',2135,183,98),('SP13','G2','P04','2021-01-14 00:00:00',35,142,3),
('SP11','G1','P19','2021-01-14 00:00:00',13090,17,935),('SP05','G6','P20','2021-01-14 00:00:00',15785,209,1128),('SP20','G5','P12','2021-01-14 00:00:00',14574,86,810),('SP11','G4','P17','2021-01-14 00:00:00',3556,195,143),
('SP02','G2','P12','2021-01-14 00:00:00',14532,142,969),('SP23','G4','P17','2021-01-14 00:00:00',4445,340,159),('SP17','G2','P01','2021-01-14 00:00:00',10339,207,357),('SP03','G4','P11','2021-01-14 00:00:00',1351,282,55),
('SP02','G4','P15','2021-01-14 00:00:00',4011,260,335),('SP17','G6','P12','2021-01-14 00:00:00',5306,333,483),('SP24','G2','P11','2021-01-14 00:00:00',18704,78,585),('SP21','G3','P20','2021-01-14 00:00:00',9310,62,582),
('SP04','G4','P06','2021-01-14 00:00:00',1211,37,61),('SP09','G3','P04','2021-01-15 00:00:00',3094,317,148),('SP17','G4','P04','2021-01-15 00:00:00',4949,244,248),('SP06','G4','P08','2021-01-15 00:00:00',308,91,19),
('SP11','G1','P17','2021-01-15 00:00:00',7546,49,329),('SP12','G2','P13','2021-01-15 00:00:00',6713,422,373),('SP14','G4','P17','2021-01-15 00:00:00',6895,318,300),('SP02','G4','P05','2021-01-15 00:00:00',3430,120,202),
('SP21','G4','P14','2021-01-18 00:00:00',4165,61,348),('SP25','G1','P03','2021-01-18 00:00:00',2380,209,159),('SP03','G6','P14','2021-01-18 00:00:00',6594,114,413),('SP04','G5','P04','2021-01-18 00:00:00',1428,55,76),
('SP19','G5','P07','2021-01-18 00:00:00',2646,150,116),('SP10','G1','P01','2021-01-18 00:00:00',238,364,11),('SP24','G5','P04','2021-01-18 00:00:00',945,298,50),('SP11','G6','P10','2021-01-18 00:00:00',9436,102,337),
('SP17','G2','P10','2021-01-18 00:00:00',4081,116,152),('SP04','G2','P08','2021-01-18 00:00:00',10556,25,587),('SP01','G2','P14','2021-01-18 00:00:00',2331,38,167),('SP11','G3','P16','2021-01-19 00:00:00',896,346,32),
('SP20','G1','P18','2021-01-19 00:00:00',4214,314,169),('SP20','G3','P09','2021-01-19 00:00:00',2121,90,177),('SP23','G1','P13','2021-01-19 00:00:00',1029,386,47),('SP08','G1','P05','2021-01-19 00:00:00',15407,103,771),
('SP03','G4','P17','2021-01-19 00:00:00',10129,134,406),('SP13','G2','P20','2021-01-19 00:00:00',16380,203,1092),('SP24','G1','P14','2021-01-19 00:00:00',3899,102,279),('SP05','G3','P10','2021-01-19 00:00:00',12075,264,432),
('SP11','G2','P18','2021-01-19 00:00:00',10696,115,428),('SP19','G2','P03','2021-01-19 00:00:00',4039,436,238),('SP18','G1','P22','2021-01-19 00:00:00',5250,410,202),('SP21','G1','P08','2021-01-19 00:00:00',8113,25,508),
('SP08','G6','P06','2021-01-19 00:00:00',161,95,10),('SP07','G6','P10','2021-01-19 00:00:00',8218,205,294),('SP06','G5','P15','2021-01-19 00:00:00',742,80,53),('SP03','G2','P11','2021-01-19 00:00:00',3087,193,111),
('SP08','G1','P18','2021-01-19 00:00:00',5110,131,155),('SP04','G4','P04','2021-01-19 00:00:00',5873,164,267),('SP11','G6','P05','2021-01-19 00:00:00',4641,301,357),('SP04','G4','P22','2021-01-20 00:00:00',1155,34,45),
('SP10','G6','P02','2021-01-20 00:00:00',784,247,49),('SP25','G4','P05','2021-01-20 00:00:00',5369,16,384),('SP10','G3','P06','2021-01-20 00:00:00',343,338,18),('SP10','G6','P19','2021-01-20 00:00:00',7007,38,584),
('SP15','G1','P15','2021-01-20 00:00:00',126,127,13),('SP16','G1','P08','2021-01-20 00:00:00',3073,57,134),('SP19','G4','P21','2021-01-21 00:00:00',7805,86,488),('SP09','G6','P11','2021-01-21 00:00:00',3087,14,124),
('SP13','G4','P21','2021-01-21 00:00:00',9030,85,452),('SP04','G2','P20','2021-01-21 00:00:00',7805,6,411),('SP18','G1','P11','2021-01-21 00:00:00',6979,38,233),('SP19','G1','P07','2021-01-21 00:00:00',11284,39,513),
('SP17','G5','P01','2021-01-21 00:00:00',2408,106,90),('SP03','G6','P02','2021-01-21 00:00:00',5299,86,332),('SP10','G6','P16','2021-01-21 00:00:00',6293,158,234),('SP08','G5','P03','2021-01-21 00:00:00',280,408,17);
unlock tables;

select * from geo;
select * from people;
select * from products;
select * from sales;


####################### questions #############################
#1.
alter table geo rename column Geo to Country;


#2.
alter table geo modify column Region text not null;
alter table geo modify column Country text not null;
describe geo;


#3.
select  p.Category,
    SUM(s.Amount) AS Total_Sales_Amount,
    SUM(s.Boxes) AS Total_Boxes_Sold
from sales s
join products p on s.PID = p.PID
GROUP BY p.Category;


#4.
SELECT *
FROM sales 
WHERE SPID IN ('SP01', 'SP02', 'SP07', 'SP08');


#5.
select PID, Product, Category
from Products 
where Category like 'B%';


#6.
select SPID, GeoID, PID, SaleDate, 
       Amount, Customers, Boxes 
from  sales 
order by Amount desc limit 10;


#7.
select Team, count(Salesperson)
from people 
group by Team;


#9.
select PID, sum(Amount) as TotalSales 
FROM sales group by PID 
having sum(Amount) > 1000;


#10.
select Product, Cost_per_box
from products
where Cost_per_box = (
    select max(Cost_per_box)
    from products);

-- select SPID, sum(Amount) as TotalSales 
-- from sales group by SPID 
-- having 
-- sum(Amount) > (select sum(Amount) from sales where PID = 'P01');

-- select pr.PID, pr.Product, pr.Category, pr.Size, sum(s.Amount) as Total_sales
-- from products pr join sales s
-- on pr.PID = s.PID
-- where pr.PID = (
--     select s.PID from sales group by s.PID
--     order by sum(Amount) desc limit 1
-- ) ;

-- select p.Salesperson, sum(s.Amount) AS TotalSales
-- from sales s
-- join people p on s.SPID = p.SPID
-- group by p.Salesperson
-- having sum(s.Amount) = (
--     select max(TotalSales)
--     from (
--         select sum(Amount) as TotalSales
--         from sales
--         group by SPID
--     )
-- );

#11.
select p.Salesperson, p.Team, p.SPID, s.SPID, s.Amount, 
       s.Customers, pr.Category, pr.Product, pr.PID 
from sales s 
join people p on s.SPID = p.SPID  
join products pr on s.PID = pr.PID 
where pr.category = "BARS" and p.Salesperson = "Barr Faughny" 
order by s.Amount desc;


#12.
delimiter $$
create procedure insert_new_salesper(
    in p_Salesperson text, 
    in p_SPID varchar(6), 
    in p_Team text, 
    in p_Location text
)
begin	
    insert into people(Salesperson, SPID, Team, Location) 
    values(p_Salesperson, p_SPID, p_Team, p_Location);
end$$
delimiter ;

CALL insert_new_salesper('Angad', 'SP34', 'Mango', 'Ratnagiri');
select * from people;


#13.
delimiter $$
create function avg_sales_by_region(
e_Region text)
returns decimal(10,2)
deterministic
begin
	declare averageAmount decimal(10,2);
    select avg(s.Amount) into averageAmount
    from sales s join geo g
    on s.GeoID = g.GeoID
    where g.Region = e_Region;
    return averageAmount;
end$$
delimiter ;
select avg_sales_by_region("Americas");

#14.
delimiter $$
	create trigger prevent_duplicate_spid
	before insert on people
	for each row
	begin
		declare existing_count int;
		select count(*) into existing_count 
		from people 
		where SPID = new.SPID;

		if existing_count > 0 then
			signal sqlstate '45000' 
			set message_text = 'Duplicate SPID is not allowed';
		end if;
	end$$
delimiter ;
insert into people values("Angad", "SP01", "Mango", "Ratnagiri");




#15
create view show_product_info as 
select g.Country, p.Salesperson,
       pr.Product, pr.Category, 
       pr.Size, s.SaleDate, 
       s.Amount, s.Boxes
from
geo g join sales s on s.GeoID = g.GeoID join
people p on p.SPID = s.SPID join
products pr on pr.PID = s.PID;

select * from show_product_info;

