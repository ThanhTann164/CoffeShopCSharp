CREATE database CoffeeDB

CREATE TABLE TableFood (
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
	status BIT NOT NULL
);

CREATE TABLE Account (	
	ID INT PRIMARY KEY IDENTITY (1,1),
	Name NVARCHAR(100) NOT NULL,
	Password NVARCHAR(1000) NOT NULL,
	Gender bit,
	Type INT NOT NULL DEFAULT 0 --1: admin && 0: staff
);

CREATE TABLE FoodCategory (
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL
);

CREATE TABLE Food (
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	image_link TEXT NOT NULL,
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0,
	FOREIGN KEY (idCategory) REFERENCES FoodCategory(id)
);
CREATE TABLE Bill (
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATETIME NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATETIME,
	idTable INT NOT NULL,
	issuerId INT,
	status BIT NOT NULL DEFAULT 0, -- 1: đã thanh toán là 0: chưa thanh toán
	FOREIGN KEY (issuerId) REFERENCES Account(id),
	FOREIGN KEY (idTable) REFERENCES TableFood(id)
);

CREATE TABLE BillInfo (
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	quantity INT NOT NULL DEFAULT 0,
	FOREIGN KEY (idBill) REFERENCES Bill(id),
	FOREIGN KEY (idFood) REFERENCES Food(id)
);

INSERT INTO TableFood (name, status) VALUES
('Table 1', 1),
('Table 2', 1),
('Table 3', 0),
('Table 4', 1),
('Table 5', 1),
('Table 6', 0),
('Table 7', 1),
('Table 8', 1),
('Table 9', 1),
('Table 10', 0),
('Table 11', 1),
('Table 12', 1);

INSERT INTO FoodCategory (name) VALUES
('Beverage'),
('Food');

INSERT INTO Food (name, image_link, idCategory, price) VALUES
('Espresso', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwdOE-g_V_yQv3fVzXpWXOBuFXs36SxgkTuQ&s', 1, 2.50),
('Cappuccino', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrCYhR4RfwnYKzzz760Jw_T5Md8MOUAzC3iw&s', 1, 3.00),
('Latte', 'https://cdn.tgdd.vn/2021/09/CookProduct/Cafe-latte-la-gi-latte-va-cupuchino-co-gi-khac-cac-loai-cach-pha-latte-0-1200x676.jpg', 1, 3.25),
('Americano', 'https://caphekhoanbetong.com/wp-content/uploads/2021/09/cafe-americano-da-nong-ngot-thanh-chuan-my-1.jpg', 1, 2.75),
('Green Tea', 'https://heirloombodycare.com.au/cdn/shop/products/green_tea_b2b5b32f-1f04-44d8-8f01-f960b29b1be2_grande.jpg?v=1568194793', 1, 2.00),
('Croissant', 'https://masabakery.in/cdn/shop/files/Croissant-min.jpg?v=1690781324', 2, 2.50),
('Bagel', 'https://www.eatingwell.com/thmb/Jw6a3CDrmJ1qpcky0sunPGe-jUY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/5466673-5f3ef4f04a364250a54ecea967063cdc.jpg', 2, 3.00),
('Sandwich', 'https://d28b9t9gqzccgt.cloudfront.net/z4815769629555_506670e39f83d4bb8c81deee715f8e5f.jpg', 2, 5.50),
('Muffin', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhdCuhOQv3TEu3PdeSZhHPJy3Y7AO1Nxe0rQ&s', 2, 2.75),
('Salad', 'https://www.onceuponachef.com/images/2019/07/Big-Italian-Salad-1200x1553.jpg', 2, 6.00)
;

INSERT INTO Account (Name, Password, Gender, Type) VALUES
('ThinhPhan', '111', 1, 1),
('BuiTan', '123', 0, 1),
('Ha', '222', 1, 0),
('Tai', '222', 0, 0),
('Tri', '111', 1, 0);

SELECT * from Account

--INSERT INTO Bill (DateCheckIn, DateCheckOut, idTable, issuerId, status) VALUES
--('2024-07-09 09:30:00', '2024-07-09 10:02:00', 1, 2, 1),
--('2024-07-09 10:03:00', '2024-07-09 11:00:00', 3, 3, 1),
--('2024-07-09 14:00:00', '2024-07-09 14:40:00', 5, 4, 1),
--('2024-07-09 15:00:00', '2024-07-09 15:20:00', 7, 2, 1),
--('2024-07-09 18:30:00', '2024-07-09 18:45:00', 9, 3, 1);

--INSERT INTO BillInfo (idBill, idFood, quantity) VALUES
--(1, 1, 2),
--(1, 6, 1),
--(2, 3, 1),
--(2, 8, 2),
--(3, 2, 2),
--(3, 9, 1),
--(4, 4, 1),
--(4, 7, 1),
--(5, 5, 2),
--(5, 10, 1);