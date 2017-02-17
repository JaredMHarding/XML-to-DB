-- checks for duplicates

SELECT
    UserId, COUNT(*)
FROM
    Users
GROUP BY
    UserId
HAVING
    COUNT(*) > 1;
