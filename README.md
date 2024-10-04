
![The Railway Man](https://github.com/user-attachments/assets/c7a0ed59-763a-491a-9a71-9d793a43aae6)

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
11. **WaitingPolicy** : If any ticket is cancelled and seat is available the ticket will be alotted to the earlier Waiting list PNR.

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

[FinalERD](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=TrainMgmtERD.drawio#R%3Cmxfile%3E%3Cdiagram%20id%3D%22C5RBs43oDa-KdzZeNtuy%22%20name%3D%22Page-1%22%3E7V1dd5s4E%2F41OWf3Ij18Yy4dx0nTJmkaJ23fq%2FdQG8dsMGQxjuv%2B%2BhU2wiDJIGTEV9mzZxdkBWzNo9HMM6PRmTxa%2Frr2zbfFnTeznDNJmP06ky%2FPJEmSNQH8L2zZ7ltEQVH2LS%2B%2BPYvaDg0T%2B7cFO0ata3tmrVIdA89zAvst3Tj1XNeaBqk20%2Fe9Tbrb3HPSb30zXyysYTI1Hbz1uz0LFvCHydrhg4%2BW%2FbKArxbU6AcuTdg7%2BimrhTnzNokmeXwmj3zPC%2FZXy18jywmHDw7M95vtd%2Bf2Vbv%2B9HX1r%2Fl88fnp%2Ftv5%2FmFXRf4k%2Fg2%2B5QbMj%2F79Or%2F6%2BE3558fbw9XXjXA9%2FPnpPPoT4d101tGAPfmm7a6iXxxs4TiuNvbSMV1wdzH33GASfQIG4cJ07BcXXE%2FBt7N80PBu%2BYENRDCMPgi8N9A6XdjO7NbceuvwN6wCc%2FoK7y4Wnm%2F%2FBo81HfCRCBrAx34QoUnSUj0m4V%2BCZgG0%2BtYK9HmAAyPGTbfmKoj6TD3HMd9W9s%2FdFw67LE3%2FxXYvvCDwlvBB3tqdWbPoLpb07ibwvdcYPOHfU4ojEls4GtavBBoj8Vxb3tIK%2FC3oEn06ECJxRJNNVaL7zQG5MuyzSIIWTlMzmi0v8bPj1z2C2WW6L2AQ4veJRvp9hNfFT06%2BTtLSbzMdIHfXDKyLcBRXSRSCi8QvPTTtsFkApyKG04fPZyPpbAi%2BnrCD7M1lfF%2FZxc390%2Fh6%2FFjOQ6NbZN4B6ASJOeZY8%2BDoDFu9mVPbfbnd9blUDi2PkezCJg%2F87dzZoXthz2aWu0N%2FYAbmfoKEkH%2FzbDfYCVe9AP%2BCbzUSPqhnKvhCI3AvHu7Bv2F3Pxh5LpgoQA7heyww%2BzZWOAMJcyVTD%2BXPlW0ag3lTA8VqcmakQJqByPn4eX4vWO%2FD0fj2xrO3m5E8Ohc1DJKY8Cx3NgzXMHDnejvduQiWUMWlVQ4YHn%2F7I7z5IAwGsOF%2F%2BwZBgQ2Xv5L9L7fJuwfLt8FvC1XwvvGXHcAn6tF9%2BEDxgyBr0f3heeHNNnGDPq2YIIH6frGy%2BkUT2pqllm9c3An5qgTxwjbfcszAfk8v%2Bhna8CFE%2BEETStoHwUj8I6b0IlCCHwxZPXwspZ%2B%2F8tb%2B1IoemVyB0beoqcdKiNLejxn2GAYVSgasigH26jOihB7BcmxVqEmhAu2a1sswJyINUHxK0etGVapON46Mj4NPymIgul%2Bs5f3jxv%2FXd85FCdeNFJjYreP35tIqHW3fho%2Bjj8NH6S9N%2BDtuvP%2FydP98e9uDr1Tw6YPqwEf8xmzYG76bthPKY2KZQA5MKEPMwR5WJcJKFBQ6XMkZrtBpBp%2FCzeATxLTBN5BjC5DN4DMMJWHwgXtJ5mzw7W2gfIOvbYYh5LG26ccWNf1yHlOe6UccU9xV2Rl61CyP0LM85bE8iprGgg4plgSiY98gCekBG8kjp18nD%2FDXNYXl0TGcJliecnyTrnoclNpao0brcZ6FCE5u5tyguDk3BD8vDAtIwp3pvx7rFfsEkqr%2B3Tk8lGqtFUYNwQPlhhqyB8rNWBNFLWmsnYfmm8RirRUb%2B1y7SW%2BW3aSlFh106aJmzNJrFwqX8swmMohKpniheX6yaR7DEfEbDFHkj8RcS19vJWLPB2msKayQRUx9xagWsxhkR%2BsVsIAtv4%2Fp1mHti5qSxoOqE8x9nbQ2wjWsC0FdIlZxpi5h7kPYZlr8Bxsuwev2UVgK7yBTeZzkHRCxLHGy8whmXp6Ix0vTdkoPLKgYAJ%2Fvb74%2BjzsHJVbHohzAKXh0gQw4Xo4FwSTMg8mDuVq9WlsGgGWot%2FsvT%2BC6j1%2BVjjAdjzNUizCcBMvFydXacWjjpjGmRCEdC%2B0qnHgBRYTRp9qQwkKNvZQfXC%2BcC9eDrTjYqC0tXmAzGBa%2BRciIlAGuUGMBhZVv4%2FfQKg4tEllbKbQgY1LMqNouwUAMp1NgLQTH7KbdGtcDgRIIhNSdioGAs1eY9LqdYpElySTxmsWnJInXrH4NIV5bl2JBHFOZF3IR3AqiXg7Fn4W0tiFIT0keI05pEYRkSlQdbcIdvwlYQ2yPfjdWn6dTInOvIMT9gETcDwio7lSeDhmquOeZYO4j1LKm6hwo1T%2FXdNOpwZpBxJOwyc90Y%2FAPI6CM7KAAORrBI0W495n8XEBFcgwrBRVM%2F%2BDgDxjyGZrFw%2BQQFBz8XMsKqtammFZdyOORSnYr25PHk4nFXH8SYrFtoO1IKo90JG2%2FqFfQ5%2FOU6BUgVrqm4lY6uUSDIeTCuOXZPPnZ%2Byd6Bn25hbIcDKmMfQDV7imWCNHOkmzBkuotFBz7fJKtWQmyiCmIKbTGVUEg87QEojZPV1zaYKlzp9YonMwAQTxi4p33ZblpptqrHch%2F%2FMbgTEnmh61ofeOmKcROBK4knLjry8K0gc8rrimrLM1B1pQ4n4dhbRJ6lUBMDL5CMnLQ9eW0ZihRl%2BPghyXpOJYS%2Fx27MzYw9aiqAVVQQdSHKpwqJqHqJmTRltbMNkmkBo6YbpINdaNFpeQkyigJREYLztBeeN4rkEpPztay2VJEmH8ZugxJiJBcAoUxaaM99KycSc9GsK2jiG58cf98d9GzuyVwKHIp7C5pmnBbdxV%2B1XQ5cChGgkMJUweMMsrpZooyl0SBsclcEkXuSRQOypVjcAKJTUgaC3oLwq1tKEKisthqTh2bGKTNh2pRpOBUHMU%2BmNXKcl8sv8ge0MztMuWs6f3Kyx69qHTlhS8rArrIWrwEBmtl1mFqL3zX4FWqJ10chCRimARCbo60SgihUSDjCgxFjQ4L5cXleHRzN7z9KzRRwPAI8lH8bhZ2YE0AGsPmjW%2B%2B8RS6KNQudfxEAqrxBGrny%2FwTWNJdpqoaNBeXw6cxiwubu%2F24WhHLtYuYoV4KuLgGxjKwXZsxf%2FcX%2By3oVOZR01Cg1Y4Chpom8QW%2FkhUlXpRa%2FaJadBi1o4Ohjkl8EdUBCIMwa8ZjGzIu4KRvgqBi57Q2QUEmm0lQ%2FA53yfUY1OMeQ7USVGuXIGEnTBEJuitzekoGd8ZFLC29KdIa1C4t6QRpgYvwKJuh43hBkZzVU5bARshNFuuWm5rB42H5TrUdXplpxzRCkIRij9UKUjlmmVwVrFPLT1v2bFj5uKufDstQ%2FFfJoL3pn5rdlmU2EZzdhjkvCjWHJfESVcZ%2BkoSoTk9DpNQHbRAa6Vjrag0rXGijcIOPsxMPNkh96lYVdfKlSNqFc0GljLndidQtDY%2BOPKSSUvfgdUpQLlEOVtcsCkpdFuuF9myL1QgxFFR6zTmGfJBInBLBA%2BGx5KXnTUFJ5uZN6dFw5Wa8wEnYkIwXZDeuJKjpJ7RjN66Gh4cwB5l3ampHVV6pTlRxxVj7rlyNIeaUXEeLJbc83dyNJ0%2FDu4d%2BzwdXWNW%2BhVFjCFYlYTVcosWqsy%2Bi5JEeU%2FwwVf9eRo0h8bPMaAxN7KVHFyO6at%2FTCOvWNrTkSTd1Gj880e565Ienvkr%2FSS4n9CRb53J2YqsOdPjZUyDmln9KuhG%2FnCIGZTKgdNPQEprlKROc27yyXbD02EDLr2d2gI1Tz8bzZ%2BMlAWHjFThpc1edLKR0go3XccY1zcbvYFttOkBHOSxKvRfrkPbQ9jq%2F%2Fc7VVrPUaY0ZOG2aYswg%2FDlzjeha%2BXMdZ6Mw%2FryM4GCqNEM3HbZSaYLiGql2vlzH%2BfI%2BFNMJaNXOmeun0ZtP27cCkZjEZva%2Fe1XFA0%2F18%2BWwvEOhk4%2BXhINC%2BV2kNv0e3%2FHbY5ARg7Wz6gOGrTSP1hyMGjMSu44pfmipnTOHPFvPmRNFmZ%2BmpbbUzewEZz5gODQBXOyIMI5FYuKkm2w77wRGnUHV0DLqcDdv%2BaqGrZbKvRdY5W%2BgpjfXJVXNsdcrlaNETXhzkyPOMw%2FfTdsxf9pOsJ1MF9ZsHVLofXgE3tR2NLBKCFcQV5XunwI2wIntRJnZGMB2sP18WvGerp4RQanRYu1w0hHBlVaaGxAyck%2BwgQsOVFMMQik1k9lP0Uo%2Fp%2BITVQeZcYcatrR3VRuUSrMU1xmkE6Cr1RkM1HG0yDjWpbk9yaLto1688UUITVSLL6h%2BCx1bH5ne7J7tLgVM7sMTXDBFCk9UDCoWanjtulGFgCKJhTnJhD2GGDFECC9UjCECYUy98IWFn3hxORllnlqLNn44IgQeKsYRgbo9wenqSuABijI38AD5jNzAA%2BzYFD%2BzE4EHA2eTds7lk70EGgMDcs99VsB9CmlEyLSZazFD2Vnu08g8YisB3L5GC%2FsiHKuE9iR7GxxPB6o02dugXQyNZh0PhCR7Y5qoHcneRuZJ3bszuk8pMNdRtVKqJ1lc%2BdSe1y3CtxXyJH3fBv3BalVy7sYhZaPHWak4qz3JWxQYWK9LCwxFsPYtRqT1cOIEp%2FpzvONv0DMXRFnmMhfQBmudsdY25kKX%2F38hTwxhtZ5MzI30UVm6o3N80W1C5fc%2BTE5QgtSTrhm7EYhwEwnhAkxZgvkNKTHwc%2B1g%2BxhVPB4fPtkTZ3tOS5TSCjWhbcePQN0%2BeXemu8WHP0GL7fXqLHE3Xfvvu65iSimnFbKap44jzSumtK6aqXOJSo6eIUvq29%2Bv86uP35R%2Ffrw9XH3dCNfDn5%2FOzwnqdj5%2Bnt8L1vtwNL698eztZiQDUam52lUk8mdCOfpV1dKKUWP1hjU950FHVCzAkLlNdIv0wNEvrCGMI3zv0e81QPoPUv3Bxf4blKrvRZo4SwMnIDRhCkykeNKKxSZtDROQqMwlo94JqCCWic5q4ajIg7SKbRyRxkLvBuZ5Y1ekxO4%2B8bI%2B7OrISes63G1y8uKBHtnOG7s0ddObi90mGT602FVr1ruiCA9Ug5gTDTbwGgh4ZQGZBbzBS1M9qIHgbajhQADwcZ%2B%2BRvwKahp2KhqAoqZGRPRJilwtgGm2gjQQwAzal9XFLRH05HObaM1l7Qj3URnsVQSsss4Kew1xfRWxYtjTJAI0F%2FYtcxLJzh8l6pWaDW1RQlgP4O0xol5CTe2KLW3CFp4Wgf6P0vX7InA1oh49BU4VWVGPeqqyWC3s4Q%2FpYV8b7KkLret1K3sNYfJkVmUvCQjsVUpepSgpf4h5wa%2BsZLPykqigv7ECWh7KohuzcJ%2BmUCiroKlzE5rC%2BayRVO%2FcNFDGk3XHviggE2Bg0HkfRaemgXg5RlSqju9Ek7o00Vq53Il1r2IowMGDGQlWUURiuDqnZQydK6IgVrEqtTtY3IXJIlFnx9UdLUZrTcnIqkFtGqL2FxyCqhyidkfcmMgv4YMxMNLA18Uc5Gds0GmAOSbXHASREYLAkJH6e%2FS0WL3JE1JLY3gd4oLpQV%2BzD6KgFr3KaFdJ8FTkmB2QqgV9u%2BN%2Bfxbo83cB8AU9ErYwNFbQ6wjojbJAD259zwuS3X3zbXHnzaywx38%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E#%7B%22pageId%22%3A%22C5RBs43oDa-KdzZeNtuy%22%7D)


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
