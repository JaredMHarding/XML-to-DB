--) as b
6	--WHERE SellerId = UserId.b;
6	--WHERE SellerId = UserId.b;
7	select count(distinct UserId)
7	select count(distinct UserId)
8	from Bids
8	from Bids B, Items I
9	where UserId in (
9	where B.UserId = I.SellerId;
