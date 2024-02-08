CREATE OR REPLACE PACKAGE Customer_Package AS
  -- Procedure to insert a new customer
  PROCEDURE Insert_Customer
  (
    p_customer_name VARCHAR2,
    p_customer_location VARCHAR2,
    p_phno NUMBER,
    p_createdby VARCHAR2,
    P_updatedby VARCHAR2
  );
  -- Procedure to update an existing customer
  PROCEDURE Update_Customer
  (
    p_customer_id NUMBER,
    p_customer_name VARCHAR2,
    p_customer_location VARCHAR2,
    p_phno NUMBER,
    p_updatedby VARCHAR2
  );
END Customer_Package;
/
CREATE OR REPLACE PACKAGE Customer_Package AS
  -- Procedure to insert a new customer
  PROCEDURE Insert_Customer
  (
    p_customer_name VARCHAR2,
    p_customer_location VARCHAR2,
    p_phno NUMBER,
    p_createdby VARCHAR2,
    p_updatedby VARCHAR2  -- Added missing parameter
  );

  -- Procedure to update an existing customer
  PROCEDURE Update_Customer
  (
    p_customer_id NUMBER,
    p_customer_name VARCHAR2,
    p_customer_location VARCHAR2,
    p_phno NUMBER,
    p_updatedby VARCHAR2
  );
END Customer_Package;
/


CREATE OR REPLACE PACKAGE BODY Customer_Package AS
  -- Procedure to insert a new customer
  PROCEDURE Insert_Customer
  (
    p_customer_name VARCHAR2,
    p_customer_location VARCHAR2,
    p_phno NUMBER,
    p_createdby VARCHAR2,
    p_updatedby VARCHAR2  
  ) IS
    v_customer_id NUMBER;
  BEGIN
    SELECT customer_id.NEXTVAL INTO v_customer_id FROM dual;
    -- Insert the new customer record
    INSERT INTO CUSTOMER (customer_id, customer_name, customer_location, phno, createdby, updatedby)
    VALUES (v_customer_id, p_customer_name, p_customer_location, p_phno, p_createdby, p_updatedby);
  END Insert_Customer;
  -- Procedure to update an existing customer
  PROCEDURE Update_Customer
  (
    p_customer_id NUMBER,
    p_customer_name VARCHAR2,
    p_customer_location VARCHAR2,
    p_phno NUMBER,
    p_updatedby VARCHAR2
  ) 
  IS
  BEGIN
    -- Update the customer record
    UPDATE CUSTOMER
    SET customer_name = p_customer_name
    WHERE customer_id = p_customer_id;
  END Update_Customer;
END Customer_Package;
/
EXECUTE Customer_Package.insert_Customer('Sairam','Kurnool',8865424465,'Satish','Satish'); 

SELECT * FROM Customer;
