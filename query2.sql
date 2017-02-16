-- 2. FindthenumberofusersfromNewYork(i.e.,userswhoselocationisthestring“New York”).
-- should equal 80
SELECT Count(UserId)
FROM Users
WHERE Location = "New York";
