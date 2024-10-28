--Тестування функції
SELECT * FROM get_people_above_5_average();

--Тестування процедури
CALL delete_null_effects();

--Тестування тригер функції
UPDATE music SET fav_genre = 'R&B' WHERE music_id = '6';

select * from logs;