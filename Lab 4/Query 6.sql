use e_commerce;
select * from
(select category.*, t2.pro_name, t2.min_price from category inner join
(select product.*, t1.min_price from product inner join
(select pro_id, min(supp_price) as min_price from supplier_pricing group by PRO_ID) as t1
on product.PRO_ID = t1.PRO_ID) as t2
on category.CAT_ID = t2.CAT_ID) as t3
group by t3.cat_id;