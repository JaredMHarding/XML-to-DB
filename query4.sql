-- 4. Find the ID(s) of auction(s) with the highest current price.
-- should be 1046871451
SELECT ItemId
FROM (
  SELECT ItemId, Max(CurrentBid)
  FROM Items
);
