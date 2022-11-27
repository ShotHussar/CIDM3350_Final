-- use 3350_Final;
-- select count(ID) from bill where amountRemaining > 0; -- IQ1

/*select c.ID, c.customerName, b.ID as BillNumber, b.amountRemaining -- IQ2
    from customer c join bill b on c.ID = b.c_ID
    where amountRemaining > 0;*/

/*select t.ID, t.ticketDesc, t.ticketDate, s.ID, s.decription, ps.p_ID, -- IQ3
       p.partName, p.amount
    from part_service ps join service s on ps.s_ID = s.ID
    join part p on ps.p_ID = p.ID
    join ticket t on s.t_ID = t.ID
    join car c on t.c_ID = c.ID
    where c.ID = '4USBU53567L660273';*/

/*select t.ID, t.ticketDesc, t.ticketDate, s.ID, s.decription, ps.p_ID, -- IQ4
       p.partName, p.amount
    from part_service ps join service s on ps.s_ID = s.ID
    join part p on ps.p_ID = p.ID
    join ticket t on s.t_ID = t.ID
    where p.ID = 390;*/

/*select count(c_ID) -- IQ5
from ticket
where ticketDate between '2015-01-06' and '2015-02-07';*/

/*select format(sum(s.laborCost + s.partCost), 2) as `total $ values of labor and parts -- IQ6
for cars serviced between '2015-01-06' and '2015-02-07'`
from ticket t join bill b on t.b_ID = b.ID
join service s on t.ID = s.t_ID
where ticketDate between '2015-01-06' and '2015-02-07';*/

/*select v.ID, v.vendorName, v.address, v.phoneNumber -- IQ7
    from part_vendor pv join vendor v on pv.v_ID = v.ID
    join part p on pv.p_ID = p.ID
    where p_ID = 1211;*/

/*select p.ID, p.partName, sum(ps.amountUsed)
    from part_service ps join part p on ps.p_ID = p.ID
    join service s on ps.s_ID = s.ID
    where p.ID = 800;*/

/*select min(total), max(total),  format(avg(total), 2)
    from bill b;*/

/*select p.ID, p.partName, p.price, p.amount, v.vendorName, v.address, v.phoneNumber
    from part_vendor pv join part p on pv.p_ID = p.ID
    join vendor v on pv.v_ID = v.ID
    where p.amount < 3;*/
