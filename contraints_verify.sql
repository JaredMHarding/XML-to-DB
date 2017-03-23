--2) Sellers and bidders must be Users
SELECT UserId, SellerId
FROM Bids, Items
WHERE (UserId NOT IN (SELECT UserId FROM Users)) AND (SellerId NOT IN (SELECT UserId FROM Users));

--3) Items cannot have the same ID
SELECT ItemId, COUNT(*) IDCount
FROM Items
GROUP BY ItemId
HAVING IDCount > 1;

--4) Every bid must correspond to an item
SELECT ItemId
FROM Bids
WHERE ItemId NOT IN (SELECT ItemId FROM Items);

--5) Items for a Category must exists
SELECT ItemId
FROM Categories
WHERE ItemId NOT IN (SELECT ItemId FROM Items);
