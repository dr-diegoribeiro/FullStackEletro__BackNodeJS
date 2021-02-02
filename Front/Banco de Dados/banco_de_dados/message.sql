use fullstack_ultimate;

create table if not exists comentarios(
id_comentarios integer auto_increment,
nome varchar (100),
email varchar (100),
motivo varchar (30),
mensagem varchar (200),
primary key (id_comentarios)
)default charset = utf8;