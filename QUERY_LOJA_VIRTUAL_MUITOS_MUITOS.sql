----CREATE DATABASE BD_LOJA_VIRTUAL
----GO

CREATE TABLE tb_produto(
	idProduto INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	produto VARCHAR (200) NOT NULL,
	valor FLOAT NOT NULL
)

CREATE TABLE tb_descricao_tecnica(
	idDescricao INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	fk_idProduto INT NOT NULL,
	FOREIGN KEY (fk_idProduto) REFERENCES tb_produto(idProduto),
	descricao TEXT NOT NULL
)

CREATE TABLE tb_imagens (
	idImagem INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	fk_idProduto INT NOT NULL,
	FOREIGN KEY (fk_idProduto) REFERENCES tb_produto(idProduto),
	urlImagem VARCHAR (100) NOT NULL
)

CREATE TABLE tb_clientes (
	idCliente INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	nome VARCHAR (20) NOT NULL,
	idade INT NOT NULL
)

CREATE TABLE tb_pedidos (
	idPedido INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	data_hora DATETIME NOT NULL,
	fk_idCliente INT NOT NULL,
	FOREIGN KEY (fk_idCliente) REFERENCES tb_clientes(idCliente)
)

--TABELA CRIADA POIS A RELAÇÃO DE PEDIDOS E PRODUTOS É DE MUITOS PARA MUITOS
CREATE TABLE tb_pedido_produto(
	fk_idPedido INT NOT NULL,
	FOREIGN KEY (fk_idPedido) REFERENCES tb_pedidos(idPedido),
	fk_idProduto INT NOT NULL,
	FOREIGN KEY (fk_idProduto) REFERENCES tb_produto(idProduto)
)


--INSERT INTO tb_produto(produto, valor) VALUES
--('Notebook Acer i7, 16GB RAM SSD', 3500.00),
--('Smart TV LED 40', 1470.00),
--('Smartphone Iphone 13 PRO', 7000.00)

--INSERT INTO tb_descricao_tecnica (fk_idProduto, descricao) VALUES 
--(1, 'Um novo notebook para a garotada, roda até jogo de guerra...'),
--(2, 'Uma TV para a família toda ver Rio Shore...'),
--(3, 'Um celular mais caro que um carro...')

--INSERT INTO tb_imagens(fk_idProduto, urlImagem) VALUES 
--(1, 'notebook_1.jpg'),
--(1, 'notebook_2.jpg'),
--(1, 'notebook_3.jpg'),
--(2, 'smarttv_1.jpg'), 
--(2, 'smarttv_2.jpg'),
--(3, 'smartphone_1.jpg')

--INSERT INTO tb_clientes (nome, idade) VALUES 
--('Pedro', 19),
--('Diego', 14)

--INSERT INTO tb_pedidos (fk_idCliente, data_hora) VALUES
--(1, '2023-03-02')

--INSERT INTO tb_pedido_produto (fk_idPedido, fk_idProduto) VALUES 
--(1, 1)



--SELECT * FROM tb_produto

--SELECT * FROM tb_descricao_tecnica

--SELECT * FROM tb_imagens

--SELECT * FROM tb_pedidos

--SELECT * FROM tb_clientes

--SELECT * FROM tb_pedido_produto

