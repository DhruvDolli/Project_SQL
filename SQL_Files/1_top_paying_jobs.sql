WITH top_paying_job AS 
(
    SELECT
        job_id,
        job_title,
        job_location,
        job_posted_date,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_location = 'India' AND
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
)
SELECT *
FROM
    top_paying_job