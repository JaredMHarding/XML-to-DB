import web

db = web.database(dbn='sqlite', db='Auction.db')

######################BEGIN HELPER METHODS######################

# Enforce foreign key constraints
# WARNING: DO NOT REMOVE THIS!
def enforceForeignKey(): db.query('PRAGMA foreign_keys = ON')

# initiates a transaction on the database
def transaction(): return db.transaction()
# Sample usage (in auctionbase.py):
#
# t = sqlitedb.transaction()
# try:
#   sqlitedb.query('[FIRST QUERY STATEMENT]')
#   sqlitedb.query('[SECOND QUERY STATEMENT]')
# except Exception as e:
#   t.rollback()
#   print str(e)
# else:
#   t.commit()
#
# check out http://webpy.org/cookbook/transactions for examples



# returns the current time from your database
def getTime():
  query_string = 'select Now from CurrentTime'
  results = query(query_string)
  return results[0].Now  # alternatively: return results[0]['time']



def setTime(new_time):
  t = db.transaction()
  try:
    db.update('CurrentTime', where="Now", Now = new_time)
  except Exception as e:
    t.rollback()
    print str(e)
  else:
    t.commit()



# returns a single item specified by the Item's ID in the database
def getItemById(item_id):
  q = 'select * from Items where ItemId = $ItemId'
  result = query(q, { 'ItemId': item_id })

  try:
    return result[0]
  except IndexError:
    return None



def getBidsByItemId(itemID):
  q = 'select * from Bids where ItemId = $ItemId'
  return query(q, {'ItemId': itemID})



# returns a single item specified by the Item's ID in the database
def getUserById(user_id):
  q = 'select * from Users where UserId = $UserId'
  result = query(q, { 'UserId': user_id })

  try:
    return result[0]
  except IndexError:
    return None



def getItems(vars = {}, minPrice = '', maxPrice = '', status = 'all', category = '', description = ''):
  # Create basic query that selects all items
  q = 'select Items.ItemId, Items.Name, Items.CurrentBid, Items.EndTime from Items, Categories'
    ############# 'where ends > (select time from currenttime)'

  if (vars != {}) or (minPrice != '') or (maxPrice != '') or (status != 'all') or (category != '') or (description != ''):
    q += ' where '

  # If params for the search are indicated, add them to
  # narrow down the query
  if vars != {}:
    q += web.db.sqlwhere(vars, grouping=' AND ')

  # If min- and/or maxPrice are defined, append those restrictions to query
  if (minPrice != '') or (maxPrice != ''):
    if vars != {}:                          q += ' AND '
    if (minPrice != ''):                    q += ' CurrentBid >= ' + minPrice
    if (minPrice != '' and maxPrice != ''): q += ' AND '
    if (maxPrice != ''):                    q += ' CurrentBid <= ' + maxPrice

  if (status != 'all'):
    if (vars != {}) or (minPrice != '') or (maxPrice != ''):
      q += ' AND '
    if status == 'open':
      q += 'EndTime >= (select Now from CurrentTime) and BidStartTime <= (select Now from CurrentTime)'
    if status == 'close':
      q += 'EndTime < (select Now from CurrentTime)'
    if status == 'notStarted':
      q += 'BidStartTime > (select Now from CurrentTime)'

  if (category != ''):
      if (vars != {}) or (minPrice != '') or (maxPrice != '') or (status != 'all'):
        q += ' AND '
      q += 'Categories.Category like "%%%s%%"' % (category)
      q += ' AND '
      q += 'Items.ItemId = Categories.ItemId'


  if (description != ''):
      if (vars != {}) or (minPrice != '') or (maxPrice != '') or (status != 'all') or (category != ''):
          q += ' AND '
      q += 'description like "%%%s%%"' % (description)
  q += ' GROUP BY Items.ItemId'

  # Return result of the query
  print("inside getItems(), q = ", q)
  return query(q)



def updateItemEndTime(itemID, new_end_time):
  db.update('Items',  where='ItemId = ' + itemID,  EndTime = new_end_time)


def addBid(itemID, price, userID, current_time):
  db.insert('Bids', ItemId = itemID, Amount = price, UserId = userID, BidTime = current_time)

def addUser(userID, location, country):
  db.insert('Users', UserId = userID, Location = location, Country = country)


def getWinnerId(itemID):
  q  = 'select UserId from Bids '
  q += 'where ItemId = $ItemId '
  q += 'and Amount = ('
  q +=  'select max(Amount) from Bids '
  q +=  'where ItemId = $ItemId'
  q += ')'

  result = query(q, { 'ItemId': itemID })

  try:
    return result[0].UserId
  except IndexError:
    return None

# wrapper method around web.py's db.query method
# check out http://webpy.org/cookbook/query for more info
def query(query_string, vars = {}):
  return list(db.query(query_string, vars))



#####################END HELPER METHODS#####################
