use fest_management;

 insert into festival
 (`festival_name` , `institute` , `start_date`)
 values
 ('Oasis' , 'BITS Pilani' , '2022-11-04'),
 ('Bosm' , 'BITS Pilani' , '2022-07-21'),
 ('Apogee' , 'BITS Pilani' , '2023-03-15'),
 ('Inter-BITS' , 'BITS Pilani' , '2023-04-09'),
 ('MoodIndigo' , 'IIT Bombay' , '2022-11-04');
 
insert into Sponsor
(`sponsor_name`,`logo`)
values 
('BeReal','https://bere.al/images/logos/bereal-title.png'),
('HDFC Bank','https://www.hdfcbank.com/content/api/contentstream-id/723fb80a-2dde-42a3-9793-7ae1be57c87f/4f9ea091-71e0-484e-b00b-07f39e1fa4e2/Common/DAP/Adobe%20Forms/June-2021/logo_regular.jpg'),
('ELearnMarkets','https://d24uab5gycr2uz.cloudfront.net/uploads/white_theme/images/elm_logo.svg'),
('Times Prime','https://static.timesprime.com/3x/timesprime-md.png');


insert into festival_event
(`festival_id`,`event_name`,`organiser`,`date_time`,`location`,`capacity`,`genre`) 
values
(1 , 'Tarang' , 'Department of Theatre' , '2022-11-05 02:00:00' , 'Main Auditorium' ,1000 , 'Music'),
(3 , 'Drone Race' , 'RC Club' , '2023-03-17 15:30:00' , 'Gym Grounds' , 500 , 'Tech'),
(2 , 'Football - SJCC vs IIT-B' , 'Department of BoSM Controls' , '2022-07-22 08:00:00' , 'Gym Grounds' , 500, 'Sports'),
(1 , 'N2o' , 'Hindi Activities Society' , '2022-11-06 16:00:00' , 'Main Auditorium' , 2000 , 'Stand-up Comedy'),
(1 , 'Prof Show - Prabh Deep' , 'Department of Live Events' , '2022-11-04 22:00:00' , 'South Park' , 2000,'Concert'),
(4, 'AntiCoding' , 'Computer Science Association' , '2023-04-10 16:00:00' , 'Main Auditorium' ,100 , 'Tech'),
(5 , 'Prof Show - PCRC' , 'Department of Live Events' , '2022-11-05 22:00:00' , 'South Park' , 2000,'Concert');

insert into POC_Contact
values (9999999999,'Vidit Benjwal'),
(8888888888,'Shyam Raghavan'),
(7777777777,'Pulak Mehrotra'),
(6666666666,'Aneesh Kabra'),
(5555555555,'Jai Bothra');

insert into event_sponsorship
(`sponsor_id`,`event_id`,`contribution`,`Contact_No`)
values (1,3,100000,9999999999),
(2,5,200000,9999999999),
(3,4,300000,7777777777),
(4,2,400000,6666666666);

insert into fest_sponsorship
(`sponsor_id`,`festival_id`,`contribution`,`Contact_No`)
values (1,4,1000000,8888888888),
(2,3,2000000,5555555555),
(3,2,3000000,7777777777),
(4,1,4000000,6666666666);

insert into vendor
(`vendor_name`)
values ('Dominos'),
('Burger King'),
('Barbeque Street'),
('Dhruv Soya Chaap'),
('Keventers');

insert into vendor_booth
(`vendor_id`,`festival_id`,`booth_location`,`contact_no`)
values (1,1,'Gym Grounds',9999999999),
(2,4,'M Lawns',9999999999),
(3,5,'S Lawns',8888888888),
(5,2,'South Park',7777777777),
(4,3,'MedC Cricket Grounds',6666666666);

insert into product
(`product_name`,`product_type`,`product_price`,`vendor_id`)
values ('Margherita Pizza-Small','Food',300,1),
('Margherita Pizza-Medium','Food',500,1),
('Margherita Pizza-Large','Food',700,1),
('Chicken Burger','Food',300,2),
('Veg Burger','Food',250,2),
('Chocolate Milk Shake','Shakes',250,5),
('Soya Chaap','Food',200,4),
('Thali','Food',350,3);

  insert into attendee
  (`attendee_name` , `contact_no`)
  values
  ('Tanay Singh' , 9943678901),
  ('Adhvik Ramesh' , 9892137901),
  ('Tanmay Kukreja' , 9754540921),
  ('Suryaansh Krishna' , 9934109934),
  ('Jahnvi Gupta' , 9732678901),
  ('Vikram Komperla' , 9588228901),
  ('Eesha Jain' , 994578989),
  ('Samyukta Raghavan' , 9923677509),
  ('Tanya Kumar' , 9647890107),
  ('Vidhi Shukla' , 9343679449),
  ('Shreeram Verma' , 9932657821),
  ('Nandita Sharma' , 7893401706);
  
  
  insert into ticket
  (`attendee_id` , `event_id` , `ticket_price` , `date_of_sale`)
  values
  (3 , 2 , 200 , '2023-03-13'),
  (2 , 5 , 950 , '2022-11-02'),
  (2 , 5 , 900 , '2023-11-01'),
  (7 , 4 , 600 , '2022-11-01'),
  (10 , 5 , 900 , '2022-11-01'),
  (5 , 2 , 200 , '2023-03-14'),
  (9 , 3 , 50 , '2022-07-21'),
  (8 , 1 , 250 , '2023-03-02'),
  (4 , 7 , 800 , '2022-11-03'),
  (12, 6 , 100 , '2023-03-25');
  
insert into attendee_fest
(`festival_id` , `attendee_id` , `num_tickets_bought`)
values
(1 , 2 , 2),
(1 , 7 , 1),
(1 , 10 , 1),
(1 , 8 , 1),
(2 , 9 , 1),
(3 , 3 , 1),
(3 , 5 , 1),
(4 , 4 , 1),
(5 , 12 ,1);