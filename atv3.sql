create database biblioteca;
 
use biblioteca;
 
 
create table categoriaObra(
	codigo int primary key auto_increment,
    nome varchar(100)
);
 
create table obra(
	codigo bigint primary key auto_increment,
	isbn varchar(30) unique,
	titulo varchar(100) not null,
	autores varchar(100) not null,
	palavrasChave varchar(100),
	dataPublicacao date,
	numeroEdicao int,
	editora varchar(100),
	numeroPagina int,
	categoria int
);
 
alter table obra add foreign key (categoria) references
categoriaObra(codigo);
 
create table categoriaLeitor(
	codigo int primary key auto_increment,
    nome varchar(100) ,
    dias int default(7)
);
 
create table leitor(
	codigo bigint primary key auto_increment,
    documento varchar(30) not null,
	nome varchar(100) not null,
    endereco varchar(100),
    cidade varchar(100),
    estado char(2),
    telefone varchar(30) not null,
    email varchar(100) unique,
    senha varchar(100),
    categoria int,
    dataNascimento date
);
 
alter table leitor add foreign key (categoria)
    references categoriaLeitor(codigo);
 
create table copia(
	codigo bigint primary key auto_increment,
	obra bigint,
    status varchar(50),
    obs text
    );
 
   alter table copia add foreign key(obra) references
    obra(codigo);
   
create table funcionario(
	codigo bigint primary key auto_increment,
	nome varchar(100) not null,
    endereco varchar(100),
    cidade varchar(100),
    estado varchar(2),
    telefone varchar(30) not null,
    dataNascimento date,
    email varchar(100) not null unique ,
    senha varchar(100)
);    
alter table funcionario add column logradouro;
 
create table reserva(
codigo bigint primary key auto_increment,
dataReserva date,
dataPrevistaRetirada date,
dataPrevistaDevolucao date,
leitor bigint,
obra bigint
);    
alter table reserva add foreign key (leitor) references leitor(codigo);
alter table reserva add foreign key (obra) references obra(codigo);
 
 
create table emprestimo(
codigo bigint primary key auto_increment,
dataEmprestimo timestamp,
dataPrevistaDevolucao timestamp,
dataDevolucao timestamp,
multa decimal(18,2) default 0,
obs varchar(400),
leitor bigint,
copia bigint,
funcionario bigint
);    
 
alter table emprestimo add foreign key (leitor) references leitor(codigo);
alter table emprestimo add foreign key (copia) references copia(codigo);
alter table emprestimo add foreign key (funcionario) references funcionario(codigo);
