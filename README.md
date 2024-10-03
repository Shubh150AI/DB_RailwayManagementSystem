# Railway Booking System

**Overview**

This Railway Booking System is designed to manage train schedules, routes, stations, customer bookings, and cancellations. The system includes various tables to store information about routes, stations, customers, trains, bookings, cancellations, and availability schedules. 

**Key Features:**

1. **Multiple Trains on the Same Route**: Many trains can run on the same route, allowing for flexibility in scheduling.
2. **No RAC Concept**: There is no concept of Reservation Against Cancellation (RAC) in our system.
3. **Booking and Cancellation Rules**: Tickets can be booked and canceled only if seats and waiting list thresholds allow.
4. **Multiple Intermediate Stations**: Each train will have multiple intermediate stations, depending on the routes defined.
5. **Fare Calculation**: The fare is set at **2.8 rupees/km**.
6. **Seating Options**: Currently, we do not allow multiple seating options and coaches (like 3AC, 2AC, 1AC). Each train schedule will have **only 10 seats** available.
7. **Train Number Format**: The train number will have the last three digits as the RouteID.
8. **Distance Calculation**: The distance between two stations depends on the route and is calculated accordingly.
9. **Mandatory Customer Registration**: Customer registration is mandatory to book a seat successfully.
10. **Multiple Ticket Booking**: Customers can book multiple tickets using the same CustomerID and can cancel them at any time before the train's departure.

## Database Schema

The following tables are included in the database schema:

1. **Routes Table**: 
   - **RouteID**: Unique identifier for the route.
   - **RouteDescription**: Description of the route.

2. **Stations Table**: 
   - **StationID**: Unique identifier for the station.
   - **StationCity**: Name of the city where the station is located.

3. **Customers Table**: 
   - **CustomerID**: Unique identifier for the customer.
   - **Email**: Email address of the customer (unique).
   - **PassKey**: Password for customer authentication.
   - **FullName**: Full name of the customer.
   - **Age**: Age of the customer.
   - **Phone**: Phone number of the customer (unique).
   - **PaymentAccount**: Payment account details.

4. **Trains Table**: 
   - **TrainID**: Unique identifier for the train.
   - **TrainName**: Name of the train.
   - **AvailableSeats**: Number of seats available on the train.
   - **RouteID**: Reference to the route associated with the train.

5. **RouteStations Table**: 
   - **RouteStationID**: Unique identifier for the route station.
   - **RouteID**: Reference to the associated route.
   - **StartingStationID**: Starting station for the route.
   - **IntermediateStationID**: Intermediate station along the route.
   - **EndingStationID**: Ending station for the route.
   - **DistanceCovered**: Distance covered by this segment of the route.

6. **Bookings Table**: 
   - **BookingID**: Unique identifier for the booking.
   - **PassengerFullName**: Full name of the passenger.
   - **CustomerID**: Reference to the customer making the booking.
   - **BookingDate**: Date of booking.
   - **BoardingStationID**: ID of the boarding station.
   - **EndingStationID**: ID of the ending station.
   - **Fare**: Fare for the journey.
   - **DateOfJourney**: Date of the journey.
   - **Gender**: Gender of the passenger.
   - **Age**: Age of the passenger.
   - **PaymentStatus**: Payment status of the booking.
   - **TrainID**: Reference to the train.
   - **TrainName**: Name of the train.
   - **TransactionID**: Unique identifier for the transaction.
   - **SeatAlloted**: Seat allocation status.

7. **Cancellation Table**: 
   - **CancellationID**: Unique identifier for the cancellation.
   - **BookingID**: Reference to the associated booking.
   - **CancellationDate**: Date of cancellation.
   - **CancellationAmt**: Amount refunded upon cancellation.

8. **AvailabilityTimingBridge Table**: 
   - **TimingID**: Unique identifier for timing information.

9. **AvailabilitySchedule Table**: 
   - **AvailabilityKey**: Unique key for availability records.
   - **TrainID**: Reference to the train.
   - **TimingID**: Reference to the timing information.
   - **AvailableDays**: Days on which the train is available.
   - **ScheduledDate**: Date of the schedule.
   - **RunningStatus**: Status of the train operation.
   - **AvailableSeats**: Number of seats available on the scheduled date.

10. **TrainSchedule Table**: 
    - **TrainTimingID**: Unique identifier for train timings.
    - **TimingID**: Reference to the timing information.
    - **RouteStationID**: Reference to the associated route station.
    - **ArrivalTime**: Scheduled arrival time.
    - **DepartureTime**: Scheduled departure time.
   
## ER - Diagram

![FinalERD](https://github.com/user-attachments/assets/5d7a5a3a-bbc0-4114-8679-c6daf3577a75)


## Stored Procedures

1. **AddNewCustomer**: 
   - **Purpose**: To add a new customer to the system.
   - **Inputs**: Email, PassKey, FullName, Age, Phone, PaymentAccount.
   - **Outputs**: Confirmation message with CustomerID.

2. **CustomerLogin**: 
   - **Purpose**: To authenticate a customer during login.
   - **Inputs**: Email, PassKey.
   - **Outputs**: CustomerID if login is successful; error message otherwise.

3. **CheckTrainAvailability**: 
   - **Purpose**: To check the availability of a train on a specified date.
   - **Inputs**: TrainID, BoardingStationID, EndingStationID, DateOfJourney.
   - **Outputs**: Availability message.

4. **CreateBooking**: 
   - **Purpose**: To create a new booking for a passenger.
   - **Inputs**: Customer email and password, boarding and ending station IDs, date of journey, passenger details, payment status, train ID, and transaction ID.
   - **Outputs**: Confirmation of booking with details.

## Functions

1. **calculate_distance**: 
   - **Purpose**: To calculate the distance between the boarding and ending stations based on the train's route.
   - **Inputs**: TrainID, BoardingStationID, OffboardingStationID.
   - **Outputs**: Total distance.

2. **CalculateFare**: 
   - **Purpose**: To calculate the fare based on the distance and fare rate per kilometer.
   - **Inputs**: TrainID, BoardingStationID, EndingStationID.
   - **Outputs**: Calculated fare.

## Views

1. **TrainAvailability**: 
   - **Purpose**: To provide a summary of train availability along with booking details.
   - **Fields**: TrainID, TrainName, AvailableSeats, AvailableDays, ScheduledDate, BookedSeats, StartingStationID, EndingStationID, TrainRoute.

2. **BookingStatus**: 
   - **Purpose**: To show the status of bookings (confirmed or waiting).
   - **Fields**: PNRNUMBER, TrainName, DateOfJourney, BoardingStationID, EndingStationID, BookingStatus.

## Testing

The procedures and functions can be tested using PL/SQL blocks with example input values. Ensure the database is set up correctly and all tables are populated with necessary data before running tests.
## Adding New customer :

![image](https://github.com/user-attachments/assets/22725d45-ffa4-4cab-bf01-9ccf795fad1a)

## Check train availability  :
![image](https://github.com/user-attachments/assets/226195a6-2b8c-4691-a95d-948ec53a0abc)

## Create a booking :

![image](https://github.com/user-attachments/assets/f5a09a05-1afe-40ef-9984-2f8962cc8f9d)




## Conclusion

This Railway Booking System provides an efficient way to manage train services and customer bookings. By utilizing stored procedures, functions, and views, the system ensures that all operations are executed smoothly and efficiently.
