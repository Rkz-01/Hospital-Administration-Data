select * from HAD

-- 1.Q What is the distribution of readmission rates across different age groups?
SELECT age, SUM(CAST(readmitted AS INT)) AS total_readmitted
FROM HAD
GROUP BY age
ORDER BY age;



-- Q.2 Analyse the average length of hospital stays by medical specialty.
-- Which specialties have the longest and shortest average stays?
SELECT medical_specialty, ROUND(AVG(time_in_hospital),0) as Avg_stay
from HAD
group by medical_specialty
order by Avg_stay desc;



-- Q.3 How does the number of emergency visits in the pervious year correlate with readmission rates?
select number_emergency,
sum(case when readmitted = 0 then 1 else 0 end)as not_readmitted,
sum(case when readmitted = 1 then 1 else 0 end)as readmitted
from HAD
group by number_emergency
order by number_emergency;



-- Q.4 What proportion of patients with diabetes were readmitted within 30 days?
select diabetesMed, sum(cast(readmitted as int)) as total_readmission
from HAD
group by diabetesMed
order by total_readmission;



-- Q.5 Is there a significant difference in readmission rates between patients
-- with changes in diabetic medication and those without?
select change, count(cast(readmitted as int)) as total_count
from HAD
group by change
order by total_count;



-- Q.6 Investigate the relationship between the number of lab procedures performed
-- during the stay and readmission rates.
select num_lab_pro_grp, count(cast(readmitted as int)) as total_count
from HAD
group by num_lab_pro_grp
order by total_count;



-- Q.7 How do readmission rates vary by race and gender?
select race,
sum(case when gender = 'Male' then 1 else 0 end) as Male,
sum(case when gender = 'Female' then 1 else 0 end) as Female
from HAD
group by race
order by race;



-- Q.8 What is the distribution of patients across different weight categories,
-- and how does this relate to readmission rates?
select weight, count(cast(readmitted as int)) as total_count
from HAD
group by weight
order by total_count;



-- Q.9 Assess the frequency and impact of outpatient visits in the year prior to the
-- current hospital stay on readmission rates.
select number_outpatient, count(cast(readmitted as int)) as total_count
from HAD
group by number_outpatient
order by total_count desc;