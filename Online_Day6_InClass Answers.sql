use Day5; 

# Question 1:
# 1) Print Products with an average value of Purchase_cost per product only when exceeding average of 6000.

select product , avg(purchase_cost) from bank_inventory_pricing group by product having avg(purchase_cost) > 6000;

# Question 2:
# 2) Print  products whose average of purchase_cost is less than sum of purchase_cost    of  Bank_inventory_pricing

select product , avg(purchase_cost)  , sum(purchase_cost) from bank_inventory_pricing group by product having avg(purchase_cost) < sum(purchase_cost);

# Question 3:
# 3) Print product and its average of Estimated_sale_price when  purchase_cost is not mentioned. 

select product , avg(estimated_sale_price) from bank_inventory_pricing where purchase_cost is null group by product;

# Question 4:
# 4) Display maximum estiamted_sale_price of each product  when the product total quantity is exceeding 4 and its purchase_cost is not updated. 

select product, sum(quantity) , max(estimated_sale_price) from bank_inventory_pricing where purchase_cost is null group by product having sum(quantity) > 4;

# Question 5:
# 5) Print products whose average of purchase_cost per product is less than 200  In table: Bank_inventory_pricing  

select product from bank_inventory_pricing group by product having ifnull(avg(purchase_cost),0) < 200;

# Question 6:
# 6) Print each Product with its highest estimated_sale_price in bank_inventory_pricing 

select product , max(estimated_sale_price) from bank_inventory_pricing group by product;

# Question 7:
# 7) Print product with an increase in  average of estimated_sale_price  by 15% when average product_cost is more than estimated_sale_price 

select product , avg(estimated_sale_price) , avg(estimated_sale_price)*1.15 from bank_inventory_pricing group by product having avg(purchase_cost) > avg(estimated_sale_price);

# Question 8:
# 8) Calculate average estimated_sale_price for each product . For any updated estimated_sale_price, replace the value with purchase_cost 

select product , avg(ifnull(estimated_sale_price,purchase_cost)) from bank_inventory_pricing group by product;

# Question 9:
# 9) Print products and their avg price on condition that products appeared in at least three different months. 

select product , avg(price) , count(distinct month) from bank_inventory_pricing group by product having count(distinct month) > 2;
