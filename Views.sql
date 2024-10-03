

DROP VIEW TrainAvailability;





CREATE OR REPLACE VIEW TrainAvailability AS
SELECT 
    t.TrainID,
    t.TrainName,
    t.AvailableSeats,
    a.AvailableDays,
    a.ScheduledDate,
    COALESCE((SELECT COUNT(b.BookingID)
              FROM Bookings b
              WHERE b.TrainID = t.TrainID 
              AND b.DateOfJourney = a.ScheduledDate), 0) AS BookedSeats, 
    rs.StartingStationID,
    s1.StationCity AS StartingStationCity,
    rs.EndingStationID,
    s2.StationCity AS EndingStationCity,
    r.RouteDescription AS TrainRoute 
FROM 
    Trains t
INNER JOIN 
    AvailabilitySchedule a ON t.TrainID = a.TrainID
INNER JOIN 
    RouteStations rs ON t.RouteID = rs.RouteID
INNER JOIN 
    Stations s1 ON rs.StartingStationID = s1.StationID
INNER JOIN 
    Stations s2 ON rs.EndingStationID = s2.StationID
INNER JOIN 
    Routes r ON t.RouteID = r.RouteID  -- Joining with Routes table
LEFT JOIN 
    Bookings b ON t.TrainID = b.TrainID AND a.ScheduledDate = b.DateOfJourney
GROUP BY 
    t.TrainID, t.TrainName, t.AvailableSeats, a.AvailableDays, a.ScheduledDate,
    rs.StartingStationID, s1.StationCity, rs.EndingStationID, s2.StationCity,
    r.RouteDescription;  -- Added RouteDescription to GROUP BY clause








SELECT * 
FROM TrainAvailability 
WHERE ScheduledDate BETWEEN  TO_DATE('25/10/2024', 'DD/MM/YYYY')  AND  TO_DATE('29/10/2024', 'DD/MM/YYYY')
AND StartingStationCity = 'Varanasi';







-- BOOKING STATUS

CREATE VIEW BookingStatus AS
SELECT 
    BOOKINGID AS PNRNUMBER, 
    TRAINNAME, 
    DATEOFJOURNEY, 
    BOARDINGSTATIONID, 
    ENDINGSTATIONID, 
    CASE 
        WHEN SeatAlloted = '1' THEN 'Confirmed' 
        ELSE 'Waiting' 
    END AS BookingStatus
FROM BOOKINGS;

