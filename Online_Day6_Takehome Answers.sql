
/* Pre-requisite */
## Use tables Bank_Inventory_pricing, Bank_branch_PL to solve following queries
use day5;
# Question 1:
# 1) Print product , sum of quantity more than  6 sold during all three months.  

select product , sum(quantity) from bank_inventory_pricing group by product having sum(quantity) > 6; 

# Question 2:
# 2) Real Profit = revenue - cost  Find for which products, branch level real profit is more than the estimated_profit in Bank_branch_PL .

select branch from bank_branch_pl group by branch,product having sum(ifnull(revenue,0)) - sum(ifnull(cost,0)) > sum(ifnull(estimated_profit,0));

# Question 3:
# 3) Real  Profit = revenue - cost  Print branch and its sum of  estimated_profit and sum of real profit ignoring the loss 

select branch , sum(ifnull(revenue,0)) - sum(ifnull(cost,0)) Real_profit , sum(ifnull(Estimated_profit,0)) from bank_branch_pl group by branch;

# Question 4:
# 4)  For which products of the banker of the branch , the total loss  is incurred . 
# Note : revenue - cost  is Loss if its value is -ve. 

select branch , banker , product from bank_branch_pl group by product having sum(ifnull(revenue,0)) - sum(ifnull(cost,0)) < 0;

# Question 5:
# 5)  Find the least calculated profit earned during all 3 periods

select product from bank_branch_pl group by product order by sum(ifnull(revenue,0)) - sum(ifnull(cost,0)) limit 1;

# Question 6:
# 6)  Find branch level overall calculated profit greater than estimated profit ignoring the products encountered with loss

select branch from bank_branch_pl group by branch having sum(ifnull(revenue,0)) - sum(ifnull(cost,0)) > sum(ifnull(estimated_profit,0));

# Question 7:
# 7)  Find products calculated profit at branch reaching the estimated_profit with minimum difference of 10% 

select branch from bank_branch_pl group by branch having (sum(ifnull(revenue,0)) - sum(ifnull(cost,0)) - sum(ifnull(estimated_profit,0))) > sum(ifnull(estimated_profit,0))*0.1;

# Question 8:
# 8) Reduce 30% of the cost for all the products and print the products whose  calculated profit at branch is exceeding estimated_profit .

select product from bank_branch_pl group by product having sum(ifnull(revenue,0)) - (sum(ifnull(cost,0))*0.7) > sum(ifnull(estimated_profit,0));