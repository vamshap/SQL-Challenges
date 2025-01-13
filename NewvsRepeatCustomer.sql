
-- Find out the Customers who are repeat and new Customers as per the date example Customers 100,200,300 are new on the 2022-01-01 date and 100 is repeat customer on 2022-01-02

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);
select * from customer_orders
insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)


SELECT * FROM customer_orders ;


WITH CurrentOrderCompare AS (
SELECT CurrentOrder.customer_id AS CurrentCustomerID,CurrentOrder.order_date AS CurrentOrderDate,PreviousOrder.customer_id AS PreviousCustomerID,PreviousOrder.order_date AS PreviousOrderDate FROM Customer_orders CurrentOrder LEFT JOIN Customer_orders PreviousOrder ON CurrentOrder.order_date > PreviousOrder.order_date AND CurrentOrder.customer_id = PreviousOrder.customer_id
)

SELECT CASE WHEN PreviousCustomerID IS NOT NULL AND PreviousOrderDate IS NOT NULL Then 'RepeatedCustomer'
                 ELSE 'NewCustomer' END
				 AS CustomerStatus , CurrentCustomerID,CurrentOrderDate,PreviousCustomerID,PreviousOrderDate

				 FROM CurrentOrderCompare







