-- 6. Find the number of users who are both sellers and bidders.
-- should be 6717

SELECT Count(SellerId)
FROM (
  SELECT SellerId, UserId
  FROM Items, Bids
  WHERE SellerId = UserId
);


--SELECT Count(SellerId)
--FROM Items, (
--  SELECT UserId
--  FROM Bids
--)
--WHERE SellerId = UserId;
