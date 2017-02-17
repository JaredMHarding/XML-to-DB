-- 6. Find the number of users who are both sellers and bidders.
-- should be 6717


--There are some accounts that have multiple bids.
--Therefore, it is going to count some IDs more than once
--Need to fix the query for this case.
SELECT Count(SellerId)
FROM (
  SELECT SellerId, DISTINCT UserId
  FROM Items, Bids
  WHERE SellerId = UserId
);

--SELECT Count(SellerId)
--FROM Items, (
--  SELECT UserId
--  FROM Bids
--)
--WHERE SellerId = UserId;
