DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
select report.supp_id, report.supp_name, report.Average,
CASE
WHEN report.Average=5 THEN 'Excellent Service' When report.Average>4 then 'Good Service'
when report.Average>2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service from
(select final.supp_id, supplier.SUPP_NAME, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.SUPP_ID, test.ORD_ID, test.rat_ratstars from supplier_pricing inner join
(select orders.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS from orders inner join rating on rating.ORD_ID=orders.ORD_ID) as test on test.PRICING_ID =supplier_pricing.PRICING_ID)
as test2 group by supplier_pricing.SUPP_ID)
as final inner join supplier where final.supp_id = supplier.SUPP_ID) as report;
END &&
DELIMITER ;
call proc();