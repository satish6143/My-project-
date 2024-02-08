
CREATE TABLE product
(
p_id NUMBER PRIMARY KEY,
P_name VARCHAR2(25),
P_cost NUMBER,
p_stock NUMBER,
createdby VARCHAR2(25),
created_date DATE DEFAULT SYSDATE,
updatedby VARCHAR2(25),
updated_date DATE DEFAULT SYSDATE
);

CREATE SEQUENCE p_id start with 2211 increment by 1;

SELECT * FROM product;