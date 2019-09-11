DROP DATABASE Biblioteca;
GO

CREATE DATABASE Biblioteca;
GO

USE Biblioteca;

-- Tabela de Livros

IF NOT EXISTS (SELECT*FROM sysobjects WHERE name='Livros' and xtype='U')
	CREATE TABLE Livros(
		ISBN nvarchar(30) PRIMARY KEY,
		NomeLivro nvarchar(50) not null,
		Autor nvarchar(50)not null,
		Edicao nvarchar(20) null,
		QntdExemplares int not null
	);

-- Tabela de Usuario

IF NOT EXISTS (SELECT*FROM sysobjects WHERE name='Usuario' and xtype='U')
	CREATE TABLE Usuario(
		Cpf BIGINT PRIMARY KEY,
		Nome nvarchar(70) not null,
		Perfil varchar(15) not null,
		Email nvarchar(40) not null,
		Senha varbinary(100) not null,
		VIP bit not null
	);
							-- Tabela de Emprestimo

IF NOT EXISTS (SELECT*FROM sysobjects WHERE name='Emprestimo' and xtype='U')
	CREATE TABLE Emprestimo(
		Id INT PRIMARY KEY IDENTITY (1,1),
		IdBook nvarchar(30),
		IdUser BIGINT,
		HorarioDevolucao DateTime,
		HorarioEmprestimo DateTime,
		FOREIGN KEY (IdBook) REFERENCES Livros(ISBN),
		FOREIGN KEY (IdUser) REFERENCES Usuario(Cpf)
		);

							-- Dados dos Usuarios

INSERT INTO Usuario
	(Cpf,Nome,Perfil,Email,Senha,VIP)
VALUES
	(15395185214,'Lucas Serejo','Professor','ziba@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),1),
	(27852356801,'Jonas Dog Mau','Aluno','johnmau@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(37852356801,'Eduardo Tafarel','Visitante','GoodGame@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(47852356801,'Guilherme Peter','Aluno','PeterPan@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(57852356801,'Karen Fiusa','Visitante','YellowToth@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(67852356801,'Davi Kinbar','Aluno','FlwGolias@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(77852356801,'Flavia Hortelan','Aluno','fla.balinha@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(87852356801,'Afred Batold','Professor','Fred25@hotmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),0),
	(97852356801,'Delcimario Alves','Professor','Wenoha@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),1),
	(10852356801,'Gabriela Barbosa','Professor','Gabibi@gmail.com',EncryptByPassPhrase('123456', 'Kaynzada?'),1);

SELECT Cpf, Nome, Perfil as Categoria, Email, convert(varchar(100), DecryptByPassPhrase('123456', Senha)) AS SenhaDescriptografada FROM Usuario
ORDER BY Nome;

							-- Dados do Livros

INSERT INTO Livros
	(ISBN, NomeLivro, Autor, Edicao, QntdExemplares)
VALUES
	('530R434f5.ed','Fisica 1','Robert Resnick','5 ed.',5),
	( '512 G925', 'Algebra 1','Cid Augusto Guelli; Gelson Iezzi; Osvaldo Dolce','3 ed.',5),
	('723 34G', 'Geometria Analitica','Paulo Winterlle','4 ed.',5),
	('213 65j', 'Mecanica dos solidos 1', 'Norman Douling', '7 ed.',5),
	('219 5t3', 'Quimica geral', 'Atkins e Jones', '5 ed.',5),
	('9635g 56', 'Algebra Linear', 'Boldrini', '8 ed.',5),
	('234o 43d', 'Geologia', 'Nivaldo Chiossi', '7 ed.',5),
	('6483u', 'Calculo numerico', ' Vera Lucia da Rocha Lopes', '2 ed.',5),
	('3a2r 125', 'Calculo diferencial e integral 1', 'James Stweart', '8 ed.',5),
	( '675b 23q', 'Filosofia', 'Antonio Carlos Gil', '1 ed.',5);

GO

						-- Dados de Emprestimo de livros
INSERT INTO Emprestimo
	(IdBook, IdUser, HorarioEmprestimo)
VALUES
	('530R434f5.ed', 87852356801, CURRENT_TIMESTAMP),
	('530R434f5.ed', 37852356801, CURRENT_TIMESTAMP),
	('213 65j', 87852356801, CURRENT_TIMESTAMP),
	('530R434f5.ed', 27852356801, CURRENT_TIMESTAMP),
	('213 65j', 87852356801, CURRENT_TIMESTAMP),
	('530R434f5.ed', 27852356801, CURRENT_TIMESTAMP),
	('213 65j', 87852356801, CURRENT_TIMESTAMP),
	('213 65j', 37852356801, CURRENT_TIMESTAMP),
	('530R434f5.ed', 87852356801, CURRENT_TIMESTAMP),
	('213 65j', 27852356801, CURRENT_TIMESTAMP);

INSERT INTO Emprestimo
	(IdBook, IdUser, HorarioEmprestimo)
VALUES
	('530R434f5.ed', 10852356801, CURRENT_TIMESTAMP);

SELECT IdUser FROM Emprestimo Where HorarioDevolucao is null;

UPDATE Emprestimo set HorarioDevolucao = CURRENT_TIMESTAMP where Id= 7;

SELECT HorarioDevolucao, COUNT(*) AS Quantidade From Emprestimo where HorarioDevolucao is not null
GROUP BY HorarioDevolucao;

SELECT IdBook, COUNT(*) AS Quantidade FROM Emprestimo where HorarioDevolucao is null
GROUP BY IdBook;

SELECT u.Nome, COUNT(*) AS Quantidade FROM Emprestimo
	INNER JOIN Usuario u ON IdUser = u.Cpf
	where HorarioDevolucao is null
	GROUP BY u.nome;

SELECT Nome, COUNT(*) AS Quantidade FROM Emprestimo
	INNER JOIN Usuario d ON IdUser = d.Cpf
	where VIP != 1 and HorarioDevolucao is null
	GROUP BY Nome;