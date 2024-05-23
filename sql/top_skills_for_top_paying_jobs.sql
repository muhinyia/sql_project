/*
What are the top skills for the top-paying Data Engineer remote roles and what are the companies? 
*/

SELECT * FROM skills_dim LIMIT 5;

SELECT * FROM company_dim LIMIT 5;

SELECT * FROm job_postings_fact LIMIT 5;

SELECT * FROM skills_job_dim WHERE job_id=157003;

---
WITH top_engineers AS (

    SELECT job_postings_fact.job_id, 
    job_postings_fact.job_country, 
    job_postings_fact.salary_year_avg,
    company_dim.name AS company_name
    FROM company_dim
    LEFT JOIN job_postings_fact 
    ON company_dim.company_id = job_postings_fact.company_id
    WHERE job_title_short = 'Data Analyst' 
    AND job_work_from_home IS TRUE
    AND salary_year_avg IS NOT NULL
),
all_jobs AS(

SELECT * 
FROM skills_job_dim
INNER JOIN top_engineers
ON top_engineers.job_id = skills_job_dim.job_id
)
SELECT all_jobs.job_country,all_jobs.company_name, skills_dim.skills, all_jobs.salary_year_avg
FROM skills_dim
INNER JOIN all_jobs 
ON all_jobs.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg 
DESC LIMIT 10;
