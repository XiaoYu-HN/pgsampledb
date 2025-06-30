
CREATE OR REPLACE PROCEDURE secure_dml()
LANGUAGE plpgsql AS $$
BEGIN
  IF TO_CHAR(CURRENT_TIMESTAMP, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
     OR EXTRACT(DOW FROM CURRENT_TIMESTAMP) IN (0, 6) THEN
    RAISE EXCEPTION
      USING ERRCODE = 'P0001',
            MESSAGE = 'You may only make changes during normal office hours';
  END IF;
END;
$$;

CREATE OR REPLACE FUNCTION secure_employees_trigger()
RETURNS trigger AS $$
BEGIN
  PERFORM secure_dml();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER secure_employees
BEFORE INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW
EXECUTE FUNCTION secure_employees_trigger();

ALTER TABLE employees DISABLE TRIGGER secure_employees;

CREATE OR REPLACE PROCEDURE add_job_history(
    p_emp_id job_history.employee_id%TYPE,
    p_start_date job_history.start_date%TYPE,
    p_end_date job_history.end_date%TYPE,
    p_job_id job_history.job_id%TYPE,
    p_department_id job_history.department_id%TYPE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO job_history (
        employee_id, start_date, end_date, job_id, department_id
    )
    VALUES (
        p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id
    );
END;
$$;

CREATE OR REPLACE FUNCTION update_job_history_trigger()
RETURNS trigger AS $$
BEGIN
    -- Call the procedure; use PERFORM if add_job_history is a function returning void
    CALL add_job_history(
        OLD.employee_id,
        OLD.hire_date,
        CURRENT_TIMESTAMP,
        OLD.job_id,
        OLD.department_id
    );
    RETURN NULL; -- AFTER triggers should return NULL
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_job_history
AFTER UPDATE OF job_id, department_id ON employees
FOR EACH ROW
EXECUTE FUNCTION update_job_history_trigger();

