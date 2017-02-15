drop table if exists Items;
drop table if exists Users;
drop table if exists Categories;
drop table if exists Bids;

CREATE TABLE Items (
  ItemId INTEGER PRIMARY KEY,
  Name VARCHAR,
  CurrentBid MONEY,
  BuyItNow MONEY,
  FirstBid MONEY,
  BidStartTime DATETIME,
  EndTime DATETIME,
  SellerId VARCHAR,
  Description VARCHAR,
  FOREIGN KEY (SellerId) REFERENCES Users(UserId)
);

CREATE TABLE Users (
  UserId VARCHAR PRIMARY KEY,
  Rating INTEGER,
  Location VARCHAR,
  Country VARCHAR
);

CREATE TABLE Categories (
  ItemId INTEGER,
  Category VARCHAR,
  PRIMARY KEY (ItemId, Category),
  FOREIGN KEY (ItemId) REFERENCES Items(ItemId)
);

CREATE TABLE Bids (
  ItemId INTEGER,
  UserId VARCHAR,
  BidTime DATETIME,
  Amount MONEY,
  PRIMARY KEY (UserId, BidTime),
  FOREIGN KEY (ItemId) REFERENCES Items(ItemId),
  FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
