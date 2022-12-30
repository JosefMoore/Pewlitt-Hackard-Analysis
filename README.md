# Pewlitt-Hackard-Analysis

## Overview of Analysis
__________________________________
The purpose of this analysis was to help Bobby and our company prepare for the upcoming "silver tsunami". We needed to find out how many employees would be retiring, their positions, and if they would be eligible for a mentorship program.

## Results
__________________________________

* The first thing we started with was finding the name and title of employees born between 1952 and 1955. We created a query that would take info from the Employees table and the Titles table, joining on the Employees table. We took the information from that join and created a new table called Retirement Titles. This table was used to filter our database and would be used for furture queries.

* We then had to consider that employees may have been promoted over their time working at the company, so they may have multiple entries in our database. We then set out to create a Unique Titles table. We retrieved the employee name, birth date, and title from our previously created Retiremnt Titles table. We used the DISTINCT ON keyword to make sure we only retrieved the first occurence of the employee number for each set of rows. The query, of course, excluded employees who have left the company. Lastly, we sorted our table in ascending order by employee number and descending order by the last date of the most recent title.

* To then check our progress, we needed to create a table that counted the amount of employees, per title, that would be retiring. This will give our HR department more insight into what roles will have the largest hiring need. To do this, we retrieved the count of titles in the Unique Titles table, grouped the table by the titles, sorted the count column in descending order, and put all this information in a new table called Retiring Titles.

* With everything mostly finished, we now just needed to find who would be eligible for our mentorship program. To do this, we needed to join the from and to date from the Department Employees table and the title from the titles table onto the employees table. The new table would be called Mentorship Eligibility. We used DISTINCT ON onto the emp_no column in the employees table to get the first row in our query. Most importantly, we then filtered our data by two means. We filtered the to_date column to insure we only retrieved current employees. Then we filtered the birth date in the Employees table to only include employees born during 1965. Finally, we ordered out table by employee numbers for clarity. 

## Conclusion
_________________________________
#### "How many roles will need to be filled as the silver tsunami begins to make an impact?"
A total of 72,458 positions will need to be filled, which we found out when creating our Retiring Titles table. While creating this table we learned that our Senior Engineer and Senior Staff positions account for around 66% of the positions that need to be filled. The non-senior versions of those two positions were the next in line for positional need. With both the senior and non-senior Engineer and Staff positions combined, they accounted for massive 94% of employees that will be retiring.

#### "Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?"
In total, there are 1,549 employees eligible for the mentorship program. Of those the Senior Engineer, which was the largest category of need, only had 169 eligible for the program. The total amount of Senior Engineers retiring was 25,916. The Senior Staff, the second highest position of need, had 569 employees eligible for the program. The total amount of Senior Staff retiring was 24,926. For the Senior Engineer mentors, they would have to mentor around 153 employees each. For the Senior Staff mentors, they would have to mentor around 44 employees each. The Senior Staff position is managable but the Senior Engineer mentors might have their work cut out for them. 

This data may, however, be misleading. We only considered employees born in 1965 eligible for our mentorship program. Adding potentially one or two more years might add hundreds more capable mentors, illeviating some of the pressure. All we would need to do is modify our query for the mentorship eligibility table to include other years. 

One thing we may also want to consider is the salary of employees eligible for our mentorship program. If cost is a concern we could always join the Salary table onto our mentorship eligibility table by employee number and then include the salaries of said employees. A simple join on statement would suffice. 