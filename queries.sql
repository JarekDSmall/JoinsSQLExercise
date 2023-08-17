-- write your queries here


--Join the two tables to display all columns and records, regardless of whether there is an owner_id or not:
SELECT owners.id, first_name, last_name, vehicles.id, make, model, year, price, owner_id
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id;

--Count the number of cars for each owner and display their first_name, last_name, and count of vehicles, ordered by first_name:
SELECT first_name, last_name, COUNT(vehicles.id) AS count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
ORDER BY first_name;

--Count the number of cars for each owner, display their first_name, last_name, average price (as integer), and count of vehicles. Display only results with more than one vehicle and an average price greater than 10000, ordered by first_name in descending order:
SELECT first_name, last_name, ROUND(AVG(price)::integer) AS average_price, COUNT(vehicles.id) AS count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
HAVING COUNT(vehicles.id) > 1 AND AVG(price) > 10000
ORDER BY first_name DESC;
