
-- Display all the Top Products which Sales together is almost 80 Percent of the total Sales 


CREATE TABLE [dbo].[superstore_orders](
	[Row_ID] [float] NULL,
	[Order_ID] [nvarchar](255) NULL,
	[Order_Date] [datetime] NULL,
	[Ship_Date] [datetime] NULL,
	[Ship_Mode] [nvarchar](255) NULL,
	[Customer_ID] [nvarchar](255) NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Segment] [nvarchar](255) NULL,
	[Country/Region] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Postal_Code] [float] NULL,
	[Region] [nvarchar](255) NULL,
	[Product_ID] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Sub_Category] [nvarchar](255) NULL,
	[Product_Name] [nvarchar](255) NULL,
	[Sales] [float] NULL,
	[Quantity] [float] NULL,
	[Discount] [float] NULL,
	[Profit] [float] NULL
) ON [PRIMARY]

GO



WITH Total_Sales AS (
SELECT Sum(Sales) AS TotalSales FROm SuperStore_orders

)
,
Top20Sales AS (

SELECT Sum(Sales) AS ProductSales , [Product_Name],[Product_ID]  FROM SuperStore_orders P  Group By [Product_Name],[Product_ID]

)
,RSales AS (

SELECT [Product_ID],[Product_Name],ProductSales,ROW_NUMBER() OVER( ORDER BY ProductSales DESC) AS Lrow FROM Top20Sales)

,COMPARE AS (

SELECT Product_ID,ProductSales,SUM(ProductSales) OVER (ORDER BY Lrow ) AS RunningSales,TotalSales FROM RSales,Total_Sales 
)

SELECT Product_ID,RunningSales,TotalSales FROM Compare  WHERE (((RunningSales)/(TotalSales))*100 ) <= 80





