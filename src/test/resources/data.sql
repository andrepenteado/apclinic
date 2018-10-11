---------------------------------------------------------

INSERT INTO Usuario (Login, Senha, Nome) VALUES ('admin', '$2a$10$YhKo.xR5mshUQqu4NOS/XuWQKKbEVAokBjHRhAAQI25dd3evoiGIi', 'Administrador');
INSERT INTO Perfil_Usuario (Id_Usuario, Perfil) VALUES (LASTVAL(), 'Administrador');

---------------------------------------------------------