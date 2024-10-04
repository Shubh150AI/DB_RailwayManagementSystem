



----------------------------------------PACKAGE SPECIFICATIONS-----------------------------------------------------


CREATE OR REPLACE PACKAGE TrainUtilities AS
    -- Declare calculate_distance function
    FUNCTION calculate_distance (
        p_trainID            IN INTEGER,
        p_boardingStationID  IN VARCHAR2,
        p_offboardingStationID IN VARCHAR2
    ) RETURN NUMBER;

    -- Declare CalculateFare function
    FUNCTION CalculateFare (
        p_TrainID            IN NUMBER,
        p_BoardingStationID  IN VARCHAR2,
        p_EndingStationID    IN VARCHAR2
    ) RETURN NUMBER;
END TrainUtilities;
/




--------------------------------------------PACKAGE BODY-------------------------------------------



CREATE OR REPLACE PACKAGE BODY TrainUtilities AS
    -- Implement calculate_distance function
    FUNCTION calculate_distance (
        p_trainID            IN INTEGER,
        p_boardingStationID  IN VARCHAR2,
        p_offboardingStationID IN VARCHAR2
    ) RETURN NUMBER IS
        v_routeID           INTEGER;
        v_total_distance    NUMBER := 0;
    BEGIN
        -- Step 1: Find the RouteID for the given TrainID
        SELECT RouteID INTO v_routeID
        FROM Trains
        WHERE TrainID = p_trainID;

        -- Step 2: Calculate distance between the stations
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
            RETURN 0; -- No data found, return 0
    END calculate_distance;

    -- Implement CalculateFare function
    FUNCTION CalculateFare (
        p_TrainID            IN NUMBER,
        p_BoardingStationID  IN VARCHAR2,
        p_EndingStationID    IN VARCHAR2
    ) RETURN NUMBER IS
        v_distance NUMBER;
        v_fare NUMBER;
        v_rate NUMBER := 2.8; -- Fare rate per kilometer
    BEGIN
        -- Call the calculate_distance function to get the distance
        v_distance := calculate_distance(p_TrainID, p_BoardingStationID, p_EndingStationID);

        -- Calculate the fare based on the distance and rate
        v_fare := v_distance * v_rate;

        -- Return the calculated fare
        RETURN v_fare;
    END CalculateFare;
END TrainUtilities;
/





------------------------------------------------- UNIT TESTING ------------------------------------------------







-- Calculate the distance between two stations using the package function
SELECT TrainUtilities.calculate_distance(13452, 'CNB', 'NDLS') AS Distance
FROM dual;




-- Calculate the fare using the package function
SELECT TrainUtilities.CalculateFare(13452, 'CNB', 'NDLS') AS Fare
FROM dual;




SELECT 2.8 * 285 FROM DUAL;