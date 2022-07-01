RESPOSTA beecrowd 

Problem 2602 - Basic Select

select name from customers where state = 'RS'



Problem 2603 - Customer Address

SELECT Name,Street 
FROM Customers 
WHERE City = 'Porto Alegre'




Problem 2604 -Under 10 or Greater Than 100

SELECT id, name 
FROM products 
WHERE price  <10
OR price >100



Problem 2605 - Executive Representatives

SELECT products.name,providers.name 
FROM products,providers
WHERE id_categories=6 
AND products.id_providers=providers.id;




Problem 2606 - Categories

SELECT id,name 
FROM products 
WHERE id_categories 
IN (SELECT id FROM Categories WHERE name LIKE 'super%')




Problem 2607 - Providers' City in Alphabetical Order

SELECT City 
FROM Providers 
ORDER BY City ASC




Problem 2608 - Higher and Lower Price

SELECT max(Price) price, min(Price) price 
FROM products




Problem 2609 - Products by Categories

SELECT categories.name,sum(amount) "sum"
FROM products
INNER JOIN categories on products.id_categories=categories.id
GROUP BY categories.name;




Problem 2610 - Average Value of Products

SELECT ROUND(avg(price),2) "price" 
FROM products;




Problem 2611 - Action Movies

SELECT id,name 
FROM Movies 
WHERE id_genres = (SELECT id  FROM Genres
WHERE description = 'Action'  )




Problem 2613 - Cheap Movies

SELECT movies.id,movies.name
FROM movies
INNER JOIN prices ON movies.id_prices=prices.id
WHERE prices.value < 2.00




Problem 2614 - September Rentals

SELECT customers.name "name",rentals.rentals_date "rentals_date"
FROM customers
INNER JOIN rentals ON customers.id = rentals.id_customers
WHERE rentals.rentals_date >= '2016-09-01' 
AND rentals.rentals_date <= '2016-09-30'





Problem 2615 - Expanding the Business

SELECT distinct city 
FROM customers 




Problem  2616 - No Rental

SELECT id,name
FROM customers
WHERE id NOT IN (SELECT id_customers FROM locations)




Problem  2617 - Provider Ajax SA

SELECT products.name, providers.name
FROM products
INNER JOIN providers ON products.id_providers = providers.id
WHERE providers.name = 'Ajax SA'




Problem  2618 - Imported Products

SELECT products.name,providers.name,categories.name
FROM products
INNER JOIN providers ON products.id_providers = providers.id
INNER JOIN categories ON products.id_categories = categories.id
WHERE providers.name = 'Sansul SA' AND categories.name = 'Imported'




Problem  2619 - Super Luxury

SELECT products.name,providers.name,products.price
FROM products
INNER JOIN providers ON products.id_providers = providers.id
INNER JOIN categories ON products.id_categories = categories.id
WHERE price > 1000 AND categories.name = 'Super Luxury'




Problem  2620 - Orders in First Half

SELECT customers.name,orders.id
FROM customers
INNER JOIN orders ON customers.id = orders.id_customers
WHERE orders.orders_date>='2016-01-01' 
AND orders.orders_date <= '2016-06-30'




Problem  2621 - Amounts Between 10 and 20

SELECT products.name
FROM providers
INNER JOIN products ON providers.id = products.id_providers
WHERE products.amount>= 10 
AND products.amount <= 20 
AND providers.name LIKE 'P%'




Problem 2622 - Legal Person

SELECT name 
FROM customers 
WHERE id IN (SELECT id_customers FROM legal_person)





Problem 2623 - Categories with Various Products

SELECT products.name, categories.name
FROM products
INNER JOIN categories 
ON products.id_categories = categories.id
WHERE products.amount > 100 
AND products.id_categories IN (1,2,3,6,9)





Problem  2624 - Number of Cities per Customers

SELECT COUNT(Distinct City) 
FROM Customers




Problem  2625 - CPF Validation

SELECT CONCAT(substr(cpf,1,3),'.',SUBSTR(cpf,4,3),'.',
SUBSTR(cpf,7,3),'-',SUBSTR(cpf,10,2)) "CPF"
FROM natural_person;




Problem  2737 - Lawyers

SELECT name, customers_number 
FROM Lawyers
WHERE customers_number = (SELECT MAX(customers_number) FROM Lawyers)
UNION ALL
SELECT name, customers_number 
FROM Lawyers
WHERE customers_number = (SELECT MIN(customers_number) FROM Lawyers)
UNION ALL
SELECT 'Average'as name,cast(avg(customers_number)as int)as customers_number FROM lawyers




Problem  2738 - Contest

SELECT Candidate.name,ROUND(((Score.math*2) + (specific*3) + (project_plan*5))/10,2)  as avg
FROM Candidate
INNER JOIN Score
ON Candidate.id = Score.candidate_id
ORDER BY avg DESC






