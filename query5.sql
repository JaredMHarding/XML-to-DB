-- 5. Find the number of sellers whose rating is higher than 1000.
-- should be 3130
--SELECT Count(UserId)
--FROM Users
--WHERE Rating > 1000;
select count(distinct SellerId)
from Users U, Items I
where U.UserId = I.SellerId and rating > 1000;
