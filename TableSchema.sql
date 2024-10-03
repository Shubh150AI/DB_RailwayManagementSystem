

-- 1. Routes Table      
CREATE TABLE Routes (
    RouteID               INTEGER        PRIMARY KEY,
    RouteDescription      VARCHAR2(255)
);








-- 2. Stations Table   
CREATE TABLE Stations (
    StationID             VARCHAR2(5)    PRIMARY KEY,
    StationCity           VARCHAR2(50)   NOT NULL
);





-- 3. Customers Table     
CREATE TABLE Customers (
    CustomerID            VARCHAR2(20)        PRIMARY KEY,
    Email                 VARCHAR2(50)   UNIQUE,
    PassKey               VARCHAR2(20)   NOT NULL,
    FullName              VARCHAR2(100)  NOT NULL,
    Age                   INTEGER        NOT NULL,
    Phone                 CHAR(10)       UNIQUE NOT NULL,
    PaymentAccount        VARCHAR2(100)
);





-- 4. Trains Table    
CREATE TABLE Trains (
    TrainID               INTEGER        PRIMARY KEY,
    TrainName             VARCHAR2(60)   NOT NULL,
    AvailableSeats        INTEGER,
    RouteID               INTEGER,

    CONSTRAINT fk_routeid FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);





-- 5. RouteStations Table    
CREATE TABLE RouteStations (
    RouteStationID        INTEGER        PRIMARY KEY,
    RouteID               INTEGER,
    StartingStationID     VARCHAR2(5)    NOT NULL,
    IntermediateStationID VARCHAR2(5),
    EndingStationID       VARCHAR2(5)    NOT NULL,
    DistanceCovered       INTEGER        NOT NULL,

    CONSTRAINT fk_route_id FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
    CONSTRAINT fk_start_station FOREIGN KEY (StartingStationID) REFERENCES Stations(StationID),
    CONSTRAINT fk_intermediate_station FOREIGN KEY (IntermediateStationID) REFERENCES Stations(StationID),
    CONSTRAINT fk_end_station FOREIGN KEY (EndingStationID) REFERENCES Stations(StationID)
);







-- 6. Bookings Table    

CREATE TABLE Bookings (
    BookingID             NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    PassengerFullName     VARCHAR2(100),
    CustomerID            VARCHAR2(20) ,
    BookingDate           DATE           NOT NULL,
    BoardingStationID     VARCHAR2(5)    NOT NULL,
    EndingStationID       VARCHAR2(5)    NOT NULL,
    Fare                  DECIMAL(10, 3),
    DateOfJourney         DATE           NOT NULL,
    Gender                CHAR(1)        NOT NULL,
    Age                   INTEGER        CHECK (Age >= 0) NOT NULL,
    PaymentStatus         CHAR(1)        CHECK (PaymentStatus IN ('1', '0')),
    TrainID               INTEGER,
    TrainName             VARCHAR2(50),
    TransactionID         VARCHAR2(70),
    SeatAlloted           INT,

    CONSTRAINT fk_b_stationid FOREIGN KEY (BoardingStationID) REFERENCES Stations(StationID),
    CONSTRAINT fk_e_stationid FOREIGN KEY (EndingStationID) REFERENCES Stations(StationID),
    CONSTRAINT fk_customerid FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT fk_trainid FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);




-- 7. Cancellation Table  y

Create table Cancelation (

    CancellationID        NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    BookingID             NUMBER ,
    CancellationDate      TIMESTAMP,
    CancellationAmt       DECIMAL,
    RefundAmt             DECIMAL,
    TransactionID         VARCHAR2(70),
    TransferStatus        CHAR(1),

    CONSTRAINT fk_bookingCanclation FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)


)



-- 8. Audit -- ON THE WAY TO DEVELOP






-- 9.. AvailabilitySchedule Table 

CREATE TABLE AvailabiltySchedule (
    AvailabilityKey       INTEGER PRIMARY KEY,
    TrainID               INTEGER,
    AvailableDays         CHAR(3),
    ScheduledDate         DATE,
    RunningStatus         CHAR(1),
    AvailableSeats        INT,

    CONSTRAINT fk_train_id_fk      FOREIGN KEY (TrainID)  REFERENCES Trains(TrainID)
);






-- 10. TrainTiming Table   

CREATE TABLE TrainTiming (
    
    TrainTimingID         NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    TrainID               INTEGER,
    RouteStationID        INTEGER,
    ArrivalTime           TIMESTAMP,
    DepartureTime         TIMESTAMP,

    CONSTRAINT fk_route_station11 FOREIGN KEY (RouteStationID) REFERENCES RouteStations(RouteStationID),
    CONSTRAINT fk_trainid11 FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);





COMMIT;



