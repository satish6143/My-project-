
CREATE TABLE CUSTOMER
(
customer_id NUMBER PRIMARY KEY,
customer_name VARCHAR2(25),
customer_location VARCHAR2(20),
phno NUMBER,
createdby VARCHAR2(25),
created_date DATE DEFAULT SYSDATE,
updatedby VARCHAR2(25),
updated_date DATE DEFAULT SYSDATE
);
CREATE SEQUENCE customer_id start with 5 increment by 5;

SELECT * FROM customer;