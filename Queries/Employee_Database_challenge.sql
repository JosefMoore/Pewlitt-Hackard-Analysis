SELECT emp.emp_no, emp.first_name, emp.last_name, t.title, 
		t.from_date, t.to_date
INTO Retirement_Title
FROM Employees AS emp
JOIN titles AS t
ON emp.emp_no = t.emp_no
WHERE emp.birth_date BETWEEN ('1952-01-01') AND ('1955-12-31')
ORDER BY emp_no

SELECT * FROM retirement_title LIMIT 100
DROP TABLE retirement_title

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_title 
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles LIMIT 10
DROP TABLE unique_titles

--Counting the number of employees per title that will be retiring
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC

--Finding employees who will be eligible for the mentorship program
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM Employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE de.to_date = ('9999-01-01')
AND e.birth_date BETWEEN ('1965-01-01') AND ('1965-12-31')
ORDER BY e.emp_no