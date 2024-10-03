  
  

  
  
  INSERT INTO Stations (StationID, StationCity) VALUES ('BSB', 'Varanasi');
  INSERT INTO Stations (StationID, StationCity) VALUES ('PRJ', 'Prayagraj');
  INSERT INTO Stations (StationID, StationCity) VALUES ('CNB', 'Kanpur');
  INSERT INTO Stations (StationID, StationCity) VALUES ('GZB', 'Ghaziabad');
  INSERT INTO Stations (StationID, StationCity) VALUES ('NDLS', 'New Delhi');




SELECt * FROM Stations;





INSERT INTO Routes (RouteID, RouteDescription) VALUES (452, 'BSB -> PRJ -> CNB -> GZB -> NDLS');
INSERT INTO Routes (RouteID, RouteDescription) VALUES (462, 'BSB -> PRJ -> CNB -> NDLS');
--Return routes
INSERT INTO Routes (RouteID, RouteDescription) VALUES (453, 'NDLS -> PRJ -> CNB -> PRJ -> BSB');
INSERT INTO Routes (RouteID, RouteDescription) VALUES (463, 'NDLS -> CNB -> PRJ -> BSB');



SELECT * FROM Routes ;




INSERT INTO Trains (TrainID, TrainName, AvailableSeats, RouteID) VALUES (13452, 'Varanasi-New Delhi SF', 10, 452);
INSERT INTO Trains (TrainID, TrainName, AvailableSeats, RouteID) VALUES (21452, 'Kashi Vishwanath EXP', 10, 452);
INSERT INTO Trains (TrainID, TrainName, AvailableSeats, RouteID) VALUES (22462, 'VNS-NDLS Vande Bharat EXP', 10, 462);

-- return trains 
INSERT INTO Trains (TrainID, TrainName, AvailableSeats, RouteID) VALUES (13453, 'New Delhi-Varanasi SF', 10, 453);
INSERT INTO Trains (TrainID, TrainName, AvailableSeats, RouteID) VALUES (21453, 'Kashi Vishwanath EXP (Return)', 10, 453);
INSERT INTO Trains (TrainID, TrainName, AvailableSeats, RouteID) VALUES (22463, 'Vande Bharat EXP (Return)', 10, 463);





SELECT * FROM Trains ;





-- Route ID 452: BSB -> PRJ -> CNB -> GZB -> NDLS  
INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4521, 452, 'BSB', 'BSB', 'NDLS', 0);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4522, 452, 'BSB', 'PRJ', 'NDLS', 125);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4523, 452, 'BSB', 'CNB', 'NDLS', 285);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4524, 452, 'BSB', 'GZB', 'NDLS', 670);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4525, 452, 'BSB', 'NDLS', 'NDLS', 770);








-- Route ID 462: BSB -> PRJ -> CNB -> NDLS
INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4621, 462, 'BSB', 'BSB', 'NDLS', 0);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4622, 462, 'BSB', 'PRJ', 'NDLS', 125);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4623, 462, 'BSB', 'CNB', 'NDLS', 285);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4624, 462, 'BSB', 'NDLS', 'NDLS', 799);





-- Routes for returning trains

-- Return Route ID 453: NDLS -> GZB -> CNB -> PRJ -> BSB
INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4531, 453, 'NDLS', 'NDLS', 'BSB', 0);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4532, 453, 'NDLS', 'GZB', 'BSB', 70);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4533, 453, 'NDLS', 'CNB', 'BSB', 385);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4534, 453, 'NDLS', 'PRJ', 'BSB', 545);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4535, 453, 'NDLS', 'BSB', 'BSB', 789);


SELECT * FROM RouteStations  WHERE  RouteID = 453;




-- Return Route ID 463: NDLS -> CNB -> PRJ -> BSB
INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4631, 463, 'NDLS', 'NDLS', 'BSB', 0);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4632, 463, 'NDLS', 'CNB', 'BSB', 325);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4633, 463, 'NDLS', 'PRJ', 'BSB', 685);

INSERT INTO RouteStations (RouteStationID, RouteID, StartingStationID, IntermediateStationID, EndingStationID, DistanceCovered)
VALUES (4634, 463, 'NDLS', 'BSB', 'BSB', 760);





SELECT * FROM RouteStations;








SELECT * FROM  AvailabilitySchedule;


-- Availability for Train ID 13452 (Varanasi-New Delhi SF)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0210202413452, 13452, '13452WED', 'WED', TO_DATE('02-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0710202413452, 13452, '13452MON', 'MON', TO_DATE('07-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0910202413452, 13452, '13452WED', 'WED', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);


-- For Kashi Vishwanath EXP (TrainID: 21452)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0110202421452, 21452, '21452TUE', 'TUE', TO_DATE('01-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0310202421452, 21452, '21452THU', 'THU', TO_DATE('03-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0410202421452, 21452, '21452FRI', 'FRI', TO_DATE('04-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0510202421452, 21452, '21452SAT', 'SAT', TO_DATE('05-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0610202421452, 21452, '21452SUN', 'SUN', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0710202421452, 21452, '21452TUE', 'TUE', TO_DATE('07-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0910202421452, 21452, '21452THU', 'THU', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1010202421452, 21452, '21452FRI', 'FRI', TO_DATE('10-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);


-- For VNS-NDLS Vande Bharat EXP (TrainID: 22462)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0210202422462, 22462, '22462WED', 'WED', TO_DATE('02-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0510202422462, 22462, '22462SAT', 'SAT', TO_DATE('05-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0910202422462, 22462, '22462WED', 'WED', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1010202422462, 22462, '22462SAT', 'SAT', TO_DATE('10-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);


-- For New Delhi-Varanasi SF (TrainID: 13453)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0110202413453, 13453, '13453TUE', 'TUE', TO_DATE('01-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0310202413453, 13453, '13453THU', 'THU', TO_DATE('03-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0810202413453, 13453, '13453TUE', 'TUE', TO_DATE('08-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1010202413453, 13453, '13453THU', 'THU', TO_DATE('10-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);


-- For Kashi Vishwanath EXP (Return) (TrainID: 21453)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0210202421453, 21453, '21453WED', 'WED', TO_DATE('02-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0410202421453, 21453, '21453FRI', 'FRI', TO_DATE('04-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0510202421453, 21453, '21453SAT', 'SAT', TO_DATE('05-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0610202421453, 21453, '21453SUN', 'SUN', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0710202421453, 21453, '21453MON', 'MON', TO_DATE('07-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0910202421453, 21453, '21453WED', 'WED', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);


-- For Vande Bharat EXP (Return) (TrainID: 22463)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0310202422463, 22463, '22463THU', 'THU', TO_DATE('03-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0610202422463, 22463, '22463SUN', 'SUN', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, TimingID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1010202422463, 22463, '22463THU', 'THU', TO_DATE('10-OCT-2024', 'DD-MON-YYYY'), 'Y', 10);



SELECT * FROM  AvailabilitySchedule;




---     TrainTiming table




--  13452WED


INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452WED', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452WED', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452WED', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452WED', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452WED', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'));




-- 13452MON 

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452MON', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452MON', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452MON', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452MON', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452MON', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS



SELECT * FROM  TrainTiming  WHERE  TimingID = '13452MON';


-- Insert timings for Train ID '21452TUE'TUE


INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452TUE', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452TUE', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452TUE', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452TUE', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452TUE', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS





-- Insert timings for Train ID '21452THU'THU


INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452THU', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452THU', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452THU', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452THU', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452THU', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS



--DELETE  FROM  TrainTiming  WHERE  TimingID = '21452THU';

SELECT *   FROM  TrainTiming  WHERE  TimingID = '21452THU';



-- Insert timings for Train ID '21452FRI'FRI
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452FRI', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452FRI', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452FRI', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452FRI', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452FRI', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

SELECT *   FROM  TrainTiming  WHERE  TimingID = '21452FRI';




-- Insert timings for Train ID '21452SAT'SAT
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SAT', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SAT', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SAT', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SAT', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SAT', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS




-- Insert timings for Train ID '21452SUN'SUN
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SUN', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SUN', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SUN', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SUN', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452SUN', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS






-- Insert timings for Train ID '22462WED'WED
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462WED', 4621, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462WED', 4622, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462WED', 4623, TO_TIMESTAMP('2024-10-02 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 15:05:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462WED', 4624, TO_TIMESTAMP('2024-10-03 01:18:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 01:18:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS




-- Insert timings for Train ID '22462WED'SAT
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462SAT', 4621, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462SAT', 4622, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462SAT', 4623, TO_TIMESTAMP('2024-10-02 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 15:05:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462SAT', 4624, TO_TIMESTAMP('2024-10-03 01:18:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 01:18:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS







-- Insert timings for Train ID '13453TUE'TUE
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453TUE', 4531, TO_TIMESTAMP('2024-10-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453TUE', 4532, TO_TIMESTAMP('2024-10-01 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-01 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453TUE', 4533, TO_TIMESTAMP('2024-10-01 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-01 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453TUE', 4534, TO_TIMESTAMP('2024-10-02 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453TUE', 4535, TO_TIMESTAMP('2024-10-02 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB



-- Insert timings for Train ID '13453THU'THU
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453THU', 4531, TO_TIMESTAMP('2024-10-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453THU', 4532, TO_TIMESTAMP('2024-10-03 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453THU', 4533, TO_TIMESTAMP('2024-10-03 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453THU', 4534, TO_TIMESTAMP('2024-10-04 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13453THU', 4535, TO_TIMESTAMP('2024-10-04 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB


SELECT *   FROM  TrainTiming  WHERE  TimingID = '13453THU';

--Insert timings for Train ID '21453WED'WED
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453WED', 4531, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453WED', 4532, TO_TIMESTAMP('2024-10-02 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453WED', 4533, TO_TIMESTAMP('2024-10-02 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453WED', 4534, TO_TIMESTAMP('2024-10-03 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453WED', 4535, TO_TIMESTAMP('2024-10-03 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB




-- Insert timings for Train ID '21453FRI'FRI
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453FRI', 4531, TO_TIMESTAMP('2024-10-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453FRI', 4532, TO_TIMESTAMP('2024-10-03 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453FRI', 4533, TO_TIMESTAMP('2024-10-03 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453FRI', 4534, TO_TIMESTAMP('2024-10-04 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453FRI', 4535, TO_TIMESTAMP('2024-10-04 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

SELECT *   FROM  TrainTiming  WHERE  TimingID = '21453FRI';


-- Insert timings for Train ID '21453SAT'SAT
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SAT', 4531, TO_TIMESTAMP('2024-10-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SAT', 4532, TO_TIMESTAMP('2024-10-04 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SAT', 4533, TO_TIMESTAMP('2024-10-04 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SAT', 4534, TO_TIMESTAMP('2024-10-05 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-05 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SAT', 4535, TO_TIMESTAMP('2024-10-05 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-05 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB



-- Insert timings for Train ID '21453SUN'SUN
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SUN', 4531, TO_TIMESTAMP('2024-10-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SUN', 4532, TO_TIMESTAMP('2024-10-05 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-05 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SUN', 4533, TO_TIMESTAMP('2024-10-05 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-05 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SUN', 4534, TO_TIMESTAMP('2024-10-06 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453SUN', 4535, TO_TIMESTAMP('2024-10-06 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB


SELECT *   FROM  TrainTiming  WHERE  TimingID = '21453SUN';


-- Insert timings for Train ID '21453MON'MON
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453MON', 4531, TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453MON', 4532, TO_TIMESTAMP('2024-10-06 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453MON', 4533, TO_TIMESTAMP('2024-10-06 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453MON', 4534, TO_TIMESTAMP('2024-10-07 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453MON', 4535, TO_TIMESTAMP('2024-10-07 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB


SELECT *   FROM  TrainTiming  WHERE  TimingID = '22463SUN';


-- Insert timings for Train ID 22463THU
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463THU', 4631, TO_TIMESTAMP('2024-10-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463THU', 4632, TO_TIMESTAMP('2024-10-03 13:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 13:35:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463THU', 4633, TO_TIMESTAMP('2024-10-04 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463THU', 4634, TO_TIMESTAMP('2024-10-04 01:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-04 01:50:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB







-- Insert timings for Train ID 22463SUN
INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463SUN', 4631, TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463SUN', 4632, TO_TIMESTAMP('2024-10-06 13:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 13:35:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463SUN', 4633, TO_TIMESTAMP('2024-10-07 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TimingID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463SUN', 4634, TO_TIMESTAMP('2024-10-07 01:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 01:50:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB




COMMIT;







INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('13452WED');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('13452MON');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21452TUE');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21452THU');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21452FRI');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21452SAT');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21452SUN');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('22462WED');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('22462SAT');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('13453TUE');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('13453THU');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21453WED');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21453FRI');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21453SAT');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21453SUN');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('21453MON');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('22463THU');
INSERT INTO AvailibilityTimingBridge (TimingID) VALUES ('22463SUN');










