/* SQL BASICS */

-- 1 & 2 view the table (SELECT, FROM)
-- SELECT: Choose columns
-- FROM: Choose tables

SELECT * 
FROM student_grades_db.students;

-- 3. Show students who get school lunch (WHERE)
-- WHERE: Filter Rows

SELECT student_name, gpa, school_lunch
FROM student_grades_db.students
WHERE school_lunch = 'Yes' AND gpa > 3.3;

-- 4. sort the students by gpa (ORDER BY)
-- ORDER BY: Sort Rows

SELECT student_name, gpa, school_lunch
FROM student_grades_db.students
WHERE school_lunch = 'Yes' AND gpa > 3.3
ORDER BY gpa DESC;

-- 5. Show the average gpa for each grade level (GROUP BY)
-- GROUP BY: Group Rows. You will need an aggregate function!

SELECT grade_level, AVG(gpa)
FROM student_grades_db.students
GROUP BY grade_level 
ORDER BY grade_level;

-- 6. Show the grade levels with an average gpa below 3.3 (HAVING) 
-- HAVING: Filter Grouped Rows. You will need a GROUP BY statement.

SELECT grade_level, AVG(gpa) as avg_gpa
FROM student_grades_db.students
GROUP BY grade_level 
HAVING avg_gpa < 3.3
ORDER BY grade_level
;

/* 		SELECT
		FROM
		WHERE
        GROUP BY
        HAVING
        ORDER BY		*/

---------------------------------------------------------

/* SQL SPECIAL CONCEPTS */

-- LIMIT: Limit the amount of rows returned

SELECT * 
FROM student_grades_db.students
LIMIT 5;

-- COUNT: Count the rows returned

SELECT COUNT(*) 
FROM student_grades_db.students
WHERE school_lunch = 'Yes' AND gpa > 3.3;

-- DISTINCT: Return unique values

SELECT DISTINCT gpa
FROM student_grades_db.students
ORDER BY gpa DESC;

-- 7. Show the final grades for each student (LEFT JOIN)
-- LEFT JOIN: Returns all records from the left table (Table1) and the matching records from the right table (Table2).

SELECT students.id, students.student_name,
		student_grades.class_name, student_grades.final_grade
FROM student_grades_db.students
LEFT JOIN student_grades_db.student_grades
	ON student_grades_db.students.id = student_grades_db.student_grades.student_id ;
    
    
