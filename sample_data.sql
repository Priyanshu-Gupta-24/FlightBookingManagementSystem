-- Airlines
INSERT INTO Airline VALUES (1, 'IndiGo', 'indi_go@air.com');
INSERT INTO Airline VALUES (2, 'Air India', 'air_india@air.com');
INSERT INTO Airline VALUES (3, 'SpiceJet', 'spicejet@air.com');
INSERT INTO Airline VALUES (4, 'Vistara', 'vistara@air.com');
INSERT INTO Airline VALUES (5, 'GoAir', 'goair@air.com');
INSERT INTO Airline VALUES (6, 'AirAsia', 'airasia@air.com');
INSERT INTO Airline VALUES (7, 'Jet Airways', 'jetairways@air.com');
INSERT INTO Airline VALUES (8, 'Alliance Air', 'allianceair@air.com');
INSERT INTO Airline VALUES (9, 'TruJet', 'trujet@air.com');
INSERT INTO Airline VALUES (10, 'Air Odisha', 'airodisha@air.com');

-- Airports
INSERT INTO Airport VALUES (1, 'DEL', 'Indira Gandhi International Airport', 'Delhi');
INSERT INTO Airport VALUES (2, 'BOM', 'Chhatrapati Shivaji Maharaj Airport', 'Mumbai');
INSERT INTO Airport VALUES (3, 'BLR', 'Kempegowda International Airport', 'Bangalore');
INSERT INTO Airport VALUES (4, 'HYD', 'Rajiv Gandhi International Airport', 'Hyderabad');
INSERT INTO Airport VALUES (5, 'MAA', 'Chennai International Airport', 'Chennai');
INSERT INTO Airport VALUES (6, 'PNQ', 'Pune Airport', 'Pune');
INSERT INTO Airport VALUES (7, 'COK', 'Cochin International Airport', 'Kochi');
INSERT INTO Airport VALUES (8, 'GOI', 'Dabolim Airport', 'Goa');
INSERT INTO Airport VALUES (9, 'AMD', 'Sardar Vallabhbhai Patel International Airport', 'Ahmedabad');
INSERT INTO Airport VALUES (10, 'LKO', 'Chaudhary Charan Singh Airport', 'Lucknow');

-- Flights
INSERT INTO Flight VALUES (1, '6E123', 1, 1, 2, '2025-11-12 14:00:00', '2025-11-12 16:10:00', 150);
INSERT INTO Flight VALUES (2, 'AI101', 2, 2, 3, '2025-11-13 09:00:00', '2025-11-13 11:20:00', 200);
INSERT INTO Flight VALUES (3, 'SG204', 3, 3, 4, '2025-11-14 06:30:00', '2025-11-14 08:45:00', 180);
INSERT INTO Flight VALUES (4, 'UK450', 4, 4, 5, '2025-11-15 18:15:00', '2025-11-15 20:30:00', 160);
INSERT INTO Flight VALUES (5, 'G8632', 5, 5, 1, '2025-11-16 21:00:00', '2025-11-17 23:15:00', 170);
INSERT INTO Flight VALUES (6, 'AI202', 2, 1, 3, '2025-11-17 07:45:00', '2025-11-17 10:05:00', 220);
INSERT INTO Flight VALUES (7, '6E789', 1, 6, 7, '2025-11-18 12:00:00', '2025-11-18 14:05:00', 140);
INSERT INTO Flight VALUES (8, 'SG303', 3, 7, 8, '2025-11-19 15:30:00', '2025-11-19 17:45:00', 130);
INSERT INTO Flight VALUES (9, 'UK555', 4, 9, 10, '2025-11-20 19:00:00', '2025-11-20 21:10:00', 150);
INSERT INTO Flight VALUES (10, 'AI303', 2, 10, 6, '2025-11-21 08:00:00', '2025-11-21 10:15:00', 165);

-- Passengers
INSERT INTO Passenger VALUES (1, 'Rahul Sharma', '9811123456', 'P1233456');
INSERT INTO Passenger VALUES (2, 'Priya Verma', '9822045678', 'P7894562');
INSERT INTO Passenger VALUES (3, 'Amit Singh', '9833127890', 'P9081726');
INSERT INTO Passenger VALUES (4, 'Deepa Nair', '9844234567', 'P2468135');
INSERT INTO Passenger VALUES (5, 'Karan Mehta', '9855123459', 'P3579246');
INSERT INTO Passenger VALUES (6, 'Neha Gupta', '9866012345', 'P8642097');
INSERT INTO Passenger VALUES (7, 'Sunil Roy', '9877123450', 'P7531598');
INSERT INTO Passenger VALUES (8, 'Anita Desai', '9888123451', 'P1357911');
INSERT INTO Passenger VALUES (9, 'Vikram Patel', '9899234562', 'P2468024');
INSERT INTO Passenger VALUES (10, 'Sunita Joshi', '9900345673', 'P9753186');

-- Bookings
INSERT INTO Booking VALUES (1, 1, 1, 'Economy', '2025-11-10 10:00:00', 'Paid');
INSERT INTO Booking VALUES (2, 2, 2, 'Business', '2025-11-11 11:15:00', 'Unpaid');
INSERT INTO Booking VALUES (3, 3, 1, 'Economy', '2025-11-11 12:45:00', 'Paid');
INSERT INTO Booking VALUES (4, 4, 3, 'Economy', '2025-11-12 14:30:00', 'Paid');
INSERT INTO Booking VALUES (5, 5, 4, 'First Class', '2025-11-12 15:00:00', 'Paid');
INSERT INTO Booking VALUES (6, 6, 5, 'Economy', '2025-11-13 16:20:00', 'Unpaid');
INSERT INTO Booking VALUES (7, 7, 6, 'Business', '2025-11-14 18:55:00', 'Paid');
INSERT INTO Booking VALUES (8, 8, 3, 'Economy', '2025-11-15 09:30:00', 'Paid');
INSERT INTO Booking VALUES (9, 9, 7, 'Economy', '2025-11-16 20:00:00', 'Paid');
INSERT INTO Booking VALUES (10, 10, 8, 'Business', '2025-11-17 15:45:00', 'Unpaid');

-- Payments
INSERT INTO Payment VALUES (1, 1, 5500.00, 'Card', 'Completed');
INSERT INTO Payment VALUES (2, 2, 12000.00, 'Cash', 'Pending');
INSERT INTO Payment VALUES (3, 3, 5500.00, 'UPI', 'Completed');
INSERT INTO Payment VALUES (4, 4, 6000.00, 'Card', 'Completed');
INSERT INTO Payment VALUES (5, 5, 18000.00, 'NetBanking', 'Completed');
INSERT INTO Payment VALUES (6, 6, 5000.00, 'Cash', 'Pending');
INSERT INTO Payment VALUES (7, 7, 12500.00, 'Card', 'Completed');
INSERT INTO Payment VALUES (8, 8, 6000.00, 'UPI', 'Completed');
INSERT INTO Payment VALUES (9, 9, 5500.00, 'NetBanking', 'Completed');
INSERT INTO Payment VALUES (10, 10, 12000.00, 'Card', 'Pending');
