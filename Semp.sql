---- Table: SALES_EMPS
-- Purpose:

--
CREATE TABLE sales_emps
(
  semp_id NUMBER PRIMARY KEY,
  semp_name VARCHAR2(50),
  salary NUMBER,
  phno NUMBER,
  created_by VARCHAR2(20),
  created_date DATE DEFAULT SYSDATE ,
  updated_by VARCHAR2(20),
  updated_date DATE DEFAULT SYSDATE
);
  
CREATE INDEX Phno_Idx ON sales_emps(phno);

CREATE SEQUENCE semp_id_seq start with 1
increment by 1;

SELECT * FROM sales_emps

