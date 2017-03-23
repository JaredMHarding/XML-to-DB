drop table if exists Items;
drop table if exists Users;
drop table if exists Categories;
drop table if exists Bids;
drop table if exists CurrentTime;

CREATE TABLE Items (
  ItemId INTEGER PRIMARY KEY UNIQUE,
  Name VARCHAR,
  CurrentBid MONEY,
  BuyItNow MONEY,
  FirstBid MONEY,
  BidStartTime DATETIME,
  EndTime DATETIME CHECK (EndTime > BidStartTime),
  SellerId VARCHAR,
  Description VARCHAR,
  BidCount INTEGER,
  FOREIGN KEY (SellerId) REFERENCES Users(UserId) ON DELETE CASCADE
);

CREATE TABLE Users (
  UserId VARCHAR PRIMARY KEY UNIQUE,
  Rating INTEGER,
  Location VARCHAR,
  Country VARCHAR
);

CREATE TABLE Categories (
  ItemId INTEGER,
  Category VARCHAR,
  PRIMARY KEY (ItemId, Category),
  FOREIGN KEY (ItemId) REFERENCES Items(ItemId) ON DELETE CASCADE
);

CREATE TABLE Bids (
  ItemId INTEGER,
  UserId VARCHAR,
  BidTime DATETIME,
  Amount MONEY,
  UNIQUE (ItemId, BidTime),
  PRIMARY KEY (UserId, BidTime),
  FOREIGN KEY (ItemId) REFERENCES Items(ItemId) ON DELETE CASCADE,
  FOREIGN KEY (UserId) REFERENCES Users(UserId) ON DELETE CASCADE
);

CREATE TABLE CurrentTime (
  Now DATETIME,
  PRIMARY KEY (Now)
);

INSERT INTO CurrentTime
VALUES ('2001-12-20 00:00:01');

SELECT Now
FROM CurrentTime;
