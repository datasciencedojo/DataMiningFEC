-- Add this to the Azure Machine Learning
-- SQL transformation module
select 
    Committee_Identification as committee_id,
    Committee_Name as candidate_name
from t1
where
    Committee_Name like '%victory%' COLLATE NOCASE
and
    (
        Committee_Name like '%trump%' COLLATE NOCASE OR
        Committee_Name like '%hillary%' COLLATE NOCASE
    )
;