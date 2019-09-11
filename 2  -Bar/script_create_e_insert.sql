CREATE DATABASE BDBar;
GO

USE BDBar;
GO

CREATE SCHEMA Bar;
GO

CREATE TABLE Bar.Vendedor
(
	Id INT IDENTITY(1,1),
	Nome NVARCHAR(50) NOT NULL,
	Salario MONEY CHECK(Salario > 724)
);

ALTER TABLE Bar.Vendedor 
	ADD PRIMARY KEY (Id);

CREATE TABLE Bar.ContaBar
(
	Id INT IDENTITY(1,1),
	IdVendedor INT NOT NULL,
	NumMesa INT NOT NULL,
);

ALTER TABLE Bar.ContaBar 
	ADD PRIMARY KEY (Id);

CREATE TABLE Bar.ProdutosCompra
(
	Id INT IDENTITY(1,1),
	IdContaBar INT NOT NULL,
	NomeProduto NVARCHAR(50),
	Quantidade INT NOT NULL,
	ValorUnitario MONEY NOT NULL
);

ALTER TABLE Bar.ProdutosCompra 
	ADD PRIMARY KEY (Id);

ALTER TABLE Bar.ContaBar 
	ADD FOREIGN KEY (IdVendedor) REFERENCES Bar.Vendedor(Id);

ALTER TABLE Bar.ProdutosCompra 
	ADD FOREIGN KEY (IdContaBar) REFERENCES Bar.ContaBar(Id);

CREATE NONCLUSTERED INDEX NCIX_ProdutosCompra_IdContaBar 
	ON Bar.ProdutosCompra(IdContaBar);

INSERT INTO Bar.Vendedor (Nome, Salario) VALUES ('Andre', 800);
INSERT INTO Bar.Vendedor (Nome, Salario) VALUES ('Pedro', 950);
INSERT INTO Bar.Vendedor (Nome, Salario) VALUES ('Leandro', 800);
INSERT INTO Bar.Vendedor (Nome, Salario) VALUES ('Alexandre', 950);
INSERT INTO Bar.Vendedor (Nome, Salario) VALUES ('Ricardo', 800);
INSERT INTO Bar.Vendedor (Nome, Salario) VALUES ('Alvaro', 1500);

INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (1,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (2,13);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (3,14);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (4,15);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (5,16);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (1,16);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (2,15);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (3,14);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (4,13);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (5,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (1,11);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (2,16);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (3,16);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (4,16);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (5,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (2,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (3,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (4,13);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (5,11);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (2,18);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (3,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (4,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (5,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (2,12);
INSERT INTO Bar.ContaBar (IdVendedor, NumMesa) VALUES (3,12);

INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (1,'Chandon',2,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (2,'Smirnoff Ice',5,10);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (3,'Smirnoff Ice',5,10);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (4,'Chandon',1,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (5,'Smirnoff Ice',6,10);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (6,'Keineken',10,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (7,'Chandon',3,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (8,'Keineken',12,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (9,'Chandon',4,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (10,'Smirnoff Ice',10,10);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (11,'Keineken',18,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (12,'Chandon',2,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (13,'Smirnoff Ice',5,10);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (14,'Keineken',12,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (15,'Keineken',11,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (16,'Smirnoff Ice',4,10);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (17,'Chandon',2,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (18,'Keineken',23,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (19,'Keineken',21,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (20,'Keineken',12,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (21,'Keineken',34,6);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (22,'Chandon',4,250);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (23,'Skol',25,5);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (24,'Skol',28,5);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (25,'Skol',24,5);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (1,'Red Label',2,300);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (1,'Água',15,3);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (1,'Suco',4,8);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (1,'Red Bull',4,15);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (2,'Red Label',1,300);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (3,'Red Label',2,300);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (3,'Água',12,3);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (3,'Red Bull',8,15);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (4,'Red Label',9,300);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (4,'Água',15,3);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (4,'Red Bull',6,15);
INSERT INTO Bar.ProdutosCompra (IdContaBar, NomeProduto, Quantidade, ValorUnitario) VALUES (4,'Caipirinha',8,10);

SELECT * FROM Bar.Vendedor;

SELECT * FROM Bar.ContaBar;

SELECT * FROM Bar.ProdutosCompra;

SELECT IdContaBar, SUM(ValorUnitario * Quantidade) AS ValorConta FROM Bar.ProdutosCompra 
	GROUP BY IdContaBar;

SELECT IdContaBar, Nome, SUM(ValorUnitario * Quantidade) AS ValorConta FROM Bar.ProdutosCompra p
	INNER JOIN Bar.ContaBar c ON p.IdContaBar = c.Id
	INNER JOIN Bar.Vendedor v ON c.IdVendedor = v.Id
	GROUP BY IdContaBar, Nome;

SELECT Nome, SUM(ValorUnitario * Quantidade) AS ValorConta FROM Bar.ProdutosCompra p
	INNER JOIN Bar.ContaBar c ON p.IdContaBar = c.Id
	INNER JOIN Bar.Vendedor v ON c.IdVendedor = v.Id
	GROUP BY Nome;

