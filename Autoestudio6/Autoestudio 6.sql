--Tablas
CREATE TABLE STAFF(
    id_staff    varchar(6) NOT NULL,
    name_staff  varchar(255)
);

CREATE TABLE MODLE(
    id_modle    varchar(20) NOT NULL, 
    name_modle  varchar(50)
);

CREATE TABLE EVENT(
    id_event        varchar(20) NOT NULL, 
    modle           varchar(20), 
    kind            char(1), 
    dow             varchar(15), 
    tod             char(5), 
    duration_event  number(11),
    room            varchar(20)
);

CREATE TABLE TEACHES(
    staff varchar(20) NOT NULL,
    event varchar(20) NOT NULL
);

CREATE TABLE OCCURS(
    event varchar(20) NOT NULL,
    week varchar(20) NOT NULL
);

--PRIMARIAS

ALTER TABLE STAFF ADD CONSTRAINT PK_STAFF PRIMARY KEY (id_staff);

ALTER TABLE MODLE ADD CONSTRAINT PK_MODLE PRIMARY KEY (id_modle);

ALTER TABLE EVENT ADD CONSTRAINT PK_EVENT PRIMARY KEY (id_event);

ALTER TABLE TEACHES ADD CONSTRAINT PK_TEACHES PRIMARY KEY (staff, event);

ALTER TABLE OCCURS ADD CONSTRAINT PK_OCCURS PRIMARY KEY (event, week);

-- FORANEAS


ALTER TABLE EVENT ADD CONSTRAINT FK_EVENT_MODLE FOREIGN KEY (modle) REFERENCES MODLE(id_modle);

ALTER TABLE OCCURS ADD CONSTRAINT FK_OCCURS_EVENT FOREIGN KEY (event) REFERENCES EVENT(id_event);

ALTER TABLE TEACHES ADD CONSTRAINT FK_TEACHES_EVENT FOREIGN KEY (event) REFERENCES EVENT(id_event);
--PoblarOK


-- MODLE
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12002', 'Software Development 1A');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12003', 'Professional Skills');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12004', 'Applications Workshop');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12005', 'Software Development 1B');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12006', 'Computer Systems');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12008', 'Word Processing and Spreadsheets Elective');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12009', 'Information Systems 1a');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12010', 'Software Development C');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12011', 'Software Development in C');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12012', 'Using Electronic Communication Effectively');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co12021', 'Using Electronic Communication Effectively');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co2.cs22006', '');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22001', 'Database Systems');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22002', 'Software Development');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22003', 'Computer Systems');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22004', 'Software Engineering');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22005', 'Human Computer Interaction');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22006', 'Algorithms and Data Structures');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22007', 'Web Development');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22008', 'Introduction to Databases');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22009', 'Software Development (Bridging)');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22020', 'Window NT Elective');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co22022', 'Programming C++');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32001', 'Very Large Databases');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32002', 'Customer Centred Design');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32003', 'Multimedia Technology');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32004', 'Multimedia Development Methods');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32005', 'Multimedia Systems Design');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32006', 'Computer Networks and Distributed Systems');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32007', 'Design Patterns');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32008', 'Computer Interfacing');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32010', 'Network Operating Systems');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32011', 'Visual Components and Systems Integration');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32013', 'Embedded Systems');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32014', 'Computers and Innovation Process');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32015', 'Frameworks');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32016', 'Group Project');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32017', 'Internet Programming');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32018', 'Internet Programming 3');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32020', 'Professional Studies');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32021', 'Group Project');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32023', 'Systems Engineering 3');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32993', 'Human Computer Interaction 3');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32M19', 'Management of Industrial Organisations');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co32XX5', 'Systems Engineering 3');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co42001', 'Virtual Environments');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co42002', 'Multimedia Technology');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co42004', 'Media Computing');
INSERT INTO MODLE (id_modle, name_modle) VALUES ('co42005', 'Computer Supported Cooperative Working');

SELECT * FROM MODLE;
--STAFF
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.ACr', 'Crerar, Dr Alison');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.AFA', 'Armitage, Dr Alistair');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.AG', 'Groat, Anne');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.AL', 'Lawson, Alistair');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.AMn', 'Maclean, Aileen');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.ASc', 'Scott, Andrea');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.ASr', 'Soutar, Alastair');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.AV', 'Varey, Alison');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.BB', 'Buchanan, Dr Wm');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.BC', 'Cowan, Bruce');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.BD', 'Dupee, Dr Brian');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.BDR', 'Ritchie, Bryden');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.BP', 'Paechter, Ben');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CAD', 'Clem Douglas');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CAR', 'Rickard, Anne');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CG', 'Gregory, Chris');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CHd', 'Hand, Chris');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CHt', 'Hastie, Colin');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CM', 'Macaulay, Catriona');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.CMD', 'Dougal, Colin');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.DB', 'Benyon, Prof David');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.ED', 'Davenport, Lissie');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.EH', 'Hart, Emma');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.FG', 'Greig, Frank');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.GM', 'McCarra, Greg');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.GR', 'Russell, Dr Gordon');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.GS', 'Scott, Graham');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.HH', 'Hall, Hazel');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.IM', 'McGregor, Iain');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.IS', 'Smith, Ian');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JB', 'Jyoti Bhardwaj');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JJ', 'Jackson, Jim');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JKg', 'Kerridge, Prof Jon');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JKy', 'Kennedy, Jessie');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JMc', 'McGowan, Joyce');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JMy', 'Murray, Jim');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JMz', 'Munoz, Dr Jose');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JO', 'Owens, Dr John');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.JSv', 'Savage, Dr John');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.KB', 'Barclay, Ken');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.KC', 'Chisholm, Ken');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.KH', 'Horton, Keith');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.LM', 'Morss, Dr Les');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.LS', 'Shearey, Lyn');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.MR', 'Rutter, Malcolm');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.MS', 'Smyth, Michael');
INSERT INTO STAFF (id_staff, name_staff) VALUES ('co.PTh', 'Thompson, Peter');

SELECT * FROM STAFF;

-- Event

INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.L02', 'co12004', 'L', 'Monday', '17:00', 1, 'cr.B13');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.T01', 'co12004', 'T', 'Monday', '11:00', 2, 'co.G78+G82');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.T02', 'co12004', 'T', 'Tuesday', '15:00', 2, 'co.B7');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.T03', 'co12004', 'T', 'Tuesday', '13:00', 2, 'co.G78+G82');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.T04', 'co12004', 'T', 'Wednesday', '13:00', 2, 'co.LB42+LB46');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.T05', 'co12004', 'T', 'Wednesday', '09:00', 2, 'co.117+118');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12004.T06', 'co12004', 'T', 'Tuesday', '13:00', 2, 'co.LB47');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.L01', 'co12005', 'L', 'Monday', '14:00', 1, 'cr.SMH');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.L02', 'co12005', 'L', 'Friday', '10:00', 1, 'cr.SMH');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.T01', 'co12005', 'T', 'Tuesday', '11:00', 2, 'co.G78+G82');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.T02', 'co12005', 'T', 'Monday', '11:00', 2, 'cr.G90+116');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.T03', 'co12005', 'T', 'Tuesday', '10:00', 2, 'co.LB47');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.T04', 'co12005', 'T', 'Wednesday', '14:00', 2, 'co.B7');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12005.T05', 'co12005', 'T', 'Monday', '15:00', 2, 'co.117+118');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12006.L01', 'co12006', 'L', 'Wednesday', '10:00', 1, 'cr.SMH');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12006.L02', 'co12006', 'L', 'Thursday', '09:00', 2, 'cr.G6');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12006.L03', 'co12006', 'L', 'Wednesday', '13:00', 1, 'cr.SMH');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12006.T01', 'co12006', 'T', 'Tuesday', '14:00', 2, 'co.LB42+LB46');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12006.T02', 'co12006', 'T', 'Thursday', '13:00', 2, 'co.G82');
INSERT INTO EVENT (id_event, modle, kind, dow, tod, duration_event, room) VALUES ('co12006.T03', 'co12006', 'T', 'Monday', '15:00', 2, 'co.LB47');

SELECT * FROM EVENT;

-- Teaches

INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12005.T01');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12004.L02');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12004.T03');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12004.T03');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12004.T04');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12004.T05');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12004.T06');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12005.L01');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12005.L02');
INSERT INTO TEACHES (staff, event) VALUES ('co.ACg', 'co12005.T01');


SELECT * FROM TEACHES;

--OCCURS
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '01');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '02');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '03');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '04');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '05');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '06');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '07');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '08');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '10');
INSERT INTO OCCURS (event, week) VALUES ('co12004.L02', '11');

SELECT * FROM OCCURS;

--PoblarNoOK

INSERT INTO OCCURS (event, week) VALUES ('', '01');
INSERT INTO OCCURS (event, week) VALUES ('', '02');
INSERT INTO OCCURS (event, week) VALUES ('', '03');
INSERT INTO OCCURS (event, week) VALUES ('', '04');

-- 5 consultas 

--Consulta 1: Obtener todos los eventos y sus detalles junto con los nombres de los m?dulos a los que est?n asociados.
SELECT e.id_event, e.kind, e.dow, e.tod, e.duration_event, e.room, m.name_modle
FROM EVENT e
INNER JOIN MODLE m ON e.modle = m.id_modle;

--Consulta 2: Obtener todos los eventos de tipo "T" (tutoriales) y sus detalles.
SELECT *
FROM EVENT
WHERE kind = 'T';

|--Consulta 3: Obtener todos los eventos impartidos por el personal con el nombre "Dr Alison Crerar" y sus detalles.
SELECT e.id_event, e.kind, e.dow, e.tod, e.duration_event, e.room
FROM EVENT e
INNER JOIN TEACHES t ON e.id_event = t.event
INNER JOIN STAFF s ON t.staff = s.id_staff
WHERE s.name_staff = 'Crerar, Dr Alison';

--Consulta 4: Obtener todos los eventos que ocurren en la semana "01" y sus detalles.
SELECT e.id_event, e.kind, e.dow, e.tod, e.duration_event, e.room
FROM EVENT e
INNER JOIN OCCURS o ON e.id_event = o.event
WHERE o.week = '01';

--Consulta 5: Obtener el personal que ense?a eventos de tipo "L" (lecciones) y la cantidad de eventos que ense?an

SELECT s.id_staff, s.name_staff, COUNT(t.event) AS cantidad_eventos
FROM STAFF s
INNER JOIN TEACHES t ON s.id_staff = t.staff
INNER JOIN EVENT e ON t.event = e.id_event
WHERE e.kind = 'L'
GROUP BY s.id_staff, s.name_staff;


--XPoblar

DELETE OCCURS;
DELETE EVENT;
DELETE MODLE;
DELETE STAFF;
DELETE TEACHES;

--XTablas
DROP TABLE STAFF;
DROP TABLE TEACHES;
DROP TABLE MODLE;
DROP TABLE EVENT;
DROP TABLE OCCURS;


---autoestudio-----

