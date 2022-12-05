use e_commerce;
select product.PRO_NAME, orders.* from orders, supplier_pricing, product
where orders.CUS_ID=2 and
orders.PRICING_ID=supplier_pricing.PRICING_ID and supplier_pricing.PRO_ID=product.PRO_ID;