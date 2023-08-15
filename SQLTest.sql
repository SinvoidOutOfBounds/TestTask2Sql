IF OBJECT_ID('Products', 'U') IS NOT NULL
 DROP TABLE Products;

CREATE TABLE Products (
   ID int PRIMARY KEY IDENTITY
   ,Name NVARCHAR(100) NOT NULL);

IF OBJECT_ID('Categories', 'U') IS NOT NULL
 DROP TABLE Categories;

CREATE TABLE Categories (
  ID int PRIMARY KEY IDENTITY
  ,Name NVARCHAR(100) NOT NULL);

IF OBJECT_ID('ProductCategory', 'U') IS NOT NULL
 DROP TABLE ProductCategory;

CREATE TABLE ProductCategory (
ProductsID int NOT NULL
,CategoriesID int NOT NULL
,FOREIGN KEY (ProductsID) REFERENCES Products(ID)
,FOREIGN KEY (CategoriesID) REFERENCES Categories(ID));

INSERT INTO Products VALUES 
('Сыр')
,('Хлеб')
,('Ветчина')
,('Соль');

INSERT INTO Categories VALUES 
('Продукты животного происхождения')
,('Продукты растительного происхождения');

INSERT INTO ProductCategory VALUES 
(1,1)
,(2,2)
,(3,1);

SELECT p.Name AS 'Продукт', c.Name AS 'Категория' FROM Products AS p
LEFT JOIN ProductCategory AS pd ON p.ID = pd.ProductsID
LEFT JOIN Categories AS c ON c.ID = pd.CategoriesID