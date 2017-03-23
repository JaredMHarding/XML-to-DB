PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS BidCount;
CREATE TRIGGER BidCount
AFTER INSERT ON Bids FOR EACH ROW
WHEN (SELECT BidCount From Items WHERE New.ItemId = Items.ItemId) <>
(SELECT COUNT(*) FROM Bids WHERE New.ItemId = Bids.ItemId)
BEGIN
  UPDATE Items
  SET BidCount = BidCount + 1
  WHERE ItemId = New.ItemId;
END;
