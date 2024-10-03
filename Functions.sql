


----------------------------- Distance calculation function --------------------------------



CREATE OR REPLACE FUNCTION calculate_distance (
    p_trainID            IN INTEGER,
    p_boardingStationID  IN VARCHAR2,
    p_offboardingStationID IN VARCHAR2
) RETURN NUMBER
IS
    v_routeID           INTEGER;
    v_total_distance    NUMBER := 0;
BEGIN
    -- Step 1: Find the RouteID for the given TrainID
    SELECT RouteID INTO v_routeID
    FROM Trains
    WHERE TrainID = p_trainID;

    -- Step 2: Sum the distance between the boarding and offboarding stations
    -- using the RouteStations table
    SELECT SUM(DistanceCovered) INTO v_total_distance
    FROM RouteStations
    WHERE RouteID = v_routeID
      AND ((StartingStationID = p_boardingStationID AND EndingStationID = p_offboardingStationID)
           OR (StartingStationID = p_boardingStationID AND IntermediateStationID = p_offboardingStationID)
           OR (IntermediateStationID = p_boardingStationID AND EndingStationID = p_offboardingStationID)
           OR (IntermediateStationID = p_boardingStationID AND IntermediateStationID = p_offboardingStationID));

    RETURN v_total_distance;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If no data is found, return 0 or handle the exception
        RETURN 0;
END;




SELECT calculate_distance(13452, 'CNB', 'NDLS') FROM dual;












-------------------------------------- Calculate Fare Functions -----------------------------



CREATE OR REPLACE FUNCTION CalculateFare(
    p_TrainID NUMBER,
    p_BoardingStationID VARCHAR2,
    p_EndingStationID VARCHAR2
)
RETURN NUMBER
AS
    v_distance NUMBER;
    v_fare NUMBER;
    v_rate NUMBER := 2.8; -- Fare rate per kilometer
BEGIN
    -- Call the pre-existing calculate_distance function to get the distance
    v_distance := calculate_distance(p_TrainID, p_BoardingStationID, p_EndingStationID);
    
    -- Calculate the fare based on the distance and rate
    v_fare := v_distance * v_rate;
    
    -- Return the calculated fare
    RETURN v_fare;
END;
/





-- Test the function
SELECT CalculateFare(13452, 'CNB', 'NDLS') AS Fare
FROM dual;


COMMIT;