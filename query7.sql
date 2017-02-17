select count(distinct Category)
from Categories C, Bids B
where C.ItemId = B.ItemId and B.Amount > 100;
