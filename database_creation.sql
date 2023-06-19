create database fest_management;
use fest_management;

create table Festival
(festival_id int primary key auto_increment,
 festival_name varchar(30) not null,
 institute varchar(50) not null,
 start_date date not null);

create table Vendor
(vendor_id int primary key auto_increment,
 vendor_name varchar(30) not null);

create table Sponsor
(sponsor_id int primary key auto_increment,
 sponsor_name varchar(30),
 logo varchar(500) not null unique);

create table Festival_Event
(event_id int primary key auto_increment,
 festival_id int,
 event_name varchar(30) not null,
 organiser varchar(30),
 date_time datetime not null,
 location varchar(25) not null,
 capacity int not null,
 genre varchar(25),
 foreign key (festival_id) references festival(festival_id));

create table Attendee
(attendee_id int primary key auto_increment,
 attendee_name varchar(30) not null,
 contact_no bigint not null unique);

create table POC_Contact
(contact_no bigint primary key,
 POC char(25) not null);

create table Event_Sponsorship
(sponsor_id int,
 event_id int,
 contribution int,
 contact_no bigint not null,
 primary key (sponsor_id, event_id),
 foreign key (sponsor_id) references sponsor(sponsor_id),
 foreign key (contact_no) references poc_contact(contact_no),
 foreign key (event_id) references festival_event(event_id));
 
 create table Fest_Sponsorship
 (sponsor_id int,
 festival_id int,
 contribution int,
 contact_no bigint not null,
 primary key (sponsor_id, festival_id),
 foreign key (sponsor_id) references sponsor(sponsor_id),
 foreign key (contact_no) references poc_contact(contact_no),
 foreign key (festival_id) references festival(festival_id));
 
 create table Ticket
 (ticket_id int primary key auto_increment,
  attendee_id int,
  event_id int,
  ticket_price int not null,
  date_of_sale date not null,
  foreign key (attendee_id) references attendee(attendee_id),
  foreign key (event_id) references festival_event(event_id));
  
create table Vendor_Booth
(booth_id int primary key auto_increment,
 vendor_id int,
 festival_id int,
 booth_location varchar(25) not null,
 contact_no bigint not null,
 foreign key (vendor_id) references vendor(vendor_id),
 foreign key (contact_no) references poc_contact(contact_no),
 foreign key (festival_id) references festival(festival_id));
   
create table Attendee_Fest
(festival_id int,
 attendee_id int,
 num_tickets_bought int not null default 0,
 primary key (festival_id, attendee_id),
 foreign key (festival_id) references festival(festival_id),
 foreign key (attendee_id) references attendee(attendee_id));
	
create table Performer
(performer_id int primary key auto_increment,
 performer_name varchar(30) not null,
 event_id int,
 foreign key (event_id) references festival_event(event_id));

create table Product
(product_id int primary key auto_increment,
 product_name varchar(30) not null,
 product_type varchar(20),
 product_price int not null,
 vendor_id int,
 foreign key(vendor_id) references vendor(vendor_id));
 

 
 
 
  
 




        
       

     
     
     
     
 


