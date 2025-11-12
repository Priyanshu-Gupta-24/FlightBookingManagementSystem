-- 1. List all bookings with passenger and flight details.
SELECT BookingID, Passenger.Name, FlightNumber, TravelClass, BookingDate 
FROM Booking 
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID
JOIN Flight ON Booking.FlightID = Flight.FlightID;

-- 2. Find available seats for each flight.
SELECT FlightNumber, AvailableSeats FROM Flight;

-- 3. Find all flights departing from a specific airport (e.g., 'DEL').
SELECT FlightNumber FROM Flight 
WHERE DepartureAirport = (SELECT AirportID FROM Airport WHERE Code = 'DEL');

-- 4. List all passengers who booked 'Business' class tickets.
SELECT DISTINCT Passenger.Name 
FROM Booking 
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID 
WHERE TravelClass = 'Business';

-- 5. Count total bookings per flight.
SELECT FlightNumber, COUNT(*) AS TotalBookings 
FROM Booking 
JOIN Flight ON Booking.FlightID = Flight.FlightID 
GROUP BY FlightNumber;

-- 6. Show total payments received per payment method.
SELECT Method, SUM(Amount) AS TotalAmount 
FROM Payment 
WHERE Status = 'Completed' 
GROUP BY Method;

-- 7. List passengers with unpaid bookings.
SELECT Passenger.Name, Booking.PaymentStatus 
FROM Booking 
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID 
WHERE PaymentStatus = 'Unpaid';

-- 8. Get flights between two airports (e.g., DEL to BOM).
SELECT FlightNumber FROM Flight 
WHERE DepartureAirport = (SELECT AirportID FROM Airport WHERE Code = 'DEL') 
AND ArrivalAirport = (SELECT AirportID FROM Airport WHERE Code = 'BOM');

-- 9. Find total revenue by airline.
SELECT Airline.Name, SUM(Payment.Amount) AS Revenue 
FROM Payment 
JOIN Booking ON Payment.BookingID = Booking.BookingID 
JOIN Flight ON Booking.FlightID = Flight.FlightID 
JOIN Airline ON Flight.AirlineID = Airline.AirlineID 
WHERE Payment.Status = 'Completed' 
GROUP BY Airline.Name;

-- 10. List all passengers who have paid more than 10,000 in total.
SELECT Passenger.Name, SUM(Payment.Amount) AS TotalPaid
FROM Passenger
JOIN Booking ON Passenger.PassengerID = Booking.PassengerID
JOIN Payment ON Booking.BookingID = Payment.BookingID
WHERE Payment.Status = 'Completed'
GROUP BY Passenger.Name
HAVING TotalPaid > 10000;

-- 11. Find flights that have more than 100 available seats.
SELECT FlightNumber, AvailableSeats
FROM Flight
WHERE AvailableSeats > 100;

-- 12. Show airlines with their total number of flights operated.
SELECT Airline.Name, COUNT(Flight.FlightID) AS NumberOfFlights
FROM Airline
LEFT JOIN Flight ON Airline.AirlineID = Flight.AirlineID
GROUP BY Airline.Name;

-- 13. Retrieve bookings made on the latest booking date.
SELECT BookingID, Passenger.Name, FlightNumber, BookingDate
FROM Booking
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID
JOIN Flight ON Booking.FlightID = Flight.FlightID
WHERE BookingDate = (SELECT MAX(BookingDate) FROM Booking);

-- 14. Find the busiest airport (most flights departing from).
SELECT Airport.Name, COUNT(*) AS Departures
FROM Airport
JOIN Flight ON Airport.AirportID = Flight.DepartureAirport
GROUP BY Airport.AirportID
ORDER BY Departures DESC
LIMIT 1;

-- 15. List passengers who have booked flights in 'First Class'.
SELECT DISTINCT Passenger.Name
FROM Booking
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID
WHERE TravelClass = 'First Class';

-- 16. Get average payment amount by travel class.
SELECT TravelClass, AVG(Payment.Amount) AS AvgPayment
FROM Booking
JOIN Payment ON Booking.BookingID = Payment.BookingID
GROUP BY TravelClass;

-- 17. Find flights with no bookings.
SELECT FlightNumber
FROM Flight
WHERE FlightID NOT IN (SELECT DISTINCT FlightID FROM Booking);

-- 18. List passengers who have booked flights but with a total payment amount less than the average passenger payment.
SELECT Passenger.Name, 
       (SELECT SUM(P.Amount) 
        FROM Booking B 
        JOIN Payment P ON B.BookingID = P.BookingID 
        WHERE B.PassengerID = Passenger.PassengerID) AS TotalPaid
FROM Passenger
WHERE (SELECT SUM(P.Amount) 
       FROM Booking B 
       JOIN Payment P ON B.BookingID = P.BookingID 
       WHERE B.PassengerID = Passenger.PassengerID) < 
      (SELECT AVG(TotalAmount) FROM (
          SELECT SUM(P2.Amount) AS TotalAmount 
          FROM Booking B2 
          JOIN Payment P2 ON B2.BookingID = P2.BookingID 
          GROUP BY B2.PassengerID
      ) AS Sub);

-- 19. Find passengers whose names start with 'S' and have made at least one completed payment.
SELECT DISTINCT Passenger.Name
FROM Passenger
WHERE Passenger.Name LIKE 'S%'
AND Passenger.PassengerID IN (
    SELECT Booking.PassengerID
    FROM Booking
    JOIN Payment ON Booking.BookingID = Payment.BookingID
    WHERE Payment.Status = 'Completed'
);

-- 20. Find passengers who paid by card.
SELECT DISTINCT Passenger.Name
FROM Payment
JOIN Booking ON Payment.BookingID = Booking.BookingID
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID
WHERE Payment.Method = 'Card';

-- 21. Find bookings made between two specific dates.
SELECT BookingID, Passenger.Name, FlightNumber, BookingDate
FROM Booking
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID
JOIN Flight ON Booking.FlightID = Flight.FlightID
WHERE BookingDate BETWEEN '2025-11-11' AND '2025-11-15';

-- 22. List passengers whose passport number starts with 'P1%'.
SELECT Name, PassportNumber
FROM Passenger
WHERE PassportNumber LIKE 'P1%';

-- 23. Find flights where flight number contains 'AI' and departure date is after '2025-11-15'.
SELECT FlightNumber, DepartureDateTime, ArrivalDateTime
FROM Flight
WHERE FlightNumber LIKE '%AI%'
AND DepartureDateTime > '2025-11-15 00:00:00';

-- 24. List passengers with their total bookings and payments, sorted by total payment descending and bookings descending.
SELECT Passenger.Name,
       COUNT(Booking.BookingID) AS TotalBookings,
       SUM(Payment.Amount) AS TotalPayments
FROM Passenger
JOIN Booking ON Passenger.PassengerID = Booking.PassengerID
JOIN Payment ON Booking.BookingID = Payment.BookingID
GROUP BY Passenger.PassengerID
ORDER BY TotalPayments DESC, TotalBookings DESC;

-- 25. Find bookings where difference between departure date and booking date is greater than 0 and less than 3 days.
SELECT BookingID, Passenger.Name, FlightNumber, BookingDate, DepartureDateTime,
       DATEDIFF(DepartureDateTime, BookingDate) AS DaysBetween
FROM Booking
JOIN Passenger ON Booking.PassengerID = Passenger.PassengerID
JOIN Flight ON Booking.FlightID = Flight.FlightID
WHERE DATEDIFF(DepartureDateTime, BookingDate) > 0
  AND DATEDIFF(DepartureDateTime, BookingDate) < 3;
