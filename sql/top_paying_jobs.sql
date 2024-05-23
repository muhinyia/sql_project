/* TOP PAYING DATA ENGINEER JOBS 

What are the top paying Data Engineer Jobs?
 -  Identify the 10 highest-paying Data Engineer roles that are availabel remotely.

*/

-- just jobs
SELECT * FROM job_postings_fact 
WHERE job_title_short ='Data Engineer' 
AND job_work_from_home IS TRUE 
AND salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 10;


-- Which company
SELECT name, job_title job_title_short, salary_year_avg
FROM company_dim
LEFT JOIN job_postings_fact
ON company_dim.company_id = job_postings_fact.company_id
WHERE job_postings_fact.job_title_short = 'Data Engineer'
AND job_postings_fact.job_work_from_home IS TRUE
AND job_postings_fact.salary_year_avg IS NOT NULL
ORDER BY job_postings_fact.salary_year_avg DESC
LIMIT 10;


