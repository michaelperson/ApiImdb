﻿/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
USE MovieDB

INSERT INTO Person VALUES ('Hammil', 'Mark')
INSERT INTO Person VALUES ('Ford', 'Harisson')
INSERT INTO Person VALUES ('Fisher', 'Carrie')
INSERT INTO Person VALUES ('Lucas', 'George')
INSERT INTO Person VALUES ('Spielberg', 'Steven')
INSERT INTO Person VALUES ('Kershner', 'Irvin')
INSERT INTO Person VALUES ('Kasdan', 'Lawrence')

INSERT INTO Movie VALUES ('Star Wars - A New Hope', 'Space Opera', 1977, 4, 4)
INSERT INTO Movie VALUES ('Star Wars - Empire Strikes Back', 'Space Opera', 1979, 4, 6)
INSERT INTO Movie VALUES ('Indiana Jones - Cursed temple', 'Aventure', 1981, 5, 7)

INSERT INTO Actor VALUES (1, 1, 'Luke Skywalker')
INSERT INTO Actor VALUES (2, 1, 'Han Solo')
INSERT INTO Actor VALUES (3, 1, 'Leia Organa')
INSERT INTO Actor VALUES (1, 2, 'Luke Skywalker')
INSERT INTO Actor VALUES (2, 2, 'Han Solo')
INSERT INTO Actor VALUES (3, 2, 'Leia Organa')
INSERT INTO Actor VALUES (2, 3, 'Indiana Jones')

INSERT INTO [User] VALUES ('steve.lorent@bstorm.be', 'test1234', 'Steve', 'Lorent', '1983-06-28', 1, 1)
INSERT INTO [User] VALUES ('test@test.com', 'test1234', 'Test', 'Truc', '1992-03-12', 1, 0)

INSERT INTO Comment VALUES('Super film pour vieux geek', '2020-10-10', 1, 1)
INSERT INTO Comment VALUES('LE meilleur film de sci-fi de tout les temps', '2020-10-10', 1, 2)
INSERT INTO Comment VALUES('Je préfère le 3 :p', '2020-10-10', 2, 3)

SELECT a.Role, p.FirstName, p.LastName, m.Title, (SELECT FirstName+ ' ' +LastName FROM Person WHERE Id = m.RealisatorID) as 'Real' 
FROM Person p 
	JOIN Actor a ON a.PersonID = p.Id 
	Join Movie m ON a.MovieID = m.Id 
WHERE a.MovieID = 2

SELECT u.Email, Content FROM Comment JOIN [User] u ON UserID = u.Id WHERE MovieID = 2
