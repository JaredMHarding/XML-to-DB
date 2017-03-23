-- description:
--The current price of an item must always match the amount of the most recent bid for that item.
PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS CurrentBidCheckGT;
CREATE TRIGGER CurrentBidCheckGT
AFTER INSERT ON Bids FOR EACH ROW
WHEN New.Amount > (SELECT CurrentBid FROM Items WHERE New.ItemId = Items.ItemId)
BEGIN
  UPDATE Items
  SET CurrentBid = New.Amount
  WHERE ItemId = New.ItemId;
END;
