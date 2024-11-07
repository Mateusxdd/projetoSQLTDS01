drop database dbLivraria;
create database dbLivraria;
use dbLivraria;
create table tbAluno(
raAluno int,
nome varchar(45),
email varchar(45),
telefone varchar(45)
);
create table tbLivro(
ISBN int,
nome varchar(45),
autor varchar(45),
paginas varchar(45),
Aluno_raAluno int,
colaborador_idcolaborador int
);
create table tbColaborador(
id_colaborador int,
cpf varchar(45),
nome varchar(45),
email varchar(45),
cargo varchar(45)
);
create table tbEmprestimo(
idEmprestimo int,
data_emprestimo date,
data_devolução date,
livro_isbn varchar(45),
colaboradorCPF varchar(45),
colaborador_idcolaborador int
);
desc tbAluno;
desc tbLivro;
desc tbColaborador;
desc tbEmprestimo;