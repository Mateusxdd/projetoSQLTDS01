-- apagar o banco de dados
drop database dbLoterica;
-- criar o banco de dados
create database dbLoterica;
-- acessar o banco de dados
use dbLoterica;
-- criar as tabelas
create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
telefone char(9),
cpf char(14),
idade int,
salario decimal(9,2));
 
-- inserindo registros nas tabelas
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf,idade,salario)values(1,'Paulo Antunes da Silva','paulo.asilva@hotmail.com','94521-7852','253.254.258-77',52,2500);
-- visualizando os registros das tabelas
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf,idade,salario)values(2,'Regina Miranda','regina.miranda@gmail.com','97852-4175','852.365.274-88',45,3520);
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf,idade,salario)values(3,'Mario de Andrade','mario.andrade@yahoo.com','97852-5175','352.365.274-88',25,1600);
insert into tbFuncionarios(nome,email)values('Ronaldo Rodrigues', 'ronaldo.rodrigues@gmail.com');
insert into tbfuncionarios(codFunc,email,cpf)values(5,'fernando.ccunha','524.652.74.-88');
desc tbFuncionarios;
-- buscar todas as colunas e os registros dentro da tabela tbFuncionarios
select * from tbFuncionarios;
-- alias altera o nome da culuna na hora da visualização
-- no banco de dados não existe campo vazio. o que seria vazio vira NULL