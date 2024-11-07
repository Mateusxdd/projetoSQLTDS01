drop database dbEndereco;
create database dbEndereco;
use dbEndereco;
create table tbEndereco(
id bigint(20),
bairro_id int(11),
tipo_local varchar(15),
logradouro varchar(128),
numero int(11),
complemento varchar(255)
);
create table tbBairro(
id bigint(20),
nome varchar(100),
cidade_id int(11)
);
create table tbCidade(
id int(11),
nome varchar(38),
estado_id int(11)
);
create table tbEstado(
id int(11),
sigla char(2)
);
create table tbServico(
id bigint(20),
endereco_id bigint(20),
solicitante_id bigint(20)
);
create table tbPonto(
id bigint(20),
endereco_id bigint(20)
);
create table tbSolicitante(
id bigint(20),
endereco_id bigint(20)
);
desc tbEndereco;
desc tbBairro;
desc tbServico;
desc tbCidade;
desc tbEstado;
desc tbPonto;
desc tbSolicitante;