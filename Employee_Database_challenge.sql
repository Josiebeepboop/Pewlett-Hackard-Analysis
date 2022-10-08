-- Create a retirement titles table which holds employees born between 1952 and 1955
SELECT e.emp_no,e.first_name,e.last_name,t.title,t.from_date,t.to_date
INTO retirement_titles
FROM Employees as e
INNER JOIN Titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Create table with only unique titles with count of employees holding that title
SELECT COUNT(titles) as 'Title Count',title
FROM unique_titles
INTO retiring_titles
GROUP BY title
ORDER BY 'Title Count' DESC;

-- Create a Mentorship Eligibility table that holds employees who are eligible for mentorship
SELECT DISTINCT ON(e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no,t.to_date DESC;