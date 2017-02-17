-- 7. Find the number of categories that include at
-- least one item with a bid
-- of more than $100.
-- should be 150
SELECT Count(Category)
FROM (
  SELECT DISTINCT Category
  FROM Categories, (
    SELECT ItemId
    FROM Items
    WHERE CurrentBid > 100
  ) AS I
  WHERE Categories.ItemId = I.ItemId
);
