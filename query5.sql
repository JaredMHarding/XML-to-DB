-- 5. Find the number of sellers whose rating is higher than 1000.
-- should be 3130
--SELECT Count(UserId)
--FROM Users
--WHERE Rating > 1000;
select count(UserId)
from Users
where rating > 1000 and UserId in (
  select SellerId
  from Items
);
