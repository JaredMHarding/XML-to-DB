-- 3. Find the number of auctions belonging to exactly four categories.
-- should equal 8365
SELECT Count(ItemId)
FROM (
  SELECT ItemId, Count(ItemId) AS count
  FROM Categories
  GROUP BY ItemId
  HAVING count = 4
);
