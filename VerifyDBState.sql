-- Adam Huggins 01/27/2026

-- Question 1
select user_id, username, created, password_change_date
from user_users;

-- Queston 2
select *
from user_tables;

--Question 3
desc ORDERS;
desc PRODUCTLIST;
desc REVIEWS;
desc STOREFRONT;
desc USERBASE;
desc USERLIBRARY;

--Question 4
select *
from Orders;
select *
from PRODUCTLIST;
select *
from REVIEWS;
select *
from STOREFRONT;
select *
from USERBASE;
select *
from USERLIBRARY;

--Question 5
SELECT table_name,constraint_name, constraint_type, status
FROM user_constraints;

--Question 6
SELECT VIEW_NAME text
FROM USER_VIEWS;

--Question 7
SELECT username
FROM ALL_USERS
ORDER BY username;

--Question 8
select firstname, lastname, username, password, email
from userbase
where email like '%yahoo%'

--Question 9
SELECT username, birthday, walletfunds
FROM userbase
WHERE walletfunds < 25;

--Question 10
SELECT userid, productcode
FROM userlibrary
WHERE HOURSPLAYED > 100;

--Question 11
SELECT productcode
FROM userlibrary
WHERE HOURSPLAYED < 10;

--Question 12
SELECT PUBLISHER
FROM PRODUCTLIST;

--Question 13
Select PRODUCTNAME, RELEASEDATE, PUBLISHER, GENRE
FROM PRODUCTLIST
ORDER BY GENRE;

--Question 14
select PRODUCTCODE, PUBLISHER
FROM PRODUCTLIST
WHERE GENRE LIKE 'Strategy';

--Question 15
select PRODUCTCODE, DESCRIPTION, PRICE
FROM STOREFRONT
WHERE PRICE > 25
ORDER BY PRICE DESC;

--Queston 16
select INVENTORYID, PRICE
FROM STOREFRONT
ORDER BY PRICE ASC;

--Queston 17
SELECT REVIEW, RATING, PRODUCTCODE
FROM REVIEWS
WHERE RATING = 1;

--Question 18
SELECT REVIEW, RATING PRODUCTCODE
FROM REVIEWS
WHERE RATING >= 4 ;

--Question 19
SELECT USERID, ORDERID
FROM ORDERS;

--Question 20
SELECT *
FROM ORDERS
ORDER BY PURCHASEDATE ASC;