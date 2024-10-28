-- Процедура видаляє з таблиці людей які не зазначили чи має музика для них якийсь ефект

DROP PROCEDURE IF EXISTS delete_null_effects();

CREATE OR REPLACE PROCEDURE delete_null_effects()
LANGUAGE plpgsql
AS $$
BEGIN 
	DELETE FROM person WHERE music_id IN (SELECT music_id FROM music WHERE effects IS NULL);
	DELETE FROM music WHERE effects IS NULL;
END;
$$;

CALL delete_null_effects();