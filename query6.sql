SELECT Count(SellerId)
FROM Items, (
     SELECT DISTINCT UserId
     FROM Bids
) as b
WHERE SellerId = UserId.b;
