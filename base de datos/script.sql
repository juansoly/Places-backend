
CREATE TABLE lugares (
                id_lugares INT NOT NULL,
                nombre VARCHAR(200) NOT NULL,
                descripcion VARCHAR(500) NOT NULL,
                provincia VARCHAR(100) NOT NULL,
                direccion VARCHAR(100) NOT NULL,
                longitud DECIMAL NOT NULL,
                latitud DECIMAL NOT NULL,
                municipio VARCHAR(100) NOT NULL,
                departamento VARCHAR(100) NOT NULL,
                url VARCHAR(200) NOT NULL,
                PRIMARY KEY (id_lugares)
);


CREATE TABLE horarios (
                id_horario INT NOT NULL,
                dia VARCHAR(50) NOT NULL,
                inicio TIME NOT NULL,
                fin TIME NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_horario)
);


CREATE TABLE funcionalidades (
                id_funcionalidades INT NOT NULL,
                nombre VARCHAR(50),
                PRIMARY KEY (id_funcionalidades)
);


CREATE TABLE roles (
                ir_rol INT NOT NULL,
                nombre VARCHAR(100),
                PRIMARY KEY (ir_rol)
);


CREATE TABLE privilegios (
                ir_rol INT NOT NULL,
                id_funcionalidades INT NOT NULL,
                PRIMARY KEY (ir_rol, id_funcionalidades)
);


CREATE TABLE personas (
                id_personas INT NOT NULL,
                nombres VARCHAR(100) NOT NULL,
                primer_apellido VARCHAR(100) NOT NULL,
                segundo_apellido VARCHAR(100),
                ci INT NOT NULL,
                complemento VARCHAR(2),
                fecha_nacimiento DATE NOT NULL,
                genero VARCHAR(50) NOT NULL,
                direccion VARCHAR(200) NOT NULL,
                telefono_fijo INT,
                celular INT,
                email VARCHAR(100) NOT NULL,
                PRIMARY KEY (id_personas)
);


CREATE TABLE usuarios (
                id_personas INT NOT NULL,
                usuario VARCHAR(50) NOT NULL,
                rol VARCHAR(50) NOT NULL,
                contrasena VARCHAR(200) NOT NULL,
                PRIMARY KEY (id_personas)
);


CREATE UNIQUE INDEX usuarios_idx
 ON usuarios
 ( usuario );

CREATE TABLE comentarios (
                id_comentarios INT NOT NULL,
                comentario VARCHAR(500) NOT NULL,
                calificacion INT NOT NULL,
                fecha_de_comentario DATE NOT NULL,
                id_recomentarios INT NOT NULL,
                id_personas INT NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_comentarios)
);


CREATE TABLE fotos (
                id_fotos INT NOT NULL,
                url VARCHAR(300) NOT NULL,
                descripcion VARCHAR(200) NOT NULL,
                id_comentarios INT NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_fotos)
);


CREATE TABLE cuentas (
                ir_rol INT NOT NULL,
                id_personas INT NOT NULL,
                PRIMARY KEY (ir_rol, id_personas)
);


CREATE TABLE favoritos (
                id_personas INT NOT NULL,
                id_lugares INT NOT NULL,
                PRIMARY KEY (id_personas, id_lugares)
);


ALTER TABLE horarios ADD CONSTRAINT lugares_horarios_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT lugares_fotos_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT lugares_comentarios_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT lugares_favoritos_fk
FOREIGN KEY (id_lugares)
REFERENCES lugares (id_lugares)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT funcionalidades_privilegios_fk
FOREIGN KEY (id_funcionalidades)
REFERENCES funcionalidades (id_funcionalidades)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE privilegios ADD CONSTRAINT roles_privilegios_fk
FOREIGN KEY (ir_rol)
REFERENCES roles (ir_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT roles_cuentas_fk
FOREIGN KEY (ir_rol)
REFERENCES roles (ir_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE usuarios ADD CONSTRAINT personas_usuarios_fk
FOREIGN KEY (id_personas)
REFERENCES personas (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE favoritos ADD CONSTRAINT usuarios_favoritos_fk
FOREIGN KEY (id_personas)
REFERENCES usuarios (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE cuentas ADD CONSTRAINT usuarios_cuentas_fk
FOREIGN KEY (id_personas)
REFERENCES usuarios (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT usuarios_comentarios_fk
FOREIGN KEY (id_personas)
REFERENCES usuarios (id_personas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fotos ADD CONSTRAINT comentarios_fotos_fk
FOREIGN KEY (id_comentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comentarios ADD CONSTRAINT comentarios_comentarios_fk
FOREIGN KEY (id_recomentarios)
REFERENCES comentarios (id_comentarios)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
