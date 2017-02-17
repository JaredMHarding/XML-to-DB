select count(distinct UserId)
from Bids B, Items I
where B.UserId = I.SellerId;
