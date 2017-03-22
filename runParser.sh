#!/bin/sh
# run python script to create item, user, category, and bid .dat files
python parser.py ebay_data/items-1.xml

# sort and removing duplicates
sort -u item.dat -o item.dat
sort -u user.dat -o user.dat
sort -u category.dat -o category.dat
sort -u bid.dat -o bid.dat

# remove duplicates
#echo "$(uniq item.dat)" > item.dat
#echo "$(uniq user.dat)" > user.dat
#echo "$(uniq category.dat)" > category.dat
#echo "$(uniq bid.dat)" > bid.dat

# create DB
sqlite3 Auction.db < create.sql

# fill DB
sqlite3 Auction.db < load.txt
