use fest_management;

-- 1)
-- How many tickets were sold for a particular festival event?
DELIMITER //
create procedure tickets_sold(eventID int)
begin
	select count(*) from ticket
    where event_ID = eventID;
end//
DELIMITER ;

-- 2)
-- Which festival events are sold out?
-- Total number of tickets available is stored in capacity inside the festival_event table. Count is measured using the ticket table.
DELIMITER //
create procedure events_sold_out(festivalID int)
begin
	select festival_event.event_ID, festival_event.event_name, festival_event.capacity
    from festival_event natural join ticket
    where festival_event.festival_id = festivalID 
    group by festival_event.event_ID
    having count(ticket.ticket_id) = festival_event.capacity;
end//
DELIMITER ;	

-- 3)
-- What is the total revenue generated from ticket sales for a particular festival event?
DELIMITER //
create procedure total_revenue(eventID int)
begin
	select sum(ticket_price) from ticket
    where event_ID =eventID;
end//
DELIMITER ;	

-- 4)
-- Which vendors have applied to participate in a festival?
DELIMITER //
create procedure vendor(festivalID int)
begin
	select vendor_id,vendor_name from vendor
    where vendor_id in (select vendor_id from vendor_booth where festival_id = festivalID);
end//
DELIMITER ;	

-- 5)
-- How many attendees have purchased tickets for a specific festival event?
DELIMITER //
create procedure attendee_tickets_bought(eventID int)
begin
	select count(distinct(attendee_id)) from ticket
	where event_id = eventID;
end//
DELIMITER ;	

-- 6)
-- Who are the sponsors for a particular event if there are any?
DELIMITER //
create procedure event_sponsor(eventID int)
begin
	select * from sponsor
    where sponsor_id in (select sponsor_id from event_sponsorship where event_id = eventID);
end//
DELIMTER ;



-- 7)
-- Checks all the events and displays them in descending order of attendance
DELIMITER //
create procedure highest_attendance(festivalID int)
begin
	select festival_event.event_id,festival_event.event_name,count(ticket.event_id) 
    from festival_event natural join ticket
    where festival_event.festival_ID = festivalID 
    group by event_id
    order by count(event_id) desc;
end//
DELIMITER ;	

-- 8)
-- What is the average ticket price for a specific event?
DELIMITER //
create procedure avg_price(eventID int)
begin
	select avg(ticket_price) from ticket
    where event_ID = eventID;
end//
DELIMITER ;

-- 9)
-- Which performers are scheduled to perform at a particular event?
-- Checks the performer table using the eventID parameter
DELIMITER //
create procedure performers(eventID int)
begin
	select performer.performer_id,performer.performer_name,festival_event.genre,festival_event.date_time 
    from festival_event natural join performer
    where festival_event.event_id = eventID;
end//
DELIMITER ;

-- 10)
-- What is the total number of tickets sold for all festival events combined?
DELIMITER //
create procedure total_tickets_sold(festivalID int)
begin
	select sum(num_tickets_bought) from attendee_fest
    where festival_id = festivalID;
end//
DELIMITER ;

-- 11)
-- All the events on a particular date?
-- Used cast to get the date from date_time to check the events on a particular date. 
DELIMITER //
create procedure events_date(festivalID int, event_date date)
begin
	select event_ID, event_name from festival_event
    where festival_id = festivalID and
    cast(date_time as date) = event_date;
end//
DELIMITER ;	


-- I have created an extra procedure to show the method for purchasing a ticket for the event
DELIMITER //
create procedure buy_ticket(eventID int, attendeeID int, price int)
begin
	if eventID in (select festival_event.event_ID
					from festival_event natural join ticket
					where festival_event.festival_id = (select festival_id from festival_event where event_id = eventID) 
					group by festival_event.event_ID,festival_event.capacity
					having count(ticket.ticket_id) = festival_event.capacity) THEN
		Select 'Event is sold out' as '';
	else
		insert into ticket (`attendee_id` , `event_id` , `ticket_price` , `date_of_sale`)
		values (attendeeID , eventID , price , (select curDate()));
        update attendee_fest
        set num_tickets_bought = num_tickets_bought+1
        where attendee_id = attendee_id and festival_id = (select festival_id from festival_event where event_id = eventID);
	end if;
end//
DELIMITER ;


