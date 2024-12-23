que1 ) select DATE_TRUNC('month', s.Date) AS SalesMonth,
c.Region, p.Category AS Category,
sum(s.TotalAmount) AS TotalSales,
sum(s.Quantity) AS TotalQuantity   
from Sales s join  Customers c on s.CustomerID = c.CustomerID join
Products p ON s.ProductID = p.ProductID
group by DATE_TRUNC('month', s.Date), c.Region, p.Category
order by SalesMonth, c.Region,Category;  

que2) select c.CustomerID, c.Name as CustomerName, sum(s.TotalAmount) as TotalRevenue,
rank() over (order by sum(s.TotalAmount) desc) As RevenueRank from Sales s
join Customers c on s.CustomerID = c.CustomerID
group by c.CustomerID, c.Name
order by RevenueRank limit 5;