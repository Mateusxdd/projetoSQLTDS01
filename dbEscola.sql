drop database dbEscola;
create database dbEscola;
use dbEscola;
create table tbAluno(
idAluno int,
nome varchar(45),
email varchar(45),
cpf int,
endereco varchar(45),
numero int,
complemento varchar(45),
cidade varchar(45),
estado varchar(45)
);
create table tbCursoAluno(
curso_idCurso int,
Aluno_idAluno int
);
create table tbCurso(
idCurso int,
nome varchar(45),
professor_idProfessor int
);
create table tbProfessor(
idProfessor int,
nome varchar(45),
email varchar(45),
cpf int,
endereco varchar(45),
numero int,
complemento varchar(45),
cidade varchar(45),
estado varchar(45)
);
desc tbAluno;
desc tbCursoAluno;
desc tbCurso;
desc tbProfessor;
