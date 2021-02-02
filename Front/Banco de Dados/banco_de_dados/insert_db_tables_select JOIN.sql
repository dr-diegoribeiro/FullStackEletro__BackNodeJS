create database fullstack_ultimate
default character set utf8
default collate utf8_bin;

use fullstack_ultimate;


create table if not exists produtos(
id_produtos integer auto_increment not null,
categoria varchar (200),
descricao varchar (400),
preco varchar (50),
preco_final varchar (50),
imagem varchar (200),
primary key (id_produtos)
)default charset = utf8;

insert into produtos (categoria, descricao, preco, preco_final, imagem) values 
('geladeira', 'Geladeira Grost Brastemp Side Inverse 375L', '3.389,00', '2.899,00', 'geladeira.jpg'),
('geladeira', 'Geladeira Brastemp Side Porta Dupla 540L', '6.389,00', '5.019,00', 'geladeira 2.jpg'),
('geladeira', 'Geladeira Brastemp 540L 2P Suporte para Água', '7.389,00', '6.019,00', 'geladeira 3.jpg'),
('fogao', 'Fogao 4 bocas Eletrolux com Mesa de Vidro',	'1.299,00',	'1.059,00',	'fogao 2.jpg'),
('fogao', 'Fogão Brastemp Preto 6 Bocas de Vidro',	'3.389,00',	'3.000,00',	'Fogao 22.jpg'),
('microondas',	'Microondas 25L Espelhado Eletrolux 220V',	'509,00',	'450,00',	'microondas.jpg'),
('microondas',	'Microondas Tabajara 20L Cromado Automático', '320,00',	'290,00',	'microondas 2.jpg'),
('microondas',	'Microondas Philco 25L Branco Espelhado',	'320,00',	'290,00',	'microondas33.jpg'),
('lavaroupas',	'Lava e Seca Roupas Samsung Ecobubble 15kg',	'4.150,00',	'3.900,00',	'Lavaroupas.jpg'),
('lavaroupas',	'Máquina de Lavar Brastemp Advanced 12Kg',	'2.509,00',	'2.100,00',	'lava roupas 2.jpg'),
('lavaloucas',	'Lava Louças Brastemp - 14 Serviços',	'4.100,00',	'3.690,00',	'lava loucas.jpg'),
('lavaloucas',	'Lava Louças Brastemp 10 Serviços - 220V',	'3.690,00',	'3.290,00',	'lava loucas 2.jpg');



-- Crianção de ambiente de pedidos para avaliação da aplicação do JOIN em BD: 


create table cliente 
(id_cli integer auto_increment not null, 
nome_cli varchar(40), 
telefone varchar(30),
endereco_cli varchar(50), 
cidade_cli varchar(30), 
cep_cli varchar(20), 
uf_cli varchar(2), 
produto varchar (100),
primary key(id_cli)
)default charset = utf8;

insert into cliente (nome_cli, telefone, endereco_cli, cidade_cli, cep_cli, uf_cli, produto) values
('Diego Ribeiro', '11962441455', 'Rua Petrobrás', 'São Paulo', '09974-370','SP', 'Fogão Brastemp Preto 6 Bocas de Vidro'),
('Sabrina Geova', '220202020', 'Rua Nova', 'Rio de Janeiro', '09917-400','RJ', 'Máquina de Lavar Brastemp Advanced 12Kg');


create table vendedor
(id_vendedor integer auto_increment not null,
nome_vend varchar(40),
salario_vend float,
primary key (id_vendedor))default charset = utf8;

insert into vendedor (nome_vend, salario_vend) values
('Flávia Prado', '4500'),
('Sanches', '10000');


create table pedido
(
num_pedido integer auto_increment not null,
id_cli int,
id_vendedor int,
prazo_entrega varchar (30),
primary key (num_pedido),
foreign key (id_cli) references cliente (id_cli),
foreign key (id_vendedor) references vendedor (id_vendedor)
);

insert into pedido (id_cli, id_vendedor, prazo_entrega) values
(3, 2,'10 dias'),
(1, 2, '15 dias');


create table itens_pedido
(
id_item_pedido integer auto_increment not null,
num_pedido int,
id_produtos int,
quantidade int,
id_cli int,
primary key(id_item_pedido),
foreign key(num_pedido) references pedido(num_pedido),
foreign key(id_produtos) references produtos(id_produtos),
foreign key(id_cli) references cliente(id_cli)
);

insert into itens_pedido (num_pedido, id_produtos, quantidade, id_cli) values
(1, 5, 1, 1),
(2, 10, 1, 2);

-- Selects com cruzamento de tabelas JOIN

select * from produtos 
inner join itens_pedido
on produtos.id_produtos = itens_pedido.id_produtos
inner join pedido
on itens_pedido.num_pedido = pedido.num_pedido
inner join cliente
on itens_pedido.id_cli = cliente.id_cli;

select produtos.descricao, pedido.prazo_entrega, cliente.nome_cli, cliente.endereco_cli, cep_cli from produtos
inner join itens_pedido
on produtos.id_produtos = itens_pedido.id_produtos
inner join pedido
on itens_pedido.num_pedido = pedido.num_pedido
inner join cliente
on itens_pedido.id_cli = cliente.id_cli;


