DROP DATABASE IF EXISTS sportwavedb;
CREATE DATABASE IF NOT EXISTS sportwavedb;
USE sportwavedb;

CREATE TABLE produto (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT NOT NULL,
  marca VARCHAR(100) NOT NULL,
  modelo VARCHAR(100),
  preco DECIMAL(10, 2) NOT NULL,
  capa VARCHAR(255),
  data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
  destaque BOOLEAN DEFAULT FALSE,
  esporte ENUM('Beach Tennis', 'Vôlei de Praia', 'Surf') NOT NULL,
  categoria ENUM('Roupas', 'Acessórios')  
);

create table usuario(
  id int unsigned primary key auto_increment,
  nome VARCHAR(255) NOT NULL,
  email varchar(255) not null
);

create table pedido (
	id int unsigned primary key auto_increment,
    metodo_pagamento VARCHAR(45) NOT NULL,
    data date,
    nome VARCHAR(255) NOT NULL,
    email varchar(255) not null,
    constraint fk_pedidoid foreign key (id) references usuario(id)
);


CREATE TABLE avaliacao (
  nota INT,
  produto_id INT UNSIGNED,
  usuario_id INT UNSIGNED,
  CONSTRAINT fk_avaliacao_produto FOREIGN KEY (produto_id) REFERENCES produto(id),
  CONSTRAINT fk_avaliacao_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE favorito (
  produto_id INT UNSIGNED,
  usuario_id INT UNSIGNED,
  CONSTRAINT fk_favorito_produto FOREIGN KEY (produto_id) REFERENCES produto(id),
  CONSTRAINT fk_favorito_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE carrinho (
  quantidade INT,
  usuario_id INT UNSIGNED,
  produto_id INT UNSIGNED,
  CONSTRAINT fk_carrinho_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  CONSTRAINT fk_carrinho_produto FOREIGN KEY (produto_id) REFERENCES produto(id)
);

CREATE TABLE compras (
  preco VARCHAR(45),
  quantidade VARCHAR(45),
  pedido_id INT UNSIGNED,
  produto_id INT UNSIGNED,
  CONSTRAINT fk_compras_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id),
  CONSTRAINT fk_compras_produto FOREIGN KEY (produto_id) REFERENCES produto(id)
);


CREATE TABLE foto (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  caminho VARCHAR(45),
  capa TINYINT,
  produto_id INT UNSIGNED,
  CONSTRAINT fk_foto_produto FOREIGN KEY (produto_id) REFERENCES produto(id)
);



show tables;

-- INSERT INTO produto (nome, descricao, marca, modelo, preco, capa, destaque, esporte, categoria) VALUES
-- ('Raquete de Beach Tennis', 'Raquete profissional para jogos de Beach Tennis', 'Wilson', 'Pro Staff', 199.99, 'raquete.jpg', TRUE, 'Beach Tennis', 'Acessórios'),
-- ('Bola de Vôlei de Praia', 'Bola oficial de vôlei de praia', 'Mikasa', 'VLS300', 49.99, 'bola.jpg', FALSE, 'Vôlei de Praia', 'Acessórios'),
-- ('Prancha de Surf', 'Prancha de alta performance para surfistas avançados', 'Channel Islands', 'Fred Stubble', 699.99, 'prancha.jpg', TRUE, 'Surf', 'Acessórios'),
-- ('Shorts de Praia', 'Shorts de praia confortável e resistente', 'Quiksilver', NULL, 39.99, 'shorts.jpg', FALSE, 'Beach Tennis', 'Roupas'),
-- ('Óculos de Sol', 'Óculos de sol polarizados com proteção UV', 'Oakley', 'Holbrook', 129.99, 'oculos.jpg', FALSE, 'Surf', 'Acessórios'),
-- ('Camiseta de Praia', 'Camiseta de tecido leve e respirável para praia', 'Billabong', NULL, 29.99, 'camiseta.jpg', TRUE, 'Vôlei de Praia', 'Roupas'),
-- ('Meião Esportivo', 'Meião de compressão para práticas esportivas', 'Nike', NULL, 19.99, 'meiao.jpg', FALSE, 'Beach Tennis', 'Acessórios'),
-- ('Protetor Solar', 'Protetor solar com fator de proteção 50', 'Nivea', NULL, 14.99, 'protetor.jpg', FALSE, 'Surf', 'Acessórios'),
-- ('Boné Esportivo', 'Boné ajustável para proteção solar', 'Under Armour', NULL, 24.99, 'bone.jpg', TRUE, 'Vôlei de Praia', 'Acessórios'),
-- ('Toalha de Praia', 'Toalha de praia macia e absorvente', 'Roxy', NULL, 34.99, 'toalha.jpg', FALSE, 'Beach Tennis', 'Acessórios');

-- SELECT * FROM produto;