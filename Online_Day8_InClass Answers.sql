Use Day7;
show tables;
# Question 1:
# 1)  Display  records of “SAVINGS” account linked with “Credit cards" account_type and its credit aggregate sum of transaction amount. 

select br1.account_number primary_account , br1.account_type primary_account_type , br2.account_number secondary_account , br2.account_type secondary_account_type , sum(transaction_amount)
from bank_account_relationship_details br1
join bank_account_relationship_details br2 on br1.account_number = br2.linking_account_number and br2.account_type = 'Credit Card'
join bank_account_transaction br3 on br2.account_number = br3.account_number
group by br1.account_number , br1.account_type , br2.account_number , br2.account_type;

# Question 2:
# 2) Compare the aggregate transaction amount of current month versus aggregate transaction with previous months.
# Display account_number, transaction_amount , 
-- sum of current month transaction amount ,
-- current month transaction date , 
-- sum of previous month transaction amount , 
-- previous month transaction date.

select t1.account_number , sum(t1.transaction_amount) current_month , date_format(t1.transaction_date,'%Y-%m') , sum(t2.transaction_amount) previous_month , date_format(t2.transaction_date,'%Y-%m')
from bank_account_transaction t1 
join bank_account_transaction t2 on date_format(t1.transaction_date , '%Y-%m') < date_format(t2.transaction_date , '%Y-%m')
group by t2.account_number , date_format(t1.transaction_date,'%Y-%m') , date_format(t2.transaction_date,'%Y-%m');
 
# Question 3:
# 3) Display individual accounts absolute transaction of every next  month is greater than the previous months .
 
select abs(t1.transaction_amount) 
from bank_account_transaction t1
join bank_account_transaction t2 on t1.account_number = t2.account_number and date_format(t1.transaction_date , '%Y-%m') > date_format(t2.transaction_date , '%Y-%m')
group by t2.account_number , t2.account_number , date_format(t1.transaction_date,'%Y-%m') , date_format(t2.transaction_date,'%Y-%m')
having sum(abs(t1.transaction_amount)) > sum(abs(t2.transaction_amount));
 
# Question 4:
# 4) Find the no. of transactions of credit cards including add-on Credit Cards

select a.account_number primary_account, a.account_type primary_account_type , b.account_number secondaty_account , b.account_type secondary_account_type , count(c.transaction_amount)
from bank_account_relationship_details a 
left join bank_account_relationship_details b 
on a.account_number = b.linking_account_number
join bank_account_transaction c on a.account_number = c.account_number
and a.account_type like '%Credit%'
group by a.account_number , a.account_type;