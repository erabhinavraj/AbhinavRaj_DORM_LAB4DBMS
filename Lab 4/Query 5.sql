use e_commerce;
select supplier.* from supplier where SUPP_ID in 
(select SUPP_ID from supplier_pricing group by SUPP_ID having count(PRO_ID)>1);