--Total number of students
SELECT COUNT(gender) AS 
total_number_of_students
  FROM [Study performance].[dbo].[study_performance]

--Count of race ethnicity according to group
-- Count of group A
 select COUNT(*) AS 
 Group_A
  FROM [Study performance].[dbo].[study_performance]
  WHERE race_ethnicity = 'group A'

-- Count of group B
   select COUNT(*) AS 
 Group_B
  FROM [Study performance].[dbo].[study_performance]
  WHERE race_ethnicity = 'group B'

--Count of Group C
   select COUNT(*) AS 
 Group_C
  FROM [Study performance].[dbo].[study_performance]
  WHERE race_ethnicity = 'group C'

--Count of Group D
   select COUNT(*) AS 
 Group_D
  FROM [Study performance].[dbo].[study_performance]
  WHERE race_ethnicity = 'group D'

--Count of group E
   select COUNT(*) AS 
 Group_E
  FROM [Study performance].[dbo].[study_performance]
  WHERE race_ethnicity = 'group E'

--Number of people who completed their tests preparation course
 select COUNT(*) AS 
 Completed_Tests
  FROM [Study performance].[dbo].[study_performance]
  WHERE test_preparation_course = 'completed'

--Number of people who did not complete their test preparation course
select COUNT(*) AS 
 Not_Completed_Tests
  FROM [Study performance].[dbo].[study_performance]
  WHERE test_preparation_course = 'none'

-- Associate's degree
select COUNT(*) AS 
 Number_of_parents_with_associate_degree
  FROM [Study performance].[dbo].[study_performance]
  WHERE parental_level_of_education = 'associate''s degree'

--Bachelor's degree
  select COUNT(*) AS 
 Number_of_parents_with_bachelor_degree
  FROM [Study performance].[dbo].[study_performance]
  WHERE parental_level_of_education = 'bachelor''s degree'

-- Masters degree
  select COUNT(*) AS 
 Number_of_parents_with_master_degree
  FROM [Study performance].[dbo].[study_performance]
  WHERE parental_level_of_education = 'master''s degree'

-- High school degree
  select COUNT(*) AS 
 Number_of_parents_with_high_school_degree
  FROM [Study performance].[dbo].[study_performance]
  WHERE parental_level_of_education = 'high school'

--Some college degree
  select COUNT(*) AS 
 Number_of_parents_with_some_college_degree
  FROM [Study performance].[dbo].[study_performance]
  WHERE parental_level_of_education = 'some college'

--Some high school degree
  select COUNT(*) AS 
 Number_of_parents_with_some_high_school_degree
  FROM [Study performance].[dbo].[study_performance]
  WHERE parental_level_of_education = 'some high school'

--Parent level of Education versus Total score
  select parental_level_of_education, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY parental_level_of_education
--It was discovered that academic level of parents has an inverse level on students' performance 
--which can be caused by parental absence, social pressure or even disabilities.

 select race_ethnicity, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY race_ethnicity
--Race_ethnicity group C had better performance than other race_ethnicity groups.

  select gender, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY gender
--female gender are better readers and writers compared to their male counterparts who are better at mathematics

--Percentage scores according to gender
select gender, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score,
 (SUM(math_score) + SUM(reading_score) + SUM(writing_score)) AS Total_Scores,
 SUM(math_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_maths_score,
 SUM(reading_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_reading_score,
 SUM(writing_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_writing_score
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY gender

--percentage scores according to ethnicity
select race_ethnicity, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score,
 (SUM(math_score) + SUM(reading_score) + SUM(writing_score)) AS Total_Scores,
 SUM(math_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_maths_score,
 SUM(reading_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_reading_score,
 SUM(writing_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_writing_score
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY race_ethnicity

  --Test preparation course versus Total score
select test_preparation_course, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score,
 (SUM(math_score) + SUM(reading_score) + SUM(writing_score)) AS Total_Scores,
 SUM(math_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_maths_score,
 SUM(reading_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_reading_score,
 SUM(writing_score) * 100 /(SUM(math_score) + SUM(reading_score) + SUM(writing_score))
 AS percentage_writing_score
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY test_preparation_course

  -- Lunch versus Total scores
select lunch, SUM(math_score)
  AS Total_Math_Score, 
 SUM(reading_score) AS Total_Reading_Score, 
SUM(writing_score) AS Total_writing_score,
 (SUM(math_score) + SUM(reading_score) + SUM(writing_score)) AS Total_Scores
  FROM [Study performance].[dbo].[study_performance]
  GROUP BY lunch
--Students who ate standard lunch before test did better than students with free/reduced lunch
 