

------------------------------------- 1 . NEW CUSTOMER SIGNUP  -------------------------------------------



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





------- ADDNEWCUSTOMER PROCEDURE  TESTING----------

BEGIN
    AddNewCustomer(
        p_Email => 'Ayush100@example.com',
        p_PassKey => '123456',
        p_FullName => 'Ayush D',
        p_Age => 24,
        p_Phone => '1230067890', -- Correct phone number length (10 characters)
        p_PaymentAccount => '12345HDFC'
    );
END;
/



SELECT * FROM CUSTOMERS;








---------- 2. CUSTOMER LOGIN   SP ------------------------






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



COMMIT;



--  Calling the Procedure CustomerLogin


DECLARE
    v_customerID VARCHAR2(20); -- Declared the variable to hold the customer ID
BEGIN
    -- Step 1: Call the CustomerLogin procedure
    BEGIN
        CustomerLogin('Ayush100@example.com', '123456', v_customerID);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Login failed: ' || SQLERRM);
            RETURN;
    END;

    -- Step 2: If login is successful, print the CustomerID
    DBMS_OUTPUT.PUT_LINE('Login successful. CustomerID: ' || v_customerID);
END;












------------------------------------ 3. CheckTrainAvailability SP --------------------------

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








SET SERVEROUTPUT ON;

DECLARE
    v_message VARCHAR2(500); -- Variable to hold the availability message
BEGIN
    -- Call the CheckTrainAvailability procedure
    CheckTrainAvailability(
        p_trainID => 13452,
        p_boardingStationID => 'BSB',
        p_endingStationID => 'NDLS',
        p_dateOfJourney => TO_DATE('2024-10-10', 'YYYY-MM-DD'),
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







---------------------------------- 4. CREATE BOOKING PROCEDURE -------------------------------


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
    -- Step 1: Call the CustomerLogin procedure (P)
    CustomerLogin(p_email, p_passkey, v_customerID);

    -- Step 2: Check train availability (P)
    CheckTrainAvailability(p_trainID, p_boardingStationID, p_endingStationID, p_dateOfJourney, v_message);
    DBMS_OUTPUT.PUT_LINE(v_message);

    -- Extract available seats from AvailabilitySchedule for the selected train and date
    SELECT AvailableSeats INTO v_availableSeats
    FROM AvailabilitySchedule
    WHERE TrainID = p_trainID
      AND ScheduledDate = p_dateOfJourney;


-- Step 3: Check if seats are available
IF v_availableSeats > 0 THEN
    IF v_availableSeats > 5 THEN
        v_seatAlloted := 0; -- Assign 0 when more than 5 seats are available
        v_availableSeats := v_availableSeats - 1; -- Deduct one seat from available seats
        DBMS_OUTPUT.PUT_LINE('Seat Allotted: ' || v_seatAlloted); -- Inform about the seat allotted

    ELSIF v_availableSeats <= 5 THEN
        v_seatAlloted := v_availableSeats; -- Assign the current number of available seats
        v_availableSeats := v_availableSeats - 1; -- Deduct one seat from available seats
        DBMS_OUTPUT.PUT_LINE('Seat Allotted: ' || v_seatAlloted); -- Inform about the seat allotted
    END IF;

    -- Update the available seats in AvailabilitySchedule
    UPDATE AvailabilitySchedule
    SET AvailableSeats = v_availableSeats
    WHERE TrainID = p_trainID
      AND ScheduledDate = p_dateOfJourney;

ELSIF v_availableSeats = 0 THEN
    v_seatAlloted := 0; -- No seat available
    DBMS_OUTPUT.PUT_LINE('Sorry for the inconvenience, all seats are full. Please try another train.'); 
    RETURN; -- Exit procedure

ELSIF v_availableSeats < 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error: All seats are booked. Please look for another train.'); 
    RETURN; -- Exit procedure
END IF;

    -- Step 4: Calculate distance and fare  (FN)
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




BEGIN
    CreateBooking(
        p_email => 'Shubham26@example.com',
        p_passkey => 'Shubham123',
        p_boardingStationID => 'BSB',
        p_endingStationID => 'NDLS',
        p_dateOfJourney => TO_DATE('2024-10-02', 'YYYY-MM-DD'),
        p_passengerFullName => 'John Doe',
        p_gender => 'M',
        p_age => 30,
        p_paymentStatus => '1',
        p_trainID => 13452,
        p_transactionID => 'TXN123'
    );
END;


SELECT * FROM AvailabilitySchedule
WHERE TrainID = 13452 AND ScheduledDate = TO_DATE('02-OCT-2024', 'DD-MON-YYYY');



SELECT * FROM CUSTOMERBOOKINGHISTORY;


update   AvailabilitySchedule 
set AvailableSeats = 15
WHERE TrainID = 13452 AND ScheduledDate = TO_DATE('02-OCT-2024', 'DD-MON-YYYY');





BEGIN
    CreateBooking(
        p_email => 'Shubham26@example.com',
        p_passkey => 'Shubham123',
        p_boardingStationID => 'BSB',
        p_endingStationID => 'NDLS',
        p_dateOfJourney => TO_DATE('2024-10-02', 'YYYY-MM-DD'),
        p_passengerFullName => 'John Doe',
        p_gender => 'M',
        p_age => 30,
        p_paymentStatus => '1',
        p_trainID => 13452,
        p_transactionID => 'TXN123'
    );
END;




SELECT * FROM CUSTOMERS






COMMIT;







-------------------------- 5. CancelBooking   PROC ------------------------------------------



CREATE OR REPLACE PROCEDURE CancelBooking (
    p_email IN VARCHAR2,
    p_passkey IN VARCHAR2,
    p_bookingID IN NUMBER
) AS
    v_customerID VARCHAR2(20);
    v_fare DECIMAL(10, 3);
    v_seatAlloted INT;
    v_availableSeats INT;
    v_cancellationAmount DECIMAL(10, 3);
    v_refundAmount DECIMAL(10, 3);
    v_transactionID VARCHAR2(70);
    v_availabilityDate DATE;

    -- Exception for non-existent booking
    e_no_booking EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_no_booking, -20002);  -- Custom error code for no booking found

BEGIN
    -- Step 1: Validate Customer and fetch CustomerID
    CustomerLogin(p_email, p_passkey, v_customerID);
    
    -- Step 2: Fetch details from Bookings table
    SELECT Fare, SeatAlloted, TransactionID, DateOfJourney
    INTO v_fare, v_seatAlloted, v_transactionID, v_availabilityDate
    FROM Bookings
    WHERE BookingID = p_bookingID;

    -- Step 3: Update SeatAlloted and handle AvailabilitySchedule
    IF v_seatAlloted = 0 THEN
        -- If seat was confirmed, increment available seats
        UPDATE AvailabilitySchedule
        SET AvailableSeats = AvailableSeats + 1
        WHERE TrainID = (SELECT TrainID FROM Bookings WHERE BookingID = p_bookingID)
        AND ScheduledDate = v_availabilityDate;
    END IF;

    -- Update SeatAlloted to -1 (canceled)
    UPDATE Bookings
    SET SeatAlloted = -1
    WHERE BookingID = p_bookingID;

    -- Step 4: Calculate cancellation amount and refund amount
    v_cancellationAmount := v_fare * 0.20;
    v_refundAmount := v_fare - v_cancellationAmount;

    -- Step 5: Insert into Cancelation table
    INSERT INTO Cancelation (BookingID, CancellationDate, CancellationAmt, RefundAmt, TransactionID, TransferStatus)
    VALUES (p_bookingID, SYSTIMESTAMP, v_cancellationAmount, v_refundAmount, v_transactionID, '1');

    -- Commit the transaction
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Cancellation successful. Refund Amount: ' || v_refundAmount);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'No booking found for the given BookingID');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error occurred: ' || SQLERRM);
END;


COMMIT;


SELECT * FROM CUSTOMERS;



DECLARE
    v_email VARCHAR2(100) := 'Shubham26@example.com';  -- Customer's email
    v_passkey VARCHAR2(100) := 'Shubham123';               -- Customer's password
    v_bookingID NUMBER := 1;                         -- Booking ID to be canceled (replace with actual ID)
BEGIN
    -- Call the CancelBooking procedure
    CancelBooking(v_email, v_passkey, v_bookingID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Cancellation failed: ' || SQLERRM);
END;
/


COMMIT;






SELECT * FROM CUSTOMERBOOKINGHISTORY;

SELECT * FROM AvailabilitySchedule
WHERE TrainID = 13452 AND ScheduledDate = TO_DATE('02-OCT-2024', 'DD-MON-YYYY');








