CREATE DATABASE fornecedor_produto;
USE fornecedor_produto;
CREATE TABLE fornecedor(
	cod_fornecedor BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome_fornecedor VARCHAR(200) NOT NULL,
	telefone_fornecedor CHAR(14) NOT NULL,
	endereco_fornecedor VARCHAR(200) NOT NULL
);
CREATE TABLE produto(
	cod_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(100) NOT NULL UNIQUE
	/*dt_validade_produto DATE NOT NULL*/
);
CREATE TABLE usuario(
	cod_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
	login_usuario VARCHAR(100) NOT NULL,
	senha_usuario VARCHAR(100) NOT NULL,
	nivel_acesso_usuario INT(10) NOT NULL,
	cod_fornecedor BIGINT NOT NULL,
	FOREIGN KEY (cod_fornecedor) REFERENCES fornecedor(cod_fornecedor)
);
CREATE TABLE fornecimento(
	cod_fornecimento BIGINT AUTO_INCREMENT PRIMARY KEY,
	cod_fornecedor BIGINT NOT NULL,
	cod_produto BIGINT NOT NULL,
	FOREIGN KEY (cod_fornecedor) REFERENCES fornecedor(cod_fornecedor),
	FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto)
);
INSERT INTO fornecedor(nome_fornecedor, telefone_fornecedor, endereco_fornecedor) VALUES
('José Fino alimentos de matar', '(11)96032-5595', 'Cep: 08134-020, Complemento: galpão, número: 0'), 
('Josefina alimentos fitness', '(11)96032-5995', 'Cep: 08133-020, Complemento: galpão, número: 0'),
('João Gigante Feijões', '(11)96032-5955', 'Cep: 08132-020, Complemento: galpão, número: 0');
INSERT INTO produto(nome_produto) VALUES 
('Pimenta-mata-defunto'),
('Pé-de-galinha'),
('Feijões-mágicos');
INSERT INTO fornecimento(cod_fornecedor, cod_produto) VALUES 
(1, 1), 
(2, 2),
(3, 3);
INSERT INTO usuario(login_usuario, senha_usuario, nivel_acesso_usuario, cod_fornecedor) VALUES 
('esqueleto1234', '1234', 1, 1),
('olivia_palito', '4321', 1, 2),
('ursinho_carinhoso001', 'AppleJack', 1, 2);
ALTER TABLE produto DROP COLUMN dt_validade_produto;
DROP DATABASE fornecedor_produto;