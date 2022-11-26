use 3350_Final;
select * from Service where t_id not in (ID from Ticket);