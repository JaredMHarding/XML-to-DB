PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS BidTimeCheck;
CREATE TRIGGER BidTimeCheck
AFTER INSERT ON Bids FOR EACH ROW
--WHEN (New.BidTime < (SELECT BidStartTime FROM Items WHERE New.ItemId = Items.ItemId))
--OR (New.BidTime > (SELECT EndTime FROM Items WHERE New.ItemId = Items.ItemId))
WHEN New.BidTime NOT BETWEEN (SELECT BidStartTime FROM Items WHERE New.ItemID = Items.ItemID)
AND (SELECT EndTime FROM Items WHERE New.ItemId = Items.ItemId)
BEGIN
  SELECT RAISE (ROLLBACK, 'BidTime cannot be before or after BidStartTime!');
END;
