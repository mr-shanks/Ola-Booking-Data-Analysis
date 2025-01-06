-- --------------------------------------------------------
-- SQL Script: Ola Booking Data Analysis
-- Purpose: To analyze the Ola bookings dataset by creating a database, retrieving relevant insights, and creating views for efficient querying.
-- --------------------------------------------------------

-- ========================================================
-- 1. Create Database and Use It
-- ========================================================
CREATE DATABASE Ola; -- Creates a new database called Ola
USE Ola;             -- Switch to the Ola database

-- ========================================================
-- 2. Retrieve Data from Table
-- ========================================================
SELECT * FROM Bookings; -- View all data from the Bookings table

-- ========================================================
-- 3. Create Views for Analysis
-- ========================================================
-- The following views are created to simplify analysis tasks.

-- --------------------------------------------------------
-- 3.1 Retrieve all successful bookings
-- --------------------------------------------------------
CREATE VIEW Successful_Bookings AS 
SELECT * 
FROM Bookings 
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

-- --------------------------------------------------------
-- 3.2 Find the average ride distance for each vehicle type
-- --------------------------------------------------------
CREATE VIEW Average_Ride_Distance AS 
SELECT Vehicle_Type, 
       ROUND(AVG(Ride_Distance), 2) AS Avg_Ride_Distance 
FROM Bookings 
GROUP BY Vehicle_Type;

SELECT * FROM Average_Ride_Distance;

-- --------------------------------------------------------
-- 3.3 Get the total number of cancelled rides by customers
-- --------------------------------------------------------
CREATE VIEW Cancelled_Rides AS 
SELECT COUNT(*) AS Cancelled_Ride 
FROM Bookings 
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM Cancelled_Rides;

-- --------------------------------------------------------
-- 3.4 List the top 5 customers who booked the highest number of rides
-- --------------------------------------------------------

-- MySQL Query:
CREATE VIEW Top_5_Customers AS 
SELECT Customer_ID, 
       COUNT(Booking_ID) AS Total_Rides 
FROM Bookings 
GROUP BY Customer_ID 
ORDER BY Total_Rides DESC 
LIMIT 5;

-- MS SQL Server Query:
CREATE VIEW Top_5_Customers AS 
SELECT TOP 5 Customer_ID, 
       COUNT(Booking_ID) AS Total_Rides 
FROM Bookings 
GROUP BY Customer_ID 
ORDER BY Total_Rides DESC;

SELECT * FROM Top_5_Customers;

-- --------------------------------------------------------
-- 3.5 Get the number of rides cancelled by drivers due to personal and car-related issues
-- --------------------------------------------------------
CREATE VIEW Rides_Cancelled_By_Drivers AS 
SELECT COUNT(*) AS Total_Canceled_Rides 
FROM Bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_Cancelled_By_Drivers;

-- --------------------------------------------------------
-- 3.6 Find the maximum and minimum driver ratings for Prime Sedan bookings
-- --------------------------------------------------------
CREATE VIEW Max_Min_DriverRating AS 
SELECT MAX(Driver_Ratings) AS Max_Rating, 
       MIN(Driver_Ratings) AS Min_Rating 
FROM Bookings 
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_DriverRating;

-- --------------------------------------------------------
-- 3.7 Retrieve all rides where payment was made using UPI
-- --------------------------------------------------------
CREATE VIEW UPI_Payments AS 
SELECT * 
FROM Bookings 
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payments;

-- --------------------------------------------------------
-- 3.8 Find the average customer rating per vehicle type
-- --------------------------------------------------------
CREATE VIEW Avg_Customer_Rating AS 
SELECT Vehicle_Type, 
       ROUND(AVG(Customer_Rating), 2) AS Avg_Cust_Rating 
FROM Bookings 
GROUP BY Vehicle_Type;

SELECT * FROM Avg_Customer_Rating;

-- --------------------------------------------------------
-- 3.9 Calculate the total booking value of rides completed successfully
-- --------------------------------------------------------
CREATE VIEW Successful_Booking_Value AS 
SELECT SUM(Booking_Value) AS Total_Booking_Value 
FROM Bookings 
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Booking_Value;

-- --------------------------------------------------------
-- 3.10 List all incomplete rides along with the reason
-- --------------------------------------------------------
CREATE VIEW IncompleteRides_Reason AS 
SELECT Incomplete_Rides, 
       Incomplete_Rides_Reason 
FROM Bookings 
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM IncompleteRides_Reason;

-- ========================================================
-- End of Script
-- ========================================================