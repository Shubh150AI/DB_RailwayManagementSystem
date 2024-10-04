

------------------------ Trigger to log actions on the Bookings table---------------------------------------


CREATE OR REPLACE TRIGGER trg_financial_audit_bookings
AFTER INSERT OR UPDATE ON Bookings   -- Trigger fires after insert or update on Bookings table
FOR EACH ROW                         -- Trigger fires for each row affected
DECLARE
    v_amount DECIMAL(10, 3); -- Variable to hold the fare amount
BEGIN
    -- Check if the SeatAlloted is not -1 (indicating a valid booking)
    IF :NEW.SeatAlloted != -1 THEN
        v_amount := :NEW.Fare; -- Get the fare amount from the new row

        -- If a new booking is being created
        IF INSERTING THEN
            INSERT INTO FinancialAudit (BookingID, TransactionType, Amount, Notes)
            VALUES (:NEW.BookingID, 'CREATE', v_amount, 'Booking Created'); -- Log creation of the booking
        -- If an existing booking is being updated
        ELSIF UPDATING THEN
            INSERT INTO FinancialAudit (BookingID, TransactionType, Amount, Notes)
            VALUES (:NEW.BookingID, 'UPDATE', v_amount, 'Booking Updated'); -- Log update of the booking
        END IF;
    END IF;
END;
/






----------------------------   Trigger to log actions on the Cancellation table  ----------------------



CREATE OR REPLACE TRIGGER trg_financial_audit_cancellation
AFTER INSERT ON Cancelation -- Trigger fires after insert on Cancellation table
FOR EACH ROW -- Trigger fires for each row affected
BEGIN
    -- Insert a new record into FinancialAudit for each cancellation
    INSERT INTO FinancialAudit (CancellationID, TransactionType, Amount, RefundAmount, Notes)
    VALUES (:NEW.CancellationID, 'CREATE', -:NEW.CancellationAmt, :NEW.RefundAmt, 'Ticket Cancelled'); -- Log cancellation details
END;
/



COMMIT;










--------------------------------- TRIGGER UNIT TESTING ------------------------------------

--Create a booking 

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



SELECT * FROM FINANCIALAUDIT;





--------Cancelling a preexisting Booking

DECLARE
    v_email VARCHAR2(100) := 'Shubham26@example.com';  -- Customer's email
    v_passkey VARCHAR2(100) := 'Shubham123';           -- Customer's password
    v_bookingID NUMBER := 2;                         -- Booking ID to be canceled 
BEGIN
    -- Call the CancelBooking procedure
    CancelBooking(v_email, v_passkey, v_bookingID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Cancellation failed: ' || SQLERRM);
END;
/





SELECT * FROM FINANCIALAUDIT;