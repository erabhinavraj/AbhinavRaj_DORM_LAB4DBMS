use e_commerce;
CREATE TABLE if not exists supplier (
	SUPP_ID int,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL,
    primary key (SUPP_ID)
);
CREATE TABLE if not exists customer (
	CUS_ID int,
    CUS_NAME varchar(20) NOT NULL,
    CUS_PHONE varchar(10) NOT NULL,
    CUS_CITY varchar(30) NOT NULL,
    CUS_GENDER char(1),
    primary key (CUS_ID)
);
CREATE TABLE if not exists category (
	CAT_ID int,
    CAT_NAME varchar(20) NOT NULL,
    primary key (CAT_ID)
);
CREATE TABLE if not exists product (
	PRO_ID int,
    PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy",
    PRO_DESC varchar(60),
    CAT_ID int,
    primary key (PRO_ID),
    foreign key (CAT_ID) REFERENCES category(CAT_ID)
);
CREATE TABLE if not exists supplier_pricing (
	PRICING_ID int,
    PRO_ID int,
    SUPP_ID int,
    SUPP_PRICE int DEFAULT 0,
    primary key (PRICING_ID),
    foreign key (PRO_ID) REFERENCES product(PRO_ID),
    foreign key (SUPP_ID) REFERENCES supplier(SUPP_ID)
);
CREATE TABLE if not exists orders (
	ORD_ID int,
    ORD_AMOUNT int not null,
    ORD_DATE date not null,
    CUS_ID int,
    PRICING_ID int,
    primary key (ORD_ID),
    foreign key (CUS_ID) REFERENCES customer(CUS_ID),
    foreign key (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);
CREATE TABLE if not exists rating (
	RAT_ID int,
    ORD_ID int,
    RAT_RATSTARS int not null,
    primary key (RAT_ID),
    foreign key (ORD_ID) REFERENCES orders(ORD_ID)
);