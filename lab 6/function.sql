--Функція повертає таблицю з людьми у яких середнє значення психічних захворювань більше 5

DROP FUNCTION IF EXISTS get_people_above_5_average();

CREATE OR REPLACE FUNCTION get_people_above_5_average()
    RETURNS TABLE (
        person_id VARCHAR(40),
		age INT,
		hours_per_day FLOAT,
		AverageScore FLOAT
    )
    LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT Person.person_id, Person.age, Person.hours_per_day, Mental_Illness.AverageScore FROM Person JOIN Mental_Illness 
    ON Person.mental_illness_id = Mental_Illness.mental_illness_id
    WHERE
        Mental_Illness.AverageScore > 5;
END;
$$;

SELECT * FROM get_people_above_5_average();

