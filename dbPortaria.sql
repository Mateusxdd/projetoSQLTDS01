drop database dbportaria;

create database dbportaria;

use dbPortaria;

create table tbfuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
rg char(13) unique,
cpf char(14) not null unique,
sexo char(1) default 'M' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
primary key (codFunc));

create table tbClientes(
codCli int not null auto_increment,
nome varchar(50),
email varchar(50),
telefone char(10),
primary key (codCli)
);
create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telefone char(10),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbUsuarios(
codUsu int not null,
nome varchar(50) not null,
senha varchar(20) not null,
codFunc int not null,
primary key (codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100) not null,
lote char(12),
validade date,
dataEntr date,
horaEntr time,
quantidade int,
preco decimal(9,2),
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

create table tbVendas(
codVend int not null auto_increment,
valor decimal(9,2),
quantidade int,
dataVend date,
horaVend time,
codUsu int not null,
codProd int not null,
codCli int not null,
primary key(codVend),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codCli)references tbClientes(codCli)
);

desc tbFuncionarios;
desc tbUsuarios;
desc tbClientes;
desc tbFornecedores;
desc tbProdutos;
desc tbVendas;

insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Matias Rojas ','52.478.741-7','074.612.225-96','M',25000.00);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Leticia Borges','45.521.258-8','524.524.854-88','F',3500.45);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Pedro Jose','58.524.789-8','574.857.854-88','M',2555.56);
insert into tbFuncionarios(nome,rg,cpf,sexo,salario)values('Larissa Rodrigues','85.854.742-8','524.854.879-91','F',4255.22);

insert into tbClientes(nome,email,telefone)values('Joana Antunes','joana.antunes@hotmail.com','95248-78597');
insert into tbClientes(nome,email,telefone)values('Katia Assad','katia.assad@hotmail.com','99231-32134');
insert into tbClientes(nome,email,telefone)values('Matias Rojas','rojas@hotmail','92348-78897');
insert into tbClientes(nome,email,telefone)values('Joao Santos','joaosantos@gmail.com','91128-78897');

insert into tbFornecedores(nome,email,telefone,cnpj)values('Armarinho Fernandez','sac@afernandez.com.br','98523-8745','48.076.228/0001-91');
insert into tbFornecedores(nome,email,telefone,cnpj)values('Casas Bahia','suporte.novapontocom@gmail.com',' 114450-5020','33.041.260/1443-28');
insert into tbFornecedores(nome,email,telefone,cnpj)values('Bar do Ze','zedobar@gmail.com','99576-2974','79.075.318/0007-99');
insert into tbFornecedores(nome,email,telefone,cnpj)values('Adega machado','adegaria_machado@gmail.com','99723-4545','49.096.777/0002-92');

insert into tbUsuarios(nome,senha,codFunc)values('pedro.jose','Jose1231',3);
insert into tbUsuarios(nome,senha,codFunc)values('Leticia Borges','654321',2);
insert into tbUsuarios(nome,senha,codFunc)values('Leticia Borges','654321',2);

insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('papel sulfite','524515','2030/11/19','11:46:00',10,25.35,1);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('cartolina','521133','2030/11/20','12:00:00',20,25.50,3);
insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('papel sulfite','524515','2030/11/19','11:46:00',10,25.35,1);


select * from tbFuncionarios;
select * from tbClientes;
select * from tbFornecedores;
select * from tbUsuarios;
select * from tbProdutos;