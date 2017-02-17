--SELECT Count(SellerId)
--FROM Items, (
--     SELECT DISTINCT UserId
--     FROM Bids
--) as b
--WHERE SellerId = UserId.b;
select count(distinct UserId)
from Bids
where UserId in (
  select distinct SellerId
  from Items
);
