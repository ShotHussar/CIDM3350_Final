use 3350_Final;
insert into Customer (customername, address, postcode, email, phonenumber)
    values ('John Smith', '123 Drury Lane', 79111,
            'jsmith@cxr.com', '310-805-9801');

update Car
set mileage = mileage +100000
where ID = 'N6AD0CU7EN585013';

insert into Ticket (ticketDate, ticketDesc, c_ID)
    values (current_date, 'change transmission fluid', '3D7TP2CT0AG772172');

update part
set amount = amount - 10
where ID = 1000;