#Personal Finance Manager

A PFM is a tool to help a person keep track of their personal finances in their savings and checking accounts.  

##### Description

The manager will have:

  -many users accessing it
  -many accounts associated with each user
  -many transactions associated with each account
  -many categories by which to group transactions
  
Every user will have one or more accounts.  Each account will have many transactions associated with it.  Each transaction will be associated with one user, one account, and one category.
  
##### Models

  -a user model to track which user is accessing the manager
  -an accounts model to track changes to a users accounts
  -a transactions model to track specific debits/credits to an account
  -a category model to describe the type of transaction being processed (Ex. Utilities, Food, etc.)
  -an acct.-user bridge to link users to their accounts (since an account may have multiple users(husband/wife) or a user may have multiple accounts)
 
##### "Should" Cases

  -Be able to create and access user accounts
  -enter/edit/delete/see transactions
  -see total balances
  -see transactions/totals by category/date range
   
##### "Should Not" Cases

  -Delete a category that has transactions associated with it
  -Delete an account with a balance that is not 0.00
  
