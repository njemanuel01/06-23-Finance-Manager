#Personal Finance Manager

A PFM is a tool to help a person keep track of their personal finances in their savings and checking accounts.  

##### Description

The manager will have:

    -many users accessing it
    -many accounts associated with each user
    -many transactions associated with each account
    -many categories by which to group transactions
  
Every user will have one or more accounts.  Each account will have many transactions associated with it.  Each transaction will be associated with one user, one account, and one category.
  
##### Tables

User

    -id
    -name
  
Accounts

    -id
    -name
  
Acct.-User Bridge

    -user_id
    -account_id
  
Category

    -id
    -name
  
Transactions

    -id
    -amount
    -description
    -date
    -category_id
    -account_id
 
##### "Should" Cases

    -Be able to create and access user accounts
    -enter/edit/delete/see accounts associated with multiple users
    -enter/edit/delete/see transactions
    -see total balances
    -see transactions/totals by category
   
##### "Should Not" Cases

    -Delete a category that has transactions associated with it
    -Delete an account with a balance that is not 0.00
  
##### Requirements

    -At least three models
      -At least one _one-to-many_ relationship
      -At least one _many-to-many_ relationship
    -Unit tests for all business logic
    -Ability to fully interact with the application from the browser
  
