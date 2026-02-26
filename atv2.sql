create database oficina;

use oficina;

create table oficina(
    codigo_oficina bigint primary key,
    cnpj varchar(14) not null unique,
    nome varchar(100) not null,
    responsavel varchar(50) not null,
    telefone varchar(30),
    email varchar(100) not null unique
);

create table fabricante(
	codigo_fabricante bigint primary key,
	nome varchar(100) not null,
	telefone varchar(30),
	email varchar(100) not null unique,
	responsavel varchar(100)
);

create table modelo(
	codigo_modelo bigint primary key,
	tipo varchar(100) not null,
	peso decimal(12,4) default(1),
	horaTeste int default(100),
	codigo_fabricante bigint,
	foreign key (codigo_fabricante) references fabricante(codigo_fabricante)
);

create table maquina(
    registro_maquina varchar(100) primary key,
    ano varchar(4),
    horasUso int,
    codigo_modelo bigint,
    foreign key (codigo_modelo) references modelo(codigo_modelo)
);

create table tecnico(
    codigo_funcional bigint primary key,
    endereco varchar(200),
    telefone varchar(30),
    salario decimal(6,2),
    qualificacao varchar(100),
);

create table teste(
    codigo_teste bigint primary key,
    pontuacao decimal(5,2) not null
    resultado varchar(50),
    recomendacoes varchar(200),
    codigo_oficina bigint,
    codigo_funcional bigint,
    foreign key (codigo_oficina) references oficina(codigo_oficina),
    foreign key (codigo_funcional) references tecnico(codigo_funcional)
);

create table modelo_oficina(   /*relacionamento N:N tem tabela propria*/
    codigo_oficina bigint,
    codigo_modelo bigint,
    primary key (codigo_oficina, codigo_modelo),  /*declarando PK composta*/
    foreign key (codigo_oficina) references oficina(codigo_oficina),
    foreign key (codigo_modelo) references modelo(codigo_modelo)
);

create table tecnico_modelo(   /*relacionamento N:N tem tabela propria*/
    codigo_funcional bigint,
    codigo_modelo bigint,
    primary key (codigo_funcional, codigo_modelo),  /*declarando PK composta*/
    foreign key (codigo_funcional) references tecnico(codigo_funcional),
    foreign key (codigo_modelo) references modelo(codigo_modelo)
);
