CREATE DATABASE RequestDB;
GO

USE RequestDB;
GO

CREATE TABLE Requests (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(50) NOT NULL,
    RequestText NVARCHAR(500) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO Requests (UserName, RequestText) VALUES 
    ('Артём', 'Не работает кнопка "Звонок"'),
    ('Максим', 'Хочу добавить новый документ');
GO
