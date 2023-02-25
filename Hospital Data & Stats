/* Data is pulled from a hospital database with the following tables: patients, admissions, doctors, and province names. */

/* Select first name, last name, and gender for all male patients. */
SELECT first_name, last_name, gender
	FROM patients
    WHERE gender = "M";
    
/* Show first name and last name of patients who does not have allergies. */
SELECT first_name, last_name
	FROM patients 
    WHERE allergies IS NULL;

/* Show first name of patients that start with the letter 'C' */
SELECT first_name
	FROM patients
    WHERE first_name LIKE 'C%';
    
/* Show first name and last name of patients that weight within the range of 100 to 120. */
SELECT first_name, last_name
	FROM patients
    WHERE weight >= 100
    AND weight <= 120;
    
/* Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA' */
UPDATE patients
	SET allergies = "NKA"
    WHERE allergies IS NULL;
    
/* Show first name and last name concatinated into one column to show their full name. */
SELECT CONCAT(first_name, ' ', last_name) AS full_name
	FROM patients;
    
/* Show first name, last name, and the full province name of each patient. */
SELECT patients.first_name, patients.last_name, province_names.province_name
	FROM patients
    LEFT JOIN province_names
    ON patients.province_id = province_names.province_id;
    
/* Show how many patients have a birth_date with 2010 as the birth year. */
SELECT COUNT(patient_id)
	FROM patients
    WHERE YEAR(birth_date) = 2010;

/* Show the first_name, last_name, and height of the patient with the greatest height. */
SELECT first_name, last_name, MAX(height)
	FROM patients
    ORDER BY height;
    
/* Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000 */
SELECT *
	FROM patients
    WHERE patient_id = 1
	OR patient_id = 45
    OR patient_id = 534
    OR patient_id = 879
    OR patient_id = 1000;
    
/* Show the total number of admissions */
SELECT COUNT(patient_id) 
	FROM admissions;

/* Show all the columns from admissions where the patient was admitted and discharged on the same day. */
SELECT *
	FROM admissions
    WHERE admission_date = discharge_date;

/* Show the patient id and the total number of admissions for patient_id 579. */
SELECT patient_id, COUNT(patient_id) AS admissions
	FROM admissions
    WHERE patient_id = 579;
    
/* Based on the cities that our patients live in, show unique cities that are in province_id 'NS'? */
SELECT DISTINCT city AS unique_cities
	FROM patients
    WHERE province_id = "NS";
    
/* Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70 */
SELECT first_name, last_name, birth_date
	FROM patients
    WHERE height > 160
    AND weight > 70;

/* Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null. */
SELECT first_name, last_name, allergies
	FROM patients
    WHERE city = "Hamilton"
    AND allergies IS NOT NULL;

/* Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city. */
SELECT DISTINCT city 
	FROM patients
    WHERE city LIKE 'A%'
    OR city LIKE 'E%'
    OR city LIKE 'I%'
    OR city LIKE 'O%'
    OR city LIKE 'U%'
    ORDER BY city ASC;
    
/* Show unique birth years from patients and order them by ascending. */
SELECT DISTINCT YEAR(birth_date)
	FROM patients
    ORDER BY YEAR(birth_date) ASC;
    
/* Show unique first names from the patients table which only occurs once in the list. */
SELECT DISTINCT first_name
	FROM patients
    GROUP BY first_name
    HAVING COUNT(first_name) = 1;

/* Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long. */
select patient_id, first_name
	from patients
    where first_name like 'S%'
    AND first_name LIKE '%S'
    AND LENGTH(first_name) >= 6; 

/* Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. */
SELECT p.patient_id, p.first_name, p.last_name
	FROM patients p
    LEFT JOIN admissions a
    ON a.patient_id = p.patient_id
    WHERE a.diagnosis = "Dementia";

/* Display every patient's first_name. Order the list by the length of each name and then by alphbetically */
SELECT first_name
	FROM patients
    ORDER BY LENGTH(first_name), first_name;

/* Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row. */
SELECT
	(SELECT COUNT(*)
	FROM patients
    WHERE gender = "M") AS male_count,
    (SELECT COUNT(*) 
	FROM patients
    WHERE gender = "F") AS female_count;

/* Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name. */
SELECT first_name, last_name, allergies
	FROM patients
    WHERE allergies = "Penicillin"
    OR allergies = "Morphine" 
    ORDER BY allergies, first_name, last_name;

/* Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis. */
SELECT patient_id, diagnosis
	FROM admissions
    GROUP BY patient_id, diagnosis
    HAVING COUNT(*) > 1;

/* Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending. */
SELECT city, COUNT(patient_id) AS total_patients
	FROM patients
    GROUP BY city
    order by total_patients DESC, city ASC; 

/* Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor" */
SELECT first_name, last_name, "Patient" AS role
	FROM patients
    UNION ALL 
SELECT first_name, last_name, "Doctor" AS role
	FROM doctors; 

/* Show all allergies ordered by popularity. Remove NULL values from query. */
SELECT allergies, COUNT(allergies) AS total_diagnosis
	FROM patients
    WHERE allergies IS NOT NULL
    GROUP BY allergies
    ORDER BY total_diagnosis DESC;

/* Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date. */
SELECT first_name, last_name, birth_date
	FROM patients
    WHERE YEAR(birth_date) LIKE '197%'
    ORDER BY birth_date ASC;

/* We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order */
SELECT concat(UPPER(last_name), ',', LOWER(first_name)) AS new_name_format
	FROM patients
    ORDER BY first_name DESC; 
 
/* Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000. */
SELECT province_id, SUM(height) AS sum_height
	FROM patients
    GROUP BY province_id
    HAVING sum_height >= 7000;

/* Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni' */
SELECT (MAX(weight) - MIN(weight)) AS weight_delta
	FROM patients
    WHERE last_name = "Maroni";

/* Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions. */
SELECT DAY(admission_date) AS day_number, COUNT(admission_date) AS number_of_admissions
	FROM admissions
    GROUP BY day_number
    ORDER BY number_of_admissions DESC;

/* Show all columns for patient_id 542's most recent admission_date. */
SELECT *
	FROM admissions
    WHERE patient_id = 542
    group by patient_id
    HAVING DATE(MAX(admission_date));

/* Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters. */
SELECT patient_id, attending_doctor_id, diagnosis
	FROM admissions
    WHERE (MOD(patient_id, 2) <> 0
    AND attending_doctor_id IN (1, 5, 19))
    OR (attending_doctor_id LIKE '%2%'
    AND LENGTH(patient_id) = 3);

/* Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight group decending. */
SELECT COUNT(patient_id) AS patients_in_group,
	FLOOR(weight / 10) * 10 AS weight_group
    FROM patients
    GROUP BY weight_group
    ORDER BY weight_group DESC;

/* Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1.
Obese is defined as weight(kg)/(height(m)2) >= 30. weight is in units kg. height is in units cm. */
SELECT patient_id, weight, height
(CASE
	WHEN weight/(POWER(height/100.0,2)) >= 30 THEN 1
    	ELSE 0
 END) AS isObese
   FROM patients;
