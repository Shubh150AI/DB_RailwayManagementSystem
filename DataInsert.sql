  
  

  
  
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

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0215202413452, 13452, 'WED', TO_DATE('02-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0715202413452, 13452, 'MON', TO_DATE('07-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0915202413452, 13452, 'WED', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);


-- For Kashi Vishwanath EXP (TrainID: 21452)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0115202421452, 21452, 'TUE', TO_DATE('01-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0315202421452, 21452, 'THU', TO_DATE('03-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0415202421452, 21452, 'FRI', TO_DATE('04-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0515202421452, 21452, 'SAT', TO_DATE('05-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0615202421452, 21452, 'SUN', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0715202421452, 21452, 'TUE', TO_DATE('07-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0915202421452, 21452, 'THU', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1515202421452, 21452, 'FRI', TO_DATE('15-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);


-- For VNS-NDLS Vande Bharat EXP (TrainID: 22462)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0215202422462, 22462, 'WED', TO_DATE('02-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0515202422462, 22462, 'SAT', TO_DATE('05-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0915202422462, 22462, 'WED', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1515202422462, 22462, 'SAT', TO_DATE('15-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);


-- For New Delhi-Varanasi SF (TrainID: 13453)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0115202413453, 13453, 'TUE', TO_DATE('01-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0315202413453, 13453, 'THU', TO_DATE('03-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0815202413453, 13453, 'TUE', TO_DATE('08-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1515202413453, 13453, 'THU', TO_DATE('15-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);


-- For Kashi Vishwanath EXP (Return) (TrainID: 21453)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0215202421453, 21453, 'WED', TO_DATE('02-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0415202421453, 21453, 'FRI', TO_DATE('04-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0515202421453, 21453, 'SAT', TO_DATE('05-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0615202421453, 21453, 'SUN', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0715202421453, 21453, 'MON', TO_DATE('07-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0915202421453, 21453, 'WED', TO_DATE('09-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);


-- For Vande Bharat EXP (Return) (TrainID: 22463)

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0315202422463, 22463, 'THU', TO_DATE('03-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (0615202422463, 22463, 'SUN', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);

INSERT INTO AvailabilitySchedule (AvailabilityKey, TrainID, AvailableDays, ScheduledDate, RunningStatus, AvailableSeats) 
VALUES (1515202422463, 22463, 'THU', TO_DATE('15-OCT-2024', 'DD-MON-YYYY'), 'Y', 15);




SELECT * FROM  AvailabilitySchedule;


COMMIT;

---     TrainTiming table





--  13452


INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('13452', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'));





--SELECT * FROM  TrainTiming  WHERE  TrainID = '13452';


-- Insert timings for Train ID '21452'


INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452', 4521, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452', 4522, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452', 4523, TO_TIMESTAMP('2024-10-02 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452', 4524, TO_TIMESTAMP('2024-10-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 21:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21452', 4525, TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 22:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS







-- Insert timings for Train ID '22462'
INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462', 4621, TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462', 4622, TO_TIMESTAMP('2024-10-02 10:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462', 4623, TO_TIMESTAMP('2024-10-02 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-02 15:05:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22462', 4624, TO_TIMESTAMP('2024-10-03 01:18:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-03 01:18:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS





-- Insert timings for Train ID '21453'
INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453', 4531, TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453', 4532, TO_TIMESTAMP('2024-10-06 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 09:20:00', 'YYYY-MM-DD HH24:MI:SS')); -- GZB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453', 4533, TO_TIMESTAMP('2024-10-06 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 15:55:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453', 4534, TO_TIMESTAMP('2024-10-07 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('21453', 4535, TO_TIMESTAMP('2024-10-07 02:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 02:25:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB


--SELECT *   FROM  TrainTiming  WHERE  TrainID = '22463';


-- Insert timings for Train ID 22463
INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463', 4631, TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 08:00:00', 'YYYY-MM-DD HH24:MI:SS')); -- NDLS

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463', 4632, TO_TIMESTAMP('2024-10-06 13:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-06 13:35:00', 'YYYY-MM-DD HH24:MI:SS')); -- CNB

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463', 4633, TO_TIMESTAMP('2024-10-07 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 01:10:00', 'YYYY-MM-DD HH24:MI:SS')); -- PRJ

INSERT INTO TrainTiming (TrainID, RouteStationID, ArrivalTime, DepartureTime) 
VALUES ('22463', 4634, TO_TIMESTAMP('2024-10-07 01:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-10-07 01:50:00', 'YYYY-MM-DD HH24:MI:SS')); -- BSB


SELECT * FROM  TrainTiming



COMMIT;



















