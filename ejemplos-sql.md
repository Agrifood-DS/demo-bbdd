

# Ejemplos SQL


[Ejemplos de SQL](https://www.w3schools.com/mysql/mysql_sql.asp) 


```
SELECT productID, ProductName, c.CategoryId, c.CategoryName, Unit, Price, s.SupplierName, s.ContactName
FROM Categories c, Products p, Suppliers s
WHERE p.CategoryID = c.CategoryID AND p.SupplierID = s.SupplierID
```

```
SELECT productID, ProductName, c.CategoryId, c.CategoryName, Unit, Price, s.SupplierName, s.ContactName
FROM Categories c, Products p, Suppliers s
WHERE p.CategoryID = c.CategoryID AND p.SupplierID = s.SupplierID
AND c.CategoryId = 2
```

```
SELECT c.CategoryId, c.CategoryName, AVG(Price), s.SupplierName, s.ContactName
FROM Categories c, Products p, Suppliers s
WHERE p.CategoryID = c.CategoryID AND p.SupplierID = s.SupplierID
GROUP BY c.CategoryId
```
