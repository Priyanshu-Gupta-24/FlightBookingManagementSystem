CREATE DATABASE IF NOT EXISTS FlightBookingDB;
USE FlightBookingDB;

CREATE TABLE Airline (
  AirlineID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  ContactInfo VARCHAR(255)
);

CREATE TABLE Airport (
  AirportID INT PRIMARY KEY,
  Code VARCHAR(10) UNIQUE NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Location VARCHAR(255)
);

CREATE TABLE Flight (
  FlightID INT PRIMARY KEY,
  FlightNumber VARCHAR(16) NOT NULL,
  AirlineID INT,
  DepartureAirport INT,
  ArrivalAirport INT,
  DepartureDateTime DATETIME,
  ArrivalDateTime DATETIME,
  AvailableSeats INT,
  FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
  FOREIGN KEY (DepartureAirport) REFERENCES Airport(AirportID),
  FOREIGN KEY (ArrivalAirport) REFERENCES Airport(AirportID)
);

CREATE TABLE Passenger (
  PassengerID INT PRIMARY KEY,
  Name VARCHAR(255),
  Contact VARCHAR(16),
  PassportNumber VARCHAR(32)
);

CREATE TABLE Booking (
  BookingID INT PRIMARY KEY,
  PassengerID INT,
  FlightID INT,
  TravelClass VARCHAR(32),
  BookingDate DATETIME,
  PaymentStatus VARCHAR(20),
  FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
  FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  BookingID INT,
  Amount DECIMAL(10,2),
  Method VARCHAR(32),
  Status VARCHAR(20),
  FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);
