--Тригер додає інформацію (юзернейм, час та дату) до таблиці logs коли у таблиці  music була зафіксована зміна
CREATE TABLE Logs
(
  log_id SERIAL PRIMARY KEY,
  person_id VARCHAR(40),
  change_date DATE,
  change_time TIME
);


CREATE OR REPLACE FUNCTION music_change_trigger()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Logs (person_id, change_date, change_time)
    VALUES (CURRENT_USER, CURRENT_DATE, CURRENT_TIME);
  RETURN NULL;
END;
$$;

CREATE TRIGGER music_change
AFTER UPDATE ON Music
FOR EACH ROW
EXECUTE FUNCTION music_change_trigger();
