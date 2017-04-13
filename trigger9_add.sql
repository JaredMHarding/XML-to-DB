PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS BidderIdCheck;
CREATE TRIGGER BidderIdCheck
AFTER INSERT ON Bids FOR EACH ROW
WHEN New.UserId = (SELECT SellerId FROM Items WHERE New.ItemId = Items.ItemId)
BEGIN
  SELECT RAISE (ROLLBACK, 'You cannot bid on your own Item!');
END;
