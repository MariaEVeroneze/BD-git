CREATE DATABASE bdEstoque

USE bdEstoque

CREATE TABLE tbFabricante(
    codFabricante INT PRIMARY KEY IDENTITY(1,1)
    ,nomeFabricante VARCHAR(40) NOT NULL
)

CREATE TABLE tbFornecedor(
    codFornecedor INT PRIMARY KEY IDENTITY(1,1)
    ,nomeFornecedor VARCHAR(40) NOT NULL
    ,contatoFornecedor VARCHAR(20) NOT NULL
)

CREATE TABLE tbProduto(
    codProduto INT PRIMARY KEY IDENTITY(1,1)
    ,decricaoProduto VARCHAR(55) NOT NULL
    ,valorProduto SMALLMONEY NOT NULL
    ,qtdProduto INT NOT NULL
    ,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante) 
    ,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
)

CREATE TABLE tbCliente(
    codCliente INT PRIMARY KEY IDENTITY(1,1)
    ,nomeCliente VARCHAR(40) NOT NULL
    ,cpfCliente VARCHAR(12) NOT NULL
    ,emailCliente VARCHAR(55)
    ,sexoCliente VARCHAR(1)
    ,dtNascimentoCliente SMALLDATETIME NOT NULL
)

CREATE TABLE tbVenda(
    codVenda INT PRIMARY KEY IDENTITY(1,1)
    ,dtVenda SMALLDATETIME NOT NULL
    ,valorTotalVenda MONEY NOT NULL
    ,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbItensVenda(
    codItensVenda INT PRIMARY KEY IDENTITY(1,1)
    ,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
    ,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,qtdItensVenda INT NOT NULL 
    ,subTotalItensVenda SMALLMONEY NOT NULL
)