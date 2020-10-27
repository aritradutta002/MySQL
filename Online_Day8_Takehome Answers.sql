# Pre-requisite Use bank schema to solve the queries.alter

# Question 1:
# 1) Print Savings Account number where its corresponding Credit cards including AddonCredit card transactions for more than one time .

select a.account_number primary_account, a.account_type primary_account_type , b.account_number secondaty_account , b.account_type secondary_account_type , count(c.transaction_amount)
from bank_account_relationship_details a 
left join bank_account_relationship_details b 
on a.account_number = b.linking_account_number
join bank_account_transaction c on a.account_number = c.account_number
and b.account_type like '%credit%'
group by a.account_number , a.account_type having count(transaction_amount)>1;

# Question 2:
# 2) Print Savings Account number where its corresponding only “Addon” - Credit cards  transactions for at least once.

select a.account_number primary_account, a.account_type primary_account_type , b.account_number secondaty_account , b.account_type secondary_account_type , count(c.transaction_amount)
from bank_account_relationship_details a 
left join bank_account_relationship_details b 
on a.account_number = b.linking_account_number
join bank_account_transaction c on a.account_number = c.account_number
and b.account_type = 'Add-on Credit Card'
group by a.account_number , a.account_type having count(transaction_amount)>1;

# Question 3:
# 3) Print the customer_id and length of customer_id using Natural join on 
# Tables :  bank_customer  , bank_customer_export 
# Note: Do not use table alias to refer to column names.

select customer_id , length(customer_id)
from bank_customer
natural join bank_customer_export;

# Question 4:
# 4) Print customer_id, customer_name and other common columns  from both 
-- the Tables :  bank_customer & bank_customer_export without missing any matching customer_id key column records. 
-- Note: refer datatype conversion if found any missing records

select * from bank_customer
left join bank_customer_export using(customer_id)
union all
select * from bank_customer
right join bank_customer_export using(customer_id);