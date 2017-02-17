<<<<<<< HEAD
--) as b
6	--WHERE SellerId = UserId.b;
6	--WHERE SellerId = UserId.b;
7	select count(distinct UserId)
7	select count(distinct UserId)
8	from Bids
8	from Bids B, Items I
9	where UserId in (
9	where B.UserId = I.SellerId;
=======
--SELECT Count(SellerId)
--FROM Items, (
--     SELECT DISTINCT UserId
--     FROM Bids
--) as b
--WHERE SellerId = UserId.b;
select count(distinct UserId)
from Bids B, Items I
where B.UserId = I.SellerId;
>>>>>>> e319f8027760fa91033232d0404e4fd41d06ecec
