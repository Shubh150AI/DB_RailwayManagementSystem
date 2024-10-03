

---------------- NEW CUSTOMER  SIGNUP SP --------------------------



CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_Email           IN VARCHAR2,
    p_PassKey         IN VARCHAR2,
    p_FullName        IN VARCHAR2,
    p_Age             IN INTEGER,
    p_Phone           IN CHAR,
    p_PaymentAccount  IN VARCHAR2 DEFAULT NULL
)
AS
    v_CustomerID VARCHAR2(10); -- Variable to hold the generated CustomerID
BEGIN
    -- Generate the numeric part from the sequence and format it with leading zeros
    v_CustomerID := 'C' || LPAD(CustomerSeq.NEXTVAL, 6, '0');
    
    -- Insert the new customer into the Customers table
    INSERT INTO Customers (CustomerID, Email, PassKey, FullName, Age, Phone, PaymentAccount)
    VALUES (
        v_CustomerID,      
        p_Email,
        p_PassKey,
        p_FullName,
        p_Age,
        p_Phone,
        p_PaymentAccount
    );

    -- Commit the transaction to make sure changes are saved
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('New customer account created successfully with CustomerID: ' || v_CustomerID);
EXCEPTION
    -- Handle cases where a unique constraint violation occurs for Email or Phone
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Email or Phone already exists.');
    -- Handle other errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END AddNewCustomer;
/





-- ADDNEWCUSTOMER PROC TESTING

BEGIN
    AddNewCustomer(
        p_Email => 'Shubham26@example.com',
        p_PassKey => 'Shubham123',
        p_FullName => 'Shubham C',
        p_Age => 24,
        p_Phone => '1234567890', -- Correct phone number length (10 characters)
        p_PaymentAccount => '123456PNB'
    );
END;
/









---------- CUSTOMER LOGIN   SP------------------------






CREATE OR REPLACE PROCEDURE CustomerLogin (
    p_email IN VARCHAR2,
    p_passkey IN VARCHAR2,
    p_customerID OUT VARCHAR2
) AS
    v_customerCount INTEGER;
BEGIN
    -- Step 1: Check if the customer exists
    SELECT COUNT(*)
    INTO v_customerCount
    FROM Customers
    WHERE Email = p_email
      AND PassKey = p_passkey;

    -- Step 2: If customer exists, fetch CustomerID
    IF v_customerCount = 1 THEN
        SELECT CustomerID
        INTO p_customerID
        FROM Customers
        WHERE Email = p_email
          AND PassKey = p_passkey;
    ELSE
        -- If customer doesn't exist, raise an error
        RAISE_APPLICATION_ERROR(-20001, 'Invalid Email or Password');
    END IF;
END;






DECLARE
    v_customerID VARCHAR2(20); -- Declare the variable to hold the customer ID
BEGIN
    -- Step 1: Call the CustomerLogin procedure
    BEGIN
        CustomerLogin('Shubham26@example.com', 'Shubham123', v_customerID);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Login failed: ' || SQLERRM);
            RETURN;
    END;

    -- Step 2: If login is successful, print the CustomerID
    DBMS_OUTPUT.PUT_LINE('Login successful. CustomerID: ' || v_customerID);
END;





DROP PROCEDURE CUSTOMERBOOKING







------------------------------------  CheckTrainAvailability SP --------------------------

CREATE OR REPLACE PROCEDURE CheckTrainAvailability (
    p_trainID IN INTEGER,
    p_boardingStationID IN VARCHAR2,
    p_endingStationID IN VARCHAR2,
    p_dateOfJourney IN DATE,
    p_message OUT VARCHAR2 -- To hold the availability message
) AS
    v_availableSeats INTEGER;
BEGIN
    -- Check availability for the given train and journey date
    SELECT AvailableSeats 
    INTO v_availableSeats
    FROM AvailabilitySchedule
    WHERE TrainID = p_trainID
      AND ScheduledDate = p_dateOfJourney;

    -- Determine if seats are available and prepare the message
    IF v_availableSeats > 0 THEN
        p_message := 'The train ID ' || p_trainID || 
                     ' is available on ' || TO_CHAR(p_dateOfJourney, 'YYYY-MM-DD') || 
                     ' from ' || p_boardingStationID || 
                     ' to ' || p_endingStationID || 
                     '.';
    ELSE
        p_message := 'The train ID ' || p_trainID || 
                     ' is not available on ' || TO_CHAR(p_dateOfJourney, 'YYYY-MM-DD') || 
                     ' from ' || p_boardingStationID || 
                     ' to ' || p_endingStationID || 
                     '.';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_message := 'Train not found for the specified date and stations.';
    WHEN OTHERS THEN
        p_message := 'Error: ' || SQLERRM;
END;
/








SET SERVEROUTPUT ON; -- Enable output for DBMS_OUTPUT

DECLARE
    v_message VARCHAR2(500); -- Variable to hold the availability message
BEGIN
    -- Call the CheckTrainAvailability procedure
    CheckTrainAvailability(
        p_trainID => 13452,
        p_boardingStationID => 'CNB',
        p_endingStationID => 'NDLS',
        p_dateOfJourney => TO_DATE('2024-10-02', 'YYYY-MM-DD'),
        p_message => v_message
    );

    -- Output the result
    DBMS_OUTPUT.PUT_LINE(v_message);
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/















CREATE OR REPLACE PROCEDURE CreateBooking (
    p_email IN VARCHAR2,
    p_passkey IN VARCHAR2,
    p_boardingStationID IN VARCHAR2,
    p_endingStationID IN VARCHAR2,
    p_dateOfJourney IN DATE,
    p_passengerFullName IN VARCHAR2,
    p_gender IN CHAR,
    p_age IN INTEGER,
    p_paymentStatus IN CHAR,
    p_trainID IN INTEGER,
    p_transactionID IN VARCHAR2
) AS
    v_customerID VARCHAR2(20);
    v_message VARCHAR2(500);
    v_distance NUMBER;
    v_fare NUMBER;
    v_availableSeats INTEGER;
    v_seatAlloted CHAR(1);
BEGIN
    -- Step 1: Call the CustomerLogin procedure
    CustomerLogin(p_email, p_passkey, v_customerID);

    -- Step 2: Check train availability
    CheckTrainAvailability(p_trainID, p_boardingStationID, p_endingStationID, p_dateOfJourney, v_message);
    DBMS_OUTPUT.PUT_LINE(v_message);

    -- Extract available seats from AvailabilitySchedule for the selected train and date
    SELECT AvailableSeats INTO v_availableSeats
    FROM AvailabilitySchedule
    WHERE TrainID = p_trainID
      AND ScheduledDate = p_dateOfJourney;

    -- Step 3: Check if seats are available
    IF v_availableSeats > 0 THEN
        v_seatAlloted := '1'; -- Allot a seat
        v_availableSeats := v_availableSeats - 1; -- Deduct one seat from available seats

        -- Update the available seats in AvailabilitySchedule
        UPDATE AvailabilitySchedule
        SET AvailableSeats = v_availableSeats
        WHERE TrainID = p_trainID
          AND ScheduledDate = p_dateOfJourney;

    ELSIF v_availableSeats = 0 THEN
        v_seatAlloted := '0'; -- No seat available
        DBMS_OUTPUT.PUT_LINE('All seats are booked. Please look for another train.');
        RETURN; -- Exit procedure

    ELSIF v_availableSeats < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: All seats are booked. Please look for another train.');
        RETURN; -- Exit procedure
    END IF;

    -- Step 4: Calculate distance and fare
    v_distance := calculate_distance(p_trainID, p_boardingStationID, p_endingStationID);
    v_fare := CalculateFare(p_trainID, p_boardingStationID, p_endingStationID);

    -- Step 5: Insert booking into the Bookings table
    INSERT INTO Bookings (
        PassengerFullName,
        CustomerID,
        BookingDate,
        BoardingStationID,
        EndingStationID,
        Fare,
        DateOfJourney,
        Gender,
        Age,
        PaymentStatus,
        TrainID,
        TrainName,
        TransactionID,
        SeatAlloted
    ) VALUES (
        p_passengerFullName,
        v_customerID,
        SYSDATE,
        p_boardingStationID,
        p_endingStationID,
        v_fare,
        p_dateOfJourney,
        p_gender,
        p_age,
        p_paymentStatus,
        p_trainID,
        (SELECT TrainName FROM Trains WHERE TrainID = p_trainID), -- Assuming you have TrainName in Trains table
        p_transactionID,
        v_seatAlloted
    );

    DBMS_OUTPUT.PUT_LINE('Booking successful. Booking details:');
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customerID);
    DBMS_OUTPUT.PUT_LINE('Train ID: ' || p_trainID);
    DBMS_OUTPUT.PUT_LINE('Fare: ' || v_fare);
    DBMS_OUTPUT.PUT_LINE('Seat Alloted: ' || v_seatAlloted);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;












SET SERVEROUTPUT ON; 

DECLARE
    v_email VARCHAR2(100) := 'Shubham26@example.com';
    v_passkey VARCHAR2(100) := 'Shubham123';
    v_boardingStationID VARCHAR2(5) := 'CNB';
    v_endingStationID VARCHAR2(5) := 'NDLS';
    v_dateOfJourney DATE := TO_DATE('2024-10-02', 'YYYY-MM-DD');
    v_passengerFullName VARCHAR2(100) := 'Shubham Gupta';
    v_gender CHAR := 'M';
    v_age INTEGER := 25;
    v_paymentStatus CHAR := '1'; -- Assuming '1' is for paid
    v_trainID INTEGER := 13452;
    v_transactionID VARCHAR2(70) := 'TXN12345';
BEGIN
    CreateBooking(
        p_email => v_email,
        p_passkey => v_passkey,
        p_boardingStationID => v_boardingStationID,
        p_endingStationID => v_endingStationID,
        p_dateOfJourney => v_dateOfJourney,
        p_passengerFullName => v_passengerFullName,
        p_gender => v_gender,
        p_age => v_age,
        p_paymentStatus => v_paymentStatus,
        p_trainID => v_trainID,
        p_transactionID => v_transactionID
    );
END;



COMMIT;
SELECT * FROM BOOKINGS;

SELECT * FROM AvailabilitySchedule
WHERE  SCHEDULEDDATE = TO_DATE('2024-10-02', 'YYYY-MM-DD')  AND TRAINID = 13452 ;