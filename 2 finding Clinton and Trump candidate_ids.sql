-- Add this to the Azure Machine Learning
-- SQL transformation module
select * from t1
where (candidate_name like 'CLINTON, HILLARY RODHAM'
or candidate_name like 'TRUMP, DONALD J.')
and office like 'P'
and election_year like '2016';