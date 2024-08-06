-- CREATE database CLOTHE
USE CLOTHE;
-- CREATE Table OUTFIT(
-- Shop varchar(20) PRIMARY KEY,
-- Outfit_name varchar(40),
-- Outfit_colour varchar(70),
-- Price int(30),
-- City varchar(50)
-- )

-- INSERT INTO OUTFIT (Shop, Outfit_name, Outfit_colour, Price, City) VALUES
-- ('A', 'Levis trouser', 'Blue', 1400, 'Nairobi'),
-- ('B', 'Blazer shirt', 'Purple', 900, 'Nyeri'),
-- ('C', 'Savco trouser', 'Brown', 1200, 'Kisumu'),
-- ('D', 'Jeans shirt', 'Black', 800, 'Kiambu')


-- UPDATE OUTFIT
-- SET Shop = 'E',
--     Price = 750,
--    Outfit_name = 'Jeans trouser',
--    Outfit_colour = 'Blue'
-- WHERE City = 'Kiambu'



-- SELECT Outfit_name, Price
-- FROM outfit
-- WHERE City IN ('Kiambu', 'Nyeri');

-- SELECT * FROM OUTFIT

-- CREATE Table Patient (
-- PatNumber varchar(20) PRIMARY KEY,
-- PatName varchar (40),
-- AppointmentDate Date
-- )

-- INSERT INTO Patient (PatNumber, PatName, AppointmentDate) VALUES
-- ('P453', 'Abraham', '2017-11-16'),
-- ('P467', 'Joel', '2017-11-17'),
-- ('P472', 'Ann', '2017-11-16');

SELECT * FROM Patient

-- SELECT PatNumber, PatName
-- FROM Patient;

-- SELECT *
-- FROM Patient
-- WHERE AppointmentDate = '2017-11-17';

-- SELECT PatName, AppointmentDate
-- FROM Patient
-- WHERE PatNumber = 'P472';

-- SELECT *
-- FROM Patient
-- WHERE AppointmentDate BETWEEN '2017-11-16' AND '2017-11-17';

-- UPDATE Patient
-- SET PatName = 'Jane'
-- WHERE PatNumber = 'P472';








-- CREATE database BANK
USE BANK;

-- CREATE Table BANK_DETAILS(
--     Product VARCHAR(125),
--     quantity INT,
--     price REAL,
--     purchase_cost DECIMAL(10, 2),
--     estimated_sale_price FLOAT
-- )
SELECT * FROM BANK_DETAILS


-- INSERT INTO BANK_DETAILS (product, quantity, price, purchase_cost, estimated_sale_price)
-- VALUES ('PayCard', 3, 330, 200, 700);

-- INSERT INTO BANK_DETAILS (product, quantity, price, purchase_cost, estimated_sale_price)
-- VALUES ('PayPoints', 4, 200, 150, 300);

-- DESCRIBE BANK_DETAILS;

-- UPDATE BANK_DETAILS
-- SET price = 450
-- WHERE product = 'PayPoints';




USE BANK;
-- CREATE VIEW product_price_view AS
-- SELECT product, price
-- FROM BANK_DETAILS;

SELECT * FROM product_price_view;



USE BANK;

SELECT product, quantity
FROM BANK_DETAILS
ORDER BY quantity DESC
LIMIT 1;





