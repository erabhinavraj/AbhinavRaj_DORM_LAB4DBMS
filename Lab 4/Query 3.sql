use e_commerce;
select t2.cus_gender, count(cus_id) from (select t1.cus_id, t1.cus_gender, t1.ord_amount from (
select cus_name, customer.cus_gender, orders.* from customer inner join orders on customer.cus_id = orders.cus_id where ord_amount >= 3000) as t1
group by t1.cus_id) as t2
group by t2.cus_gender;