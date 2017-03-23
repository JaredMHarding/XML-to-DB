PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS SameBidCheck;
CREATE TRIGGER SameBidCheck
AFTER INSERT ON Bids FOR EACH ROW
WHEN New.Amount <= (SELECT CurrentBid FROM Items WHERE New.ItemId = Items.ItemId)
BEGIN
  SELECT RAISE(ROLLBACK, 'You cannot place the same bid more than once');
END;
