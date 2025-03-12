-- Create the nomnom table if it does not exist
CREATE TABLE IF NOT EXISTS nomnom (
NAME TEXT,
NEIGHBOURHOOD TEXT,
CUISINE TEXT,
REVIEW REAL,
PRICE TEXT,
HEALTH TEXT
);
-- Insert sample data into the nomnom table
INSERT INTO nomnom (NAME, NEIGHBOURHOOD, CUISINE, REVIEW, PRICE, HEALTH) VALUES

('Peter', 'Brooklyn', 'Steak', 4.4, '$$$$', 'A'),
('Jongro', 'Midtown', 'Korean', 3.5, '$$', 'A'),
('Pocha', 'Midtown', 'Pizza', 4, '$$$', 'B'),
('Lighthouse', 'Queens', 'Chinese', 3.9, '$', 'A'),
('Minca', 'Downtown', 'American', 4.6, '$$$', ''),
('Marea', 'Chinatown', 'Chinese', 3.0, '$$', ''),
('Dirty Candy', 'Uptown', 'Italian', 4.9, '$$$$', 'B'),
('Di Fara Pizza', 'Brooklyn', 'Pizza', 3.8, '$$$', 'A'),
('Golden Unicorn', 'Uptown', 'Italian', 3.8, '$$', 'A');
-- Queries
-- FIND ALL
SELECT * FROM nomnom;
-- FIND ALL NEIGBOURHOODS
SELECT DISTINCT NEIGHBOURHOOD FROM nomnom;
-- FIND EVERY TYPE OF CUISINE
SELECT DISTINCT CUISINE FROM nomnom;
-- FIND ALL RESTAURANTS OFFERING CHINESE
SELECT * FROM nomnom
WHERE CUISINE = "Chinese";
-- FIND ALL RESTAURANTS WITH AVERAGE REVIEWS HIGHER THAN OR EQUAL TO 4
SELECT * FROM nomnom
WHERE REVIEW >= 4;
-- FIND ALL RESTAURANTS WITH 3 $ SIGNS
SELECT * FROM nomnom
WHERE PRICE = "$$$";
-- SELECT ALL RECORDS WHERE NAME CONTAINES CANDY
SELECT * FROM nomnom
WHERE NAME LIKE "%CANDY%";
-- ALL RECORDS WHERE NEIGHBOURHOOD IS MIDTOWN, DOWNTOWN, CHINATOWN
SELECT * FROM nomnom
WHERE NEIGHBOURHOOD IN ("Midtown", "Downtown", "Chinatown");
-- SELECT TOP FOUR RESTAURANTS IN TERMS OF REVIEWS
SELECT * FROM nomnom
ORDER BY REVIEW DESC
LIMIT 4;
-- FIND ALL RESTAURANTS UNDERGOING HEALTH INSPECTION
SELECT * FROM nomnom
WHERE HEALTH = '';
-- FIND AVERAGE REVIEW FOR ALL CUIOSINE TYPE
SELECT CUISINE, AVG(REVIEW) FROM nomnom
GROUP BY CUISINE;
-- RETREIVE THE COUNT OF RESTAURANTS IN EACH NEIGHBOURHOOD
SELECT NEIGHBOURHOOD, COUNT(*) FROM nomnom AS TOTAL_RESTAURANTS
GROUP BY NEIGHBOURHOOD;
-- Retrieve the highest-rated restaurant
SELECT * FROM nomnom
ORDER BY REVIEW DESC
LIMIT 1;
-- Retrieve the lowest-rated restaurant
SELECT * FROM nomnom
ORDER BY REVIEW ASC
LIMIT 1;
-- Retrieve all restaurants that have a health rating of 'A' or 'B
SELECT * FROM nomnom
WHERE HEALTH = 'A' OR HEALTH = 'B';
-- Retrieve the number of restaurants per price category
SELECT PRICE, COUNT(*) FROM nomnom
GROUP BY PRICE;
-- Retrieve the most expensive restaurants ($$$$) with a review rating of at least 4
SELECT * from nomnom
WHERE PRICE = '$$$$' AND REVIEW >= 4
-- Retrieve restaurants with reviews between 3.5 and 4.5
SELECT * from nomnom
WHERE REVIEW BETWEEN 3.5 AND 4.5;
-- Retrieve restaurants sorted by neighborhood and then by review in descending order
SELECT * FROM nomnom
ORDER BY NEIGHBOURHOOD ASC, REVIEW DESC;
-- Retrieve the top-rated restaurant for each cuisine type
SELECT NAME, CUISINE, REVIEW from nomnom
WHERE REVIEW = (SELECT MAX(REVIEW) FROM nomnom n2
WHERE n2.CUISINE = nomnom.CUISINE);
-- Count the number of restaurants with a specific health rating
SELECT HEALTH, COUNT(*) AS TOTAL FROM nomnom
GROUP BY HEALTH;
-- Retrieve all restaurants where the neighborhood name starts with 'B'
SELECT * FROM nomnom
WHERE NAME LIKE 'B%';
-- Retrieve restaurants that are neither in Brooklyn nor Midtown
SELECT * FROM nomnom
WHERE NEIGHBOURHOOD NOT IN ('Brooklyn', 'Midtown');
-- Retrieve the most reviewed restaurant in each neighborhood
SELECT NAME, NEIGHBOURHOOD, REVIEW FROM nomnom
WHERE REVIEW = (SELECT MAX(REVIEW) FROM nomnom N2
WHERE n2.NEIGHBOURHOOD = nomnom.NEIGHBOURHOOD);