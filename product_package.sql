CREATE OR REPLACE PACKAGE product_package AS
  PROCEDURE insert_product
  (
    p_p_name VARCHAR2,
    p_p_cost NUMBER,
    p_p_stock NUMBER,
    p_p_createdby VARCHAR2,
    p_p_updatedby VARCHAR2
  );

  PROCEDURE update_product(
    p_p_id NUMBER,
    p_p_name VARCHAR2,
    p_p_cost NUMBER,
    p_p_stock NUMBER,
    p_updatedby VARCHAR2
  );
END product_package;
/

CREATE OR REPLACE PACKAGE BODY product_package AS
  PROCEDURE insert_product(
    p_p_name VARCHAR2,
    p_p_cost NUMBER,
    p_p_stock NUMBER,
    p_p_createdby VARCHAR2,
    p_p_updatedby VARCHAR2
  ) 
  IS
  BEGIN
    -- Validate input parameters
    IF p_p_name IS NULL THEN
      RAISE_APPLICATION_ERROR(-20001, 'Product name must be provided.');
    END IF;

    -- Insert into the product table
    INSERT INTO product(p_id, P_name, P_cost, p_stock, createdby, updatedby)
    VALUES(p_id.NEXTVAL, p_p_name, p_p_cost, p_p_stock, p_p_createdby, p_p_updatedby);
  END insert_product;

  PROCEDURE update_product(
    p_p_id NUMBER,
    p_p_name VARCHAR2,
    p_p_cost NUMBER,
    p_p_stock NUMBER,
    p_updatedby VARCHAR2
  ) IS
  BEGIN
    -- Update the product table
    UPDATE product SET P_name = p_p_name
    WHERE p_id = p_p_id;
  END update_product;
END product_package;
/
            
EXECUTE product_package.insert_product('Carnival',450000,25,'Satish','Satish');


