-- 2. Find the number of users from NewYork 
-- (i.e.,users whose location is the string “New York”).
-- should equal 80
SELECT Count(Location)
FROM Users
WHERE Location = "New York";
