






-------------------------------VIEW  TrainAvailabilityDetails -------------------------



CREATE OR REPLACE VIEW TrainAvailabilityDetails AS
SELECT 
    t.TrainID,
    t.TrainName,
    a.AvailableDays,
    a.ScheduledDate,
    a.RunningStatus,
    a.AvailableSeats AS SeatsAvailable,
    rt.RouteID,
    rt.RouteDescription,
    ts.RouteStationID,
    ts.StartingStationID,
    ts.IntermediateStationID,
    ts.EndingStationID,
    ts.DistanceCovered,
    tt.ArrivalTime,
    tt.DepartureTime
FROM 
    Trains t
INNER JOIN 
    AvailabilitySchedule a ON t.TrainID = a.TrainID
INNER JOIN 
    Routes rt ON t.RouteID = rt.RouteID
INNER JOIN 
    RouteStations ts ON rt.RouteID = ts.RouteID
INNER JOIN 
    TrainTiming tt ON t.TrainID = tt.TrainID AND ts.RouteStationID = tt.RouteStationID;



--TESTING  TrainAvailabilityDetails  VIEW

SELECT *
FROM TrainAvailabilityDetails
WHERE 
    TrainID = 13452
    AND ScheduledDate = TO_DATE('02-OCT-2024', 'DD-MON-YYYY');






--------------CustomerBookingHistory VIEW ----------------




SELECT * FROM BOOKINGS;



CREATE OR REPLACE VIEW CustomerBookingHistory AS (
SELECT 
    b.BookingID,
    b.DateOfJourney,
    b.Fare,
    b.BookingDate,
    b.TrainID,
    t.TrainName,
    s1.StationCity AS BoardingCity,
    s2.StationCity AS EndingCity,
    b.CustomerID  ,
    CASE 
        WHEN b.SeatAlloted = 0 THEN 'Confirmed'
        WHEN b.SeatAlloted = 5 THEN 'WL1'
        WHEN b.SeatAlloted = 4 THEN 'WL2'
        WHEN b.SeatAlloted = 3 THEN 'WL3'
        WHEN b.SeatAlloted = 2 THEN 'WL4'
        WHEN b.SeatAlloted = 1 THEN 'WL5'
        ELSE 'Cancelled' 
    END AS BookingStatus
FROM Bookings b
INNER JOIN Trains t ON b.TrainID = t.TrainID
INNER JOIN Stations s1 ON b.BoardingStationID = s1.StationID
INNER JOIN Stations s2 ON b.EndingStationID = s2.StationID

)



SELECT * FROM CUSTOMERBOOKINGHISTORY 
WHERE BookingID  = 4  AND CustomerID = 'C000009';









COMMIT;





