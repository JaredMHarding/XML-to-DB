PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS BidCurrentTimeCheck;
CREATE TRIGGER BidCurrentTimeCheck
AFTER INSERT ON Bids FOR EACH ROW
WHEN New.BidTime <> (SELECT Now FROM CurrentTime)
BEGIN
  SELECT RAISE (ROLLBACK, 'You cannot bid in the future or the past!');
END;
