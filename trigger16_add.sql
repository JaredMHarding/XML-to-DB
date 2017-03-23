PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS TimeCheck;
CREATE TRIGGER TimeCheck
AFTER UPDATE ON CurrentTime FOR EACH ROW
WHEN New.Now < (SELECT Now FROM CurrentTime)
BEGIN
  SELECT RAISE (ROLLBACK, 'You cannot travel back in time!');
END;
