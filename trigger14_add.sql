PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS BidAmountCheck;
CREATE TRIGGER BidAmountCheck
AFTER INSERT ON Bids FOR EACH ROW
WHEN New.Amount <= (SELECT MAX(Amount) FROM Bids WHERE New.ItemId = Bids.ItemId)
BEGIN
  SELECT RAISE (ROLLBACK, 'You have to bid a higher amount than the current bid');
END;
