--SELECT Count(SellerId)
--FROM Items, (
--     SELECT DISTINCT UserId
--     FROM Bids
--) as b
--WHERE SellerId = UserId.b;
select count(distinct UserId)
from Bids B, Items I
where B.UserId = I.SellerId;
