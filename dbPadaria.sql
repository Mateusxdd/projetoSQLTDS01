drop database dbPadaria;

create database dbPadaria;

use dbPadaria;


create table tbCli(
codCli int not null auto_increment,
nome varchar(100) not null,
cpf char(14),
codCart int not null,
primary key(codCli)
);
create table tbFuncionarios(
codFunc int not null auto_increment ,
nome varchar(100),
sexo varchar(1) default 'M' check (sexo in('F','M')),
salario decimal(9,2) default 0 check (salario >=0) ,
rg char(13) unique,
cpf char(14) not null unique,
idade int not null,
primary key(codFunc)
);
create table tbProdutos(
codProd int not null auto_increment,
nome char(20),
validade date,
dataEntr date,
valor decimal(9,2),
primary key(codProd)
);
create table tbFuncoes(
codFun int not null auto_increment,
nomeFun char(20),
codFunc int not null,
primary key(codFun),
foreign key(codFunc)references tbFuncionarios(codFunc)
);
create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
endereco varchar(100),
telefone char(13),
codProd int not null,
primary key(codForn),
foreign key(codProd)references tbProdutos(codProd)
);
create table tbCart(
codCart int not null auto_increment,
codCli int not null,
primary key(codCart),
foreign key(codCli)references tbCli(codCli)
);
create table tbVendas(
codVend int not null auto_increment,
valor decimal(9,2),
quantidade int,
data date,
hora time,
codFunc int not null,
codCli int not null,
codProd int not null,
primary key(codVend),
foreign key(codFunc)references tbFuncionarios(codFunc),
foreign key(codCli)references tbCli(codCli),
foreign key(codProd)references tbProdutos(codProd)
);
create table tbEstoque(
codEst int not null auto_increment,
codProd int not null,
N_Prod int not null ,
primary key(codEst),
foreign key(codProd)references tbProdutos(codProd)
);

desc tbCart;
desc tbFuncionarios;	
desc tbFuncoes;
desc tbCli;
desc tbProdutos;
desc tbVendas;
desc tbFornecedores;
desc tbEstoque;

insert into tbCli(nome,cpf,codCart)values('Marco Santos','404-210-418-54',3);
insert into tbCli(nome,cpf,codCart)values('Maria Regina','204-232-641-54',4);
insert into tbCli(nome,cpf,codCart)values('Ronaldo Nazario','221-010-458-34',1);
insert into tbCli(nome,cpf,codCart)values('Bruno Rodrigues','111-232-428-14',2);
insert into tbCli(nome,cpf,codCart)values('Vitor Viana de Barros','405-277-488-39',5);
-- Update
update tbCli set cpf = '303-123-322-55' where codCart = 1;
update tbCli set cpf = '232-321-412-87' where codCart = 2;
update tbCli set cpf = '123-321-414-99' where codCart = 3;
update tbCli set cpf = '213-212-414-45' where codCart = 4;
update tbCli set cpf = '455-512-213-52' where codCart = 5;

insert into tbCart(codCli)values(5);
insert into tbCart(codCli)values(2);
insert into tbCart(codCli)values(3);
insert into tbCart(codCli)values(4);
insert into tbCart(codCli)values(1);
-- Update


insert into tbFuncionarios(nome,sexo,salario,rg,cpf,idade)values('Matias Rojas','M',1320.40,'12.4561352-14','405-244-157-54',20);
insert into tbFuncionarios(nome,sexo,salario,rg,cpf,idade)values('Tacia Fagundez','F',1020.40,'32.6527752-94','404-010-878-34',30);
insert into tbFuncionarios(nome,sexo,salario,rg,cpf,idade)values('Marcia Cunha','F',2320.40,'12.4703142-14','505-134-001-51',19);
insert into tbFuncionarios(nome,sexo,salario,rg,cpf,idade)values('Mateoo Ronaldo Junior','M',10320.40,'13.3021231-5','303-123-323-21',22);
insert into tbFuncionarios(nome,sexo,salario,rg,cpf,idade)values('Julio Cesar','M',1000.40,'12.6561322-34','404-414-555-54',19);
-- Update
update tbFuncionarios set salario = salario * 1.10 where salario = 1320.40;
update tbFuncionarios set salario = salario * 1.06 where salario = 1020.40;
update tbFuncionarios set salario = salario * 1.20 where salario = 2320.40;
update tbFuncionarios set salario = salario * 1.005 where salario = 10320.40;
update tbFuncionarios set salario = salario * 1.50 where salario = 1000.40;

insert into tbFuncoes(nomeFun,codFunc)values('padeirosa',1);
insert into tbFuncoes(nomeFun,codFunc)values('atendentesda',3);
insert into tbFuncoes(nomeFun,codFunc)values('auxiliar de limpezafsa',4);
insert into tbFuncoes(nomeFun,codFunc)values('caixaasda',5);
insert into tbFuncoes(nomeFun,codFunc)values('caixadas',2);
-- Update
update tbFuncoes set nomeFun = 'Padeiro' where codFunc = 1;
update tbFuncoes set nomeFun = 'Atendente' where codFunc = 3;
update tbFuncoes set nomeFun = 'Auxiliar De Limpeza' where codFunc = 4;
update tbFuncoes set nomeFun = 'Caixa 1' where codFunc = 2;
update tbFuncoes set nomeFun = 'Caixa 2' where codFunc = 5;


insert into tbProdutos(nome,validade,dataEntr,valor)values('Chocolate','2025/11/25','2024/11/24',10.35);
insert into tbProdutos(nome,validade,dataEntr,valor)values('Leite','2025/03/25','2024/11/24',5.50);
insert into tbProdutos(nome,validade,dataEntr,valor)values('Frios','2025/12/01','2024/11/24',6.00);
insert into tbProdutos(nome,validade,dataEntr,valor)values('Refrigerantes','2025/08/25','2024/11/24',10.00);
insert into tbProdutos(nome,validade,dataEntr,valor)values('sorvetes','2025/04/25','2024/11/24',33.00);
-- Update
update tbProdutos set dataEntr = '2024/11/28' where codProd = 1;
update tbProdutos set validade = '2025/11/02' where codProd = 2;
update tbProdutos set Validade = '2024/12/18' where codProd = 3;
update tbProdutos set Valor = valor * 1.05 where codProd = 4;
update tbProdutos set valor = valor * 1.11 where codProd = 5;

insert into tbVendas(valor,quantidade,data,hora,codFunc,codCli,codProd)values(10.35,2,'2024/11/25','09:48',5,1,1);
insert into tbVendas(valor,quantidade,data,hora,codFunc,codCli,codProd)values(5.50,9,'2024/11/25','09:48',2,1,2);
insert into tbVendas(valor,quantidade,data,hora,codFunc,codCli,codProd)values(6.00,4,'2024/11/25','09:48',5,2,3);
insert into tbVendas(valor,quantidade,data,hora,codFunc,codCli,codProd)values(10.00,1,'2024/11/25','09:48',5,3,4);
insert into tbVendas(valor,quantidade,data,hora,codFunc,codCli,codProd)values(33.00,3,'2024/11/25','09:48',2,4,5);
-- Update
update tbVendas set valor = valor * quantidade where codProd > 0;
update tbVendas set data = '2024/12/03' where codProd > 0;
update tbVendas set hora = '08:35' where codProd > 0;
update tbVendas set codCli = codCli +1 where codProd >0;
update tbVendas set codCli = codCli -1 where codProd = 1;

insert into tbFornecedores(nome,endereco,telefone,codProd)values('Manequin da esquina','Rua do Jusa n 1423 - Parelheiros - SP','(11)995762974', 1);
insert into tbFornecedores(nome,endereco,telefone,codProd)values('Loja do cr7','Rua Henrique Hessel - Parelheiros - SP','(11)995563873',2);
insert into tbFornecedores(nome,endereco,telefone,codProd)values('Atacadista do ze','Rua Dom Queiroz - Santo Amaro - SP','(11)882374882',3);
insert into tbFornecedores(nome,endereco,telefone,codProd)values('Atacadista Mais Novo','Rua Queiroz Diaz - Republica - SP','(11)919882895',4);
insert into tbFornecedores(nome,endereco,telefone,codProd)values('Oggi','Rua Paolo Guerreiro - Grajau - sp','(11)719089033',5);
-- update 
update tbFornecedores set nome = 'Atacadista Regular' where codProd = 3;
update tbFornecedores set endereco = 'Rua Queiroz Abdiaz - Republica - SP' where codProd = 4;
update tbFornecedores set nome = 'Atacadista do ze ' where codProd = 4;
update tbFornecedores set nome = 'Atacadista Necessario' where codProd = 2;
update tbFornecedores set nome = 'Multivarejista do ze ' where  codProd = 1;

insert into tbEstoque(codProd,N_Prod)values(1,70);
insert into tbEstoque(codProd,N_Prod)values(2,50);
insert into tbEstoque(codProd,N_Prod)values(3,80);
insert into tbEstoque(codProd,N_Prod)values(4,40);
insert into tbEstoque(codProd,N_Prod)values(5,30);

select * from tbCart;
select * from tbFuncoes;
select * from tbFuncionarios;
select * from tbCli;
select * from tbProdutos;
select * from tbVendas;
select * from tbFornecedores;
select * from tbEstoque;

select distinct nome,idade from tbFuncionarios;
select * from tbFuncionarios where salario >1000 and salario <10000;
select nome as 'Nome', idade as 'Idade', salario as 'Salario', codFunc as 'Codigo do Funcionario' from tbFuncionarios;
select * from tbVendas where codCli = 1;
select * from tbCli where nome not like '%M%';
select * from tbCli where codCli = 1 or codCli =2;
select * from tbFuncionarios where codFunc in (1,3,5) and idade in (19,20);
select * from tbVendas where valor >10;
select * from tbVendas where valor <20;
select * from tbVendas where valor >=10;
select * from tbVendas where valor not in (10.00,20.70);

select func.nome as 'Nome Do Funcionario',func.sexo as 'Sexo',func.salario as 'Salario',func.rg as 'RG',func.cpf as 'CPF' ,func.idade as 'Idade' from tbFuncionarios as func inner join tbFuncoes as fun on fun.codFunc = codFun; 
select est.codProd as 'Codigo do Produto ',est.N_Prod as 'Estoque' ,vend.quantidade as 'Vendas do Produto', est.N_Prod - vend.quantidade as 'Estoque Restante ', vend.valor as 'Valor do Compra' from tbVendas as vend inner join tbEstoque as est on vend.codVend = codEst;
select forn.nome as 'Nome',forn.endereco as 'endereco' ,forn.telefone as 'Telefone para Contato',prod.nome as 'Nome do Produto',forn.codProd as 'Codigo do Produto' from tbProdutos as prod inner join tbFornecedores as forn on prod.codProd = codForn;
select fun.nomeFun as 'Funcao', fun.codFun as 'Codigo da Funcao', func.nome as 'Encarregado', func.salario as 'Salario' from tbFuncoes as fun inner join tbFuncionarios as func on func.codFunc = fun.codFun; 
select car.codCli as 'Codigo do cliente ',cli.nome as 'Nome do Cliente', cli.cpf as 'CPF', cli.codCart as 'Numero do cartao' from tbCli as cli inner join tbCart as car on car.codCart = cli.codCli;