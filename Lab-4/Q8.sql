/*Exercise 8 - ‘BEFORE INSERT’ Trigger (Validation)
Write a trigger before_student_insert that fires before a row is inserted into student, and rejects the
insert (using SIGNAL SQLSTATE '45000') if marks is negative or greater than 100. This mirrors
how PL/SQL triggers validate/modify data before it's committed, as covered in your slides.
Test it by trying to insert a student with marks = 150 and confirming it's rejected, then insert a valid
row.*/
DELIMITER //
CREATE TRIGGER before_student_insert
BEFORE INSERT ON student
FOR EACH ROW
BEGIN   
    IF NEW.marks < 0 OR NEW.MARKS > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'MARKS MUST BE BETWEEN 0 AND 100';
    END IF;
END//
DELIMITER ;