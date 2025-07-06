-- Creating schema
CREATE SCHEMA airportnova;
SET search_path TO airportnova;

-- Country table
CREATE TABLE Country (
    CountryCode VARCHAR(10) PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL
);

-- City table
CREATE TABLE City (
    CityName VARCHAR(100),
    State VARCHAR(100),
    CountryCode VARCHAR(10),
    PRIMARY KEY (CityName, State),
    FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

-- Airport table
CREATE TABLE Airport (
    AirCode VARCHAR(10) PRIMARY KEY,
    AirName VARCHAR(100) NOT NULL,
    City VARCHAR(100),
    State VARCHAR(100),
    CountryCode VARCHAR(10),
    FOREIGN KEY (City, State) REFERENCES City(CityName, State),
    FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

-- Airline table
CREATE TABLE Airline (
    AirlineID VARCHAR(10) PRIMARY KEY,
    AirlineName VARCHAR(100) NOT NULL
);

-- Airport contains Airline
CREATE TABLE Airport_Contains_Airline (
    AirCode VARCHAR(10),
    AirlineID VARCHAR(10),
    PRIMARY KEY (AirCode, AirlineID),
    FOREIGN KEY (AirCode) REFERENCES Airport(AirCode),
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID)
);

-- Employee table
CREATE TABLE Employee (
    EmpID VARCHAR(10) PRIMARY KEY,
    EmpName VARCHAR(100),
    Age INT,
    Address TEXT,
    Contact VARCHAR(20),
    EmailID VARCHAR(100)
);

-- Airline employs Employee
CREATE TABLE Airline_Employs_Employee (
    AirlineID VARCHAR(10),
    EmpID VARCHAR(10),
    PRIMARY KEY (AirlineID, EmpID),
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

-- Flight table
CREATE TABLE Flight (
    FlightCode VARCHAR(10) PRIMARY KEY,
    Source VARCHAR(100),
    Destination VARCHAR(100),
    Departure TIME,
    Arrival TIME,
    Duration TIME,
    Date DATE
);

-- Airline operates Flight
CREATE TABLE Airline_Operates_Flight (
    AirlineID VARCHAR(10),
    FlightCode VARCHAR(10),
    PRIMARY KEY (AirlineID, FlightCode),
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode)
);

-- Airfare table
CREATE TABLE Airfare (
    FareID VARCHAR(10) PRIMARY KEY,
    ChargeAmount DECIMAL(10,2),
    Description TEXT
);

-- Flight has Fare
CREATE TABLE Flight_Has_Fare (
    FlightCode VARCHAR(10),
    FareID VARCHAR(10),
    PRIMARY KEY (FlightCode, FareID),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode),
    FOREIGN KEY (FareID) REFERENCES Airfare(FareID)
);

-- AirplaneType table
CREATE TABLE AirplaneType (
    AID VARCHAR(10) PRIMARY KEY,
    Capacity INT,
    AWeight DECIMAL(10,2),
    Company VARCHAR(100)
);

-- Flight uses AirplaneType
CREATE TABLE Flight_Uses_AirplaneType (
    FlightCode VARCHAR(10),
    AID VARCHAR(10),
    PRIMARY KEY (FlightCode, AID),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode),
    FOREIGN KEY (AID) REFERENCES AirplaneType(AID)
);

-- Route table
CREATE TABLE Route (
    RouteID VARCHAR(10) PRIMARY KEY,
    TakeOffPoint VARCHAR(100),
    Destination VARCHAR(100),
    RouteType VARCHAR(50)
);

-- Flight travels on Route
CREATE TABLE Flight_TravelsOn_Route (
    FlightCode VARCHAR(10),
    RouteID VARCHAR(10),
    PRIMARY KEY (FlightCode, RouteID),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

-- Flight can land at Airport
CREATE TABLE Flight_Can_Land (
    FlightCode VARCHAR(10),
    AirCode VARCHAR(10),
    PRIMARY KEY (FlightCode, AirCode),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode),
    FOREIGN KEY (AirCode) REFERENCES Airport(AirCode)
);

-- Flight travels by Airline
CREATE TABLE Flight_Travels_By (
    FlightCode VARCHAR(10),
    AirlineID VARCHAR(10),
    PRIMARY KEY (FlightCode, AirlineID),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode),
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID)
);

-- Passenger table
CREATE TABLE Passenger (
    PassportNo VARCHAR(15) PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Sex VARCHAR(10),
    Address TEXT,
    Phone VARCHAR(15)
);

-- Ticket table
CREATE TABLE Ticket (
    TicketNo VARCHAR(20) PRIMARY KEY,
    Type VARCHAR(50),
    DateOfTravel DATE,
    Price DECIMAL(10,2),
    Source VARCHAR(100),
    Destination VARCHAR(100)
);

-- Passenger has Ticket
CREATE TABLE Passenger_Has_Ticket (
    PassportNo VARCHAR(15),
    TicketNo VARCHAR(20),
    PRIMARY KEY (PassportNo, TicketNo),
    FOREIGN KEY (PassportNo) REFERENCES Passenger(PassportNo),
    FOREIGN KEY (TicketNo) REFERENCES Ticket(TicketNo)
);

-- Transaction table
CREATE TABLE Transaction (
    TSID VARCHAR(20) PRIMARY KEY,
    BookingDate DATE,
    DepartureDate DATE,
    ChargeAmount DECIMAL(10,2),
    TransactionType VARCHAR(50),
    EmpID VARCHAR(10),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

-- Ticket involved in Transaction
CREATE TABLE Ticket_Transaction (
    TSID VARCHAR(20),
    TicketNo VARCHAR(20),
    PRIMARY KEY (TSID, TicketNo),
    FOREIGN KEY (TSID) REFERENCES Transaction(TSID),
    FOREIGN KEY (TicketNo) REFERENCES Ticket(TicketNo)
);
