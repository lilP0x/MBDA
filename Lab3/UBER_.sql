--Tablas

CREATE TABLE CONDUCTORES (
    id_conductor   varchar(9) NOT NULL,
    tipo varchar(2),
    numero varchar(10),
    nombre varchar(50),
    registro date,
    celular int,
    correo varchar(50),
    licencia varchar(10) NOT NULL,
    fechaNacimiento date NOT NULL,
    estrellas int NOT NULL,
    estado char(1) NOT NULL
);

CREATE TABLE CLIENTES (
    id_cliente   varchar(9) NOT NULL,
    tipo varchar(2) NOT NULL,
    numero varchar(10)  NOT NULL,
    nombre varchar(50)  NOT NULL,
    registro date   NOT NULL,
    celular int NOT NULL,
    correo varchar(50)  NOT NULL,
    idioma varchar(10) NOT NULL
);

CREATE TABLE VEHICULOS (
    placa varchar(30) NOT NULL,
    a_0 int NOT NULL,
    tipo varchar(1) NOT NULL,
    estado varchar(1) NOT NULL,
    puertas int, 
    pasajeros int,
    carga int,
    conductor varchar(9)
);

CREATE TABLE TARJETAS (
    numero int NOT NULL,
    entidad varchar(10) NOT NULL,
    vencimiento date NOT NULL
);

CREATE TABLE SOLICITUDES (
    codigo int NOT NULL,
    fechaCreacion date NOT NULL,
    fechaViaje date,
    plataforma varchar(1) NOT NULL,
    precio int,
    estado varchar(1) NOT NULL, 
    requerimientos varchar(15),
    cliente varchar(9),
    latitud decimal,
    longitud decimal,
    latitudFin decimal,
    longitudFin decimal
);

CREATE TABLE PQRS (
    ticked varchar(13) NOT NULL,
    radicacion date NOT NULL,
    cierre date,
    descripcion varchar(255),
    tipo char(1) NOT NULL,
    estado varchar(1) NOT NULL,
    solicitud int
);

CREATE TABLE PQRSRESPUESTAS(
    fecha date NOT NULL,
    descripcion varchar(50) NOT NULL,
    nombre varchar(20) NOT NULL,
    correo varchar(50) NOT NULL,
    comentario varchar(20),
    evaluacion int,
    solicitud varchar(13)
);

CREATE TABLE ANEXOS (
    nombre varchar(20) NOT NULL,
    url_anexo varchar(100) NOT NULL,
    solicitud varchar(13)
);

CREATE TABLE INICIAEN (
    latitud decimal NOT NULL,
    longitud decimal NOT NULL
);

CREATE TABLE FINALIZAEN (
    latitud decimal NOT NULL,
    longitud decimal NOT NULL
);

CREATE TABLE REQUERIMIENTOS(
    solicitud int NOT NULL,
    requerimientos varchar(15) NOT NULL 
);


CREATE TABLE PRESENTA (
    cliente varchar(9) NOT NULL,
    targeta int NOT NULL
);

--Atributos

-- Solicitudes

--ALTER TABLE SOLICITUDES ADD CONSTRAINT restriccion_precio CHECK (precio > 0 AND (precio % 100 = 0));

ALTER TABLE SOLICITUDES ADD CONSTRAINT restriccion_estado CHECK (estado IN ('P', 'A', 'C', 'F'));

ALTER TABLE SOLICITUDES ADD CONSTRAINT restriccion_requerimientos CHECK (REGEXP_LIKE(requerimientos, '^(MUSICA|RUTA|IDIOMA)'));

-- PQRS

ALTER TABLE PQRS ADD CONSTRAINT restriccion_ticked CHECK (REGEXP_LIKE(ticked, '^[A-Z][0-9]{12}$'));

ALTER TABLE PQRS ADD CONSTRAINT restriccion_tipo CHECK (tipo IN ('P', 'Q', 'R', 'S'));

-- Url

ALTER TABLE ANEXOS ADD CONSTRAINT restriccion_url CHECK (REGEXP_LIKE(url_anexo, '^https://.*'));

-- PQRSRESPUESTA

ALTER TABLE  PQRSRESPUESTAS ADD CONSTRAINT CHK_EmailValido_ CHECK (correo LIKE '%@%' AND correo LIKE '%:%'  );

ALTER TABLE PQRSRESPUESTAS ADD CONSTRAINT CHK_RangoValido_ CHECK (evaluacion >= 1 AND evaluacion <= 5);

--Conductores

ALTER TABLE CONDUCTORES ADD CONSTRAINT CHK_Tipo CHECK (Tipo IN ('TI', 'CC', 'CE', 'PS'));

ALTER TABLE CONDUCTORES ADD CONSTRAINT CHK_EmailValido CHECK (correo LIKE '%@%' AND correo LIKE '%:%'  );

ALTER TABLE CONDUCTORES ADD CONSTRAINT CHK_RangoValido CHECK (estrellas >= 1 AND estrellas <= 5);

ALTER TABLE CONDUCTORES ADD CONSTRAINT CHK_EstadoValido CHECK (estado IN ('A', 'I', 'R', 'O'));


--Vehiculos

ALTER TABLE VEHICULOS ADD CONSTRAINT check_año_nacimiento CHECK (a_0 <= 1900);

ALTER TABLE VEHICULOS ADD CONSTRAINT restriccion_nombre CHECK (estado IN ('A', 'I', 'R', 'O'));

ALTER TABLE VEHICULOS ADD CONSTRAINT check_puertas CHECK (puertas > 0);

ALTER TABLE VEHICULOS ADD CONSTRAINT check_pasajeros CHECK (pasajeros > 0);

ALTER TABLE VEHICULOS ADD CONSTRAINT check_carga CHECK (carga > 0);

--Nuevas restricciones 

-- Modificación de la tabla CONDUCTORES para agregar la restricción de longitud de nombre
ALTER TABLE CONDUCTORES ADD CONSTRAINT restriccion_longitud_nombre CHECK (LENGTH(nombre) <= 50);

-- Restricción para latitud y longitud en la tabla INICIAEN
ALTER TABLE INICIAEN ADD CONSTRAINT restriccion_latitud CHECK (latitud >= -90 AND latitud <= 90);
ALTER TABLE INICIAEN ADD CONSTRAINT restriccion_longitud CHECK (longitud >= -180 AND longitud <= 180);

-- Restricción para latitud y longitud en la tabla FINALIZAEN
ALTER TABLE FINALIZAEN ADD CONSTRAINT restriccion_latitud CHECK (latitud >= -90 AND latitud <= 90);
ALTER TABLE FINALIZAEN ADD CONSTRAINT restriccion_longitud CHECK (longitud >= -180 AND longitud <= 180);

--5 Nuevas restricciones 

-- Restricción de fecha de nacimiento válida
ALTER TABLE CONDUCTORES ADD CONSTRAINT CHK_FechaNacimiento CHECK (fechaNacimiento <= SYSDATE);

-- Restricción de precio múltiplo de 100
ALTER TABLE SOLICITUDES ADD CONSTRAINT CHK_PrecioMultiplo100 CHECK (precio > 0 AND MOD(precio, 100) = 0);

-- Restricción de fecha de vencimiento futura
ALTER TABLE TARJETAS ADD CONSTRAINT CHK_FechaVencimiento CHECK (vencimiento > SYSDATE);

-- Restricción de longitud de descripción
ALTER TABLE PQRSRESPUESTAS ADD CONSTRAINT CHK_LongitudDescripcion CHECK (LENGTH(descripcion) <= 255);

-- Restricción de valor único para el número de tarjeta en la tabla TARJETAS
ALTER TABLE TARJETAS ADD CONSTRAINT CHK_TarjetaUnica UNIQUE (numero);

--Primarias

ALTER TABLE CONDUCTORES ADD CONSTRAINT PK_CONDUCTORES PRIMARY KEY (id_conductor);

ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (id_cliente);

ALTER TABLE VEHICULOS ADD CONSTRAINT PK_VEHICULOS PRIMARY KEY (placa);

ALTER TABLE TARJETAS ADD CONSTRAINT PK_TARJETAS PRIMARY KEY (NUMERO);

ALTER TABLE SOLICITUDES ADD CONSTRAINT PK_SOLICITUDES PRIMARY KEY (codigo);

ALTER TABLE PQRS ADD CONSTRAINT PK_PQRS PRIMARY KEY (ticked);

ALTER TABLE INICIAEN ADD CONSTRAINT PK_INICIAEN PRIMARY KEY (latitud, longitud);

ALTER TABLE FINALIZAEN ADD CONSTRAINT PK_FINALIZAEN PRIMARY KEY (latitud, longitud);


--Unicas

ALTER TABLE CONDUCTORES ADD CONSTRAINT UK_CONDUCTORES UNIQUE (tipo, numero);

ALTER TABLE CLIENTES ADD CONSTRAINT UK_CLIENTES UNIQUE (tipo, numero);

ALTER TABLE ANEXOS ADD CONSTRAINT UQ_ANEXOS UNIQUE (url_anexo);


--Foraneas
ALTER TABLE PRESENTA ADD CONSTRAINT FK_PRESENTA_CLIENTES FOREIGN KEY (cliente) REFERENCES CLIENTES (id_cliente);

ALTER TABLE PRESENTA ADD CONSTRAINT FK_PRESENTA_TARJETA FOREIGN KEY (targeta) REFERENCES TARJETAS (numero);

ALTER TABLE VEHICULOS ADD CONSTRAINT FK_VEHICULOS_CONDUCTORES FOREIGN KEY (conductor) REFERENCES CONDUCTORES (id_conductor);

ALTER TABLE SOLICITUDES ADD CONSTRAINT FK_SOLICITUDES_CLIENTES FOREIGN KEY (cliente) REFERENCES CLIENTES (id_cliente); 

ALTER TABLE SOLICITUDES ADD CONSTRAINT FK_SOICITUDES_INCIAEN FOREIGN KEY (latitud,longitud) REFERENCES INICIAEN(latitud,longitud);

ALTER TABLE SOLICITUDES ADD CONSTRAINT FK_SOICITUDES_FINALIZAEN FOREIGN KEY (latitudFin,longitudFin) REFERENCES FINALIZAEN(latitud,longitud); --PORQUE VERGAS DIJISTE QUE SON DOS FORANEAS SI SEGUN TU CODIGO BASURA ESTO ES UNA FOREAN COMPUESTA

ALTER TABLE REQUERIMIENTOS ADD CONSTRAINT FK_SOLICITUDES_REQUERIMIENTOS FOREIGN KEY (solicitud) REFERENCES SOLICITUDES(codigo);



--XPoblar

DELETE TARJETAS;
DELETE CONDUCTORES;
DELETE CLIENTES;
DELETE PRESENTAS;
DELETE POSICIONES;
DELETE INICIAEN;
DELETE FINALIZAEN;
DELETE REQUERIMIENTOS;
DELETE PQRS;
DELETE PQRSRESPUESTAS;
DELETE ANEXOS;
DELETE VEHICULOS;

--XTablas

DROP TABLE VEHICULOS;
DROP TABLE ANEXOS;
DROP TABLE PQRSRESPUESTAS;
DROP TABLE PQRS;
DROP TABLE REQUERIMIENTOS;
DROP TABLE SOLICITUDES;
DROP TABLE INICIAEN;
DROP TABLE FINALIZAEN;
DROP TABLE PRESENTA;
DROP TABLE CLIENTES;
DROP TABLE CONDUCTORES;
DROP TABLE TARJETAS;


--Consultas

--PoblarOK

--Conductores

INSERT INTO CONDUCTORES (id_conductor, tipo, numero, nombre, registro, celular, correo, licencia, fechaNacimiento, estrellas, estado)
VALUES ('123456789', 'DN', '1234567890', 'Juan Pérez', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 1234567890, 'juan@example.com', 'ABCDE12345', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 5, 'A');

INSERT INTO CONDUCTORES (id_conductor, tipo, numero, nombre, registro, celular, correo, licencia, fechaNacimiento, estrellas, estado)
VALUES ('987654321', 'CE', '9876543210', 'María González', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 9876543210, 'maria@example.com', 'FGHIJ54321', TO_DATE('1985-05-20', 'YYYY-MM-DD'), 4, 'A');

INSERT INTO CONDUCTORES (id_conductor, tipo, numero, nombre, registro, celular, correo, licencia, fechaNacimiento, estrellas, estado)
VALUES ('567890123', 'PA', '5678901234', 'Pedro Ramírez', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 5678901234, 'pedro@example.com', 'KLMNO67890', TO_DATE('1998-11-10', 'YYYY-MM-DD'), 3, 'A');

--Vehiculos

INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('ABC123', 2020, 'A', 'A', 4, 5, NULL, NULL);

INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('XYZ789', 2019, 'B', 'A', 2, 2, 500, '123456789');

INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('PQR456', 2021, 'C', 'I', 4, 7, NULL, NULL);

--Cliente

INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma)
VALUES ('123456789', 'DI', '1234567890', 'Ana García', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 9876543210, 'ana@example.com', 'Español');

INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma)
VALUES ('987654321', 'CD', '9876543210', 'Luis Rodríguez', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 1234567890, 'luis@example.com', 'Inglés');

INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma)
VALUES ('567890123', 'PS', '5678901234', 'María López', TO_DATE('2023-10-04', 'YYYY-MM-DD'), 5555555555, 'maria@example.com', 'Francés');

--Solicitudes

INSERT INTO SOLICITUDES (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, requerimientos, cliente, latitud, longitud, latitudFin, longitudFin)
VALUES (1, TO_DATE('2023-10-04', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'A', 2500, 'P', 'Aso', '123456789', 37.12345, -122.54321, 37.23456, -122.65432);

INSERT INTO SOLICITUDES (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, requerimientos, cliente, latitud, longitud, latitudFin, longitudFin)
VALUES (2, TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'B', 1800, 'P', 'Port', '987654321', 40.98765, -73.12345, 40.87654, -73.23456);

INSERT INTO SOLICITUDES (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, requerimientos, cliente, latitud, longitud, latitudFin, longitudFin)
VALUES (3, TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'C', 3000, 'P', 'Asianiños', '567890123', 34.56789, -118.98765, 34.67890, -118.87654);

--PQRS

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('TICKET001', TO_DATE('2023-10-04', 'YYYY-MM-DD'), NULL, 'Problema con la factura', 'R', 'A', 1);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('TICKET002', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'Solicitud de información', 'S', 'C', 2);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('TICKET003', TO_DATE('2023-10-06', 'YYYY-MM-DD'), NULL, 'Reporte de problema en la aplicación', 'P', 'A', 3);

--PQRSRESPUESTA

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('PQRS001', TO_DATE('2023-10-04', 'YYYY-MM-DD'), NULL, 'Problema con la entrega de un pedido', 'R', 'A', 1);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('PQRS002', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'Solicitud de información sobre un producto', 'S', 'C', 2);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('PQRS003', TO_DATE('2023-10-06', 'YYYY-MM-DD'), NULL, 'Reporte de problema en la aplicación móvil', 'P', 'A', 3);


--PoblarNoOK

--Vehiculos

--En este insert usamos NULL en el valor a_0 por lo tanto este valor no se puede agregar a la tabla
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('ABC123', NULL, 'A', 'A', 4, 5, NULL, NULL);

--los valores de tipo y estado deberian ser char de longuitud 1
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('XYZ789', 2019, 'Bb', 'Aa', 2, 2, 500, '123456789');

--El valor de puertas debe ser un entero
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('PQR456', 2021, 'C', 'I', cuatro, 7, NULL, NULL);

--PQRSRESPUESTA

--Valor de fecha no puede ser nulo
INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES (NULL, TO_DATE('2023-10-04', 'YYYY-MM-DD'), NULL, 'Problema con la entrega de un pedido', 'R', 'A', 1);

--
INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('PQRS002',NULL, TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'Solicitud de información sobre un producto', 'S', 'C', 2);

--Escriban cinco casos de inserción que no deberían permitirse y todavía se permiten.
--Documenten lo que desean validar. Traten de ilustrar lo más significativo.

-- PoblarNoOK (2)       

--Restricción: ALTER TABLE VEHICULOS ADD CONSTRAINT check_año_nacimiento CHECK (a_0 <= 1900);
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('ABC123', 2022, 'A', 'A', 4, 5, 1000, '123456789');

--Restricción: ALTER TABLE VEHICULOS ADD CONSTRAINT restriccion_nombre CHECK (estado IN ('A', 'I', 'R', 'O'));
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('XYZ789', 2019, 'B', 'X', 2, 2, 500, '123456789');

--Restricción: ALTER TABLE VEHICULOS ADD CONSTRAINT check_puertas CHECK (puertas > 0);
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('PQR456', 2021, 'C', 'A', 0, 7, 500, '987654321');

--Restricción: ALTER TABLE VEHICULOS ADD CONSTRAINT check_pasajeros CHECK (pasajeros > 0);
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('LMN789', 2020, 'D', 'A', 4, 0, 800, '567890123');

--Restricción: ALTER TABLE VEHICULOS ADD CONSTRAINT check_carga CHECK (carga > 0);
INSERT INTO VEHICULOS (placa, a_0, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('JKL456', 2022, 'E', 'A', 2, 2, -100, '234567890');

-- PoblarNoOK (2)

--XPoblar

INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('1', 'CE', '0432904719', 'Burt Littlechild', '17-Sep-2023', '635344391', 'blittlechild0@issuu.com', 'Lithuanian');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('2', 'TI', '0229216781', 'Doyle Clelland', '25-May-2023', '564379294', 'dclelland1@alibaba.com', 'Dari');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('3', 'CE', '6259525451', 'Damiano MacFadyen', '17-Jun-2023', '750874711', 'dmacfadyen2@xrea.com', 'Bengali');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('4', 'CC', '3460296194', 'Byrom Stanman', '13-Mar-2023', '489271549', 'bstanman3@msu.edu', 'Guaraní');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('5', 'PS', '7238284596', 'Joline Damiral', '04-Jun-2023', '271100204', 'jdamiral4@php.net', 'West Frisian');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('6', 'CE', '3965174347', 'Dennet Cornels', '03-Sep-2023', '479563676', 'dcornels5@java.com', 'Latvian');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('7', 'PS', '3411842776', 'Frank Maffetti', '05-Mar-2023', '519597652', 'fmaffetti6@craigslist.org', 'Tajik');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('8', 'TI', '1372064672', 'Boycey Jennions', '25-Mar-2023', '319173881', 'bjennions7@odnoklassniki.ru', 'Pashto');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('9', 'CE', '0078659167', 'Davide Proschke', '25-Jul-2023', '962404566', 'dproschke8@yellowbook.com', 'Czech');
INSERT INTO CLIENTES (id_cliente, tipo, numero, nombre, registro, celular, correo, idioma) VALUES ('10', 'TI', '3240016303', 'Hewitt MacPhee', '11-Feb-2023', '745845956', 'hmacphee9@cdbaby.com', 'Tajik');



