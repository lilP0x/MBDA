CREATE TABLE Persona(
    id_clientes     INT,  
    CHECK (id_clientes = 9),
    tipo    varchar, -- no se que tipo de dato es.
    numero  varchar(10),
    nombre  varchar (50),
    registro date,
    celular INT, 
    CHECK(celular = 10),
    correo varchar -- no se que tipo de dato es.
    
    );