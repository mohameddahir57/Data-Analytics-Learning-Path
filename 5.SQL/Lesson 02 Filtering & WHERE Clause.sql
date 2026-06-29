-- Lesson 02 - Filtering & WHERE Clause


USE Student02;

-- Retrieve all records from student_info table
SELECT * FROM student_info;

-- LIKE Operator - Pattern Matching

-- Filter students whose name starts with Mohamed
SELECT * FROM student_info 
WHERE STD_Name LIKE 'Mohamed%';

-- Filter students whose name contains Mohamed anywhere
SELECT * FROM student_info 
WHERE STD_Name LIKE '%Mohamed%';

-- Filter students whose name contains letter M anywhere
SELECT * FROM student_info 
WHERE STD_Name LIKE '%M%';

-- Filter students whose name starts with Abdullahi
SELECT * FROM student_info 
WHERE STD_Name LIKE 'Abdullahi%';

-- WHERE Clause - Basic Filter

-- Retrieve a specific student by ID
SELECT * FROM student_info 
WHERE STD_ID = 4;

-- WHERE with OR Condition

-- Retrieve students where ID is 4 or 3
SELECT STD_ID, STD_Name 
FROM student_info
WHERE STD_ID = 4 OR STD_ID = 3;

-- WHERE with AND Condition

-- Retrieve student where ID is 4 and Gender is Female
SELECT STD_ID, STD_Name 
FROM student_info
WHERE STD_ID = 4 AND Gender = 'Female';


-- WHERE with IN Condition

-- Retrieve students where ID is in the list
SELECT STD_ID, STD_Name 
FROM student_info
WHERE STD_ID IN (1, 2, 43, 51, 5);

-- 
-- Filter by Gender

-- Retrieve all male students only
SELECT * FROM student_info 
WHERE Gender = 'Male';

-- Retrieve all female students only
SELECT * FROM student_info 
WHERE Gender = 'Female';

-- Retrieve both male and female students using IN
SELECT * FROM student_info 
WHERE Gender IN ('Male', 'Female');

-- Definitions

-- LIKE     : Searches for a pattern in a column
-- %        : Wildcard that represents zero or more characters
-- WHERE    : Filters records based on a condition
-- OR       : Returns records if at least one condition is true
-- AND      : Returns records if both conditions are true
-- IN       : Matches any value within a specified list