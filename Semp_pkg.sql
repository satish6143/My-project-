CREATE OR REPLACE PACKAGE sales_pkg 
AS
  PROCEDURE insert_sales_emp
  (
    p_name IN VARCHAR2,
    p_salary IN NUMBER,
    p_phno IN NUMBER
  ); 
  PROCEDURE update_sales_emp
  (
    p_semp_id IN NUMBER,
    p_salary IN NUMBER,
    p_phno IN NUMBER
  ); 
END sales_pkg;
/

CREATE OR REPLACE PACKAGE BODY sales_pkg AS
  PROCEDURE insert_sales_emp
  (
    p_name IN VARCHAR2,
    p_salary IN NUMBER,
    p_phno IN NUMBER
  )
  IS
  BEGIN
    INSERT INTO sales_emps(semp_id, semp_name, salary, phno)
    VALUES 
    (semp_id_seq.nextval, p_name, p_salary, p_phno);
    DBMS_OUTPUT.PUT_LINE('Sales Employee details inserted successfully: ' || p_name);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
  END insert_sales_emp;

  PROCEDURE update_sales_emp
  (
    p_semp_id IN NUMBER,
    p_salary IN NUMBER,
    p_phno IN NUMBER
  ) 
  AS
  BEGIN
    UPDATE sales_emps
    SET salary = p_salary
    WHERE semp_id = p_semp_id;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully for employee ' || p_semp_id);
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
  END update_sales_emp;
END sales_pkg;
/

BEGIN
    sales_pkg. insert_sales_emp('Satish',40000,8969424465);
END;
/

BEGIN
 sales_pkg.update_salary(123, 50000); 
END;
/