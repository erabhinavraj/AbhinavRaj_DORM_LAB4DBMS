use e_commerce;
select product.PRO_ID, product.PRO_NAME from orders
inner join supplier_pricing
on supplier_pricing.PRICING_ID=orders.PRICING_ID
inner join product on product.PRO_ID=supplier_pricing.PRO_ID
where orders.ORD_DATE>"2021-10-05";