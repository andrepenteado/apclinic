DROP TABLE IF EXISTS Usuario CASCADE;
CREATE TABLE Usuario
(
  Id    BIGSERIAL,
  Login VARCHAR    NOT NULL,
  Senha VARCHAR    NOT NULL,
  Nome  VARCHAR    NOT NULL,
  CONSTRAINT PK_Usuario       PRIMARY KEY (Id),
  CONSTRAINT UN_Usuario_Login UNIQUE (Login)
);

--------------------------------------------------------

DROP TABLE IF EXISTS Perfil_Usuario CASCADE;
CREATE TABLE Perfil_Usuario
(
  Id         BIGSERIAL,
  Id_Usuario BIGINT     NOT NULL,
  Perfil     VARCHAR    NOT NULL,
  CONSTRAINT PK_Perfil_Usuario        PRIMARY KEY (Id),
  CONSTRAINT UN_PerfilUsuario_PerfilIdUsuario UNIQUE (Perfil, Id_Usuario),
  CONSTRAINT FK_PerfilUsuario_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id) ON UPDATE RESTRICT ON DELETE RESTRICT
);

---------------------------------------------------------

INSERT INTO Usuario (Login, Senha, Nome) VALUES ('admin', '$2a$10$YhKo.xR5mshUQqu4NOS/XuWQKKbEVAokBjHRhAAQI25dd3evoiGIi', 'Administrador');
INSERT INTO Perfil_Usuario (Id_Usuario, Perfil) VALUES (CURRVAL('Usuario_Id_Seq'), 'PERFIL_ADMINISTRADOR');