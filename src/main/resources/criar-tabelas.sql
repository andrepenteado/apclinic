CREATE TABLE Usuario
(
  Id    SERIAL,
  Login VARCHAR(50)  NOT NULL,
  Senha VARCHAR(100) NOT NULL,
  Nome  VARCHAR(100) NOT NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (Id)
);

CREATE TABLE Perfil_Usuario
(
  Id         SERIAL,
  Id_Usuario INTEGER     NOT NULL,
  Perfil     VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Perfil_Usuario PRIMARY KEY (Id),
  FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Usuario (Login, Senha, Nome) VALUES ('admin', '$2a$10$YhKo.xR5mshUQqu4NOS/XuWQKKbEVAokBjHRhAAQI25dd3evoiGIi', 'Administrador');
INSERT INTO Perfil_Usuario (Id_Usuario, Perfil) VALUES (CURRVAL('Usuario_Id_Seq'), 'PERFIL_ADMINISTRADOR');