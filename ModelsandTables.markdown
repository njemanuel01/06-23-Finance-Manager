#Tables

###users(one to many with accounts_users, many to many with accounts)
    | id(Int. Primary Key) | name(String) | total balance(Real) |
    |----------------------|--------------|---------------------|
    |1                     |Nick          |1234.56              |

###accounts_users(many to one with users, many to one with accounts)
    | user_id(Int.) | account_id(Int.) |
    |---------------|------------------|
    |1              |2                 |

###accounts(one to many with accounts_users, many to many with users)
    | id(Int. Primary Key) | name(Text) | balance(Real) |
    |----------------------|------------|---------------|
    |1                     |Checking    |12.34          |

###categories(one to many with transactions)
    | id(Int. Primary Key) | name(Text) |
    |----------------------|------------|
    |1                     |Groceries   |

###transactions(many to one with accounts, many to one with categories, many to one with users(via accounts_users))
    | id(Int Primary Key) | amount(Real) | description(Text) | date(Text) | category_id(Int. Foreign Key) | account_id(Int. Foreign Key) |
    |---------------------|--------------|-------------------|------------|-------------------------------|------------------------------|
    |1                    |100           |Deposit from work  |06/23/15    |1                              |1                             | 




