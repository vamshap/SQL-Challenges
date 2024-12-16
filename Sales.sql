CREATE TABLE sales (
 month_wise_sales CHAR(20),
 year_sales INT
);

INSERT INTO sales (month_wise_sales, year_sales) 
VALUES ('Jan', 15);

INSERT INTO sales (month_wise_sales, year_sales) 
VALUES ('Feb', 22);

INSERT INTO sales (month_wise_sales, year_sales) 
VALUES ('Mar', 35);

INSERT INTO sales (month_wise_sales, year_sales) 
VALUES ('Apr', 45);

INSERT INTO sales (month_wise_sales, year_sales) 
VALUES ('May', 60);


SELECT *, year_sales - LAG (year_sales,1,0) OVER (ORDER BY year_sales)  FROM sales