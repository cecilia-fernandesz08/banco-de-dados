create database loja;

use loja;

create table cliente(
	cpf varchar(11) PRIMARY KEY,
	nome varchar(55) not null,
    telefone varchar(20),
    nascimento date
);

create table vendas(
	id int auto_increment PRIMARY KEY,
    data_venda date not null,
    valor decimal(10,2)not null,
    cpf varchar(11) not null,
    FOREIGN KEY(cpf) references cliente(cpf)
);

insert into cliente(nome,cpf,telefone,nascimento)
values
("Cecilia","1234","889929",'2026-10-24'),
("maria","0987","123334",'2026-10-11');

select * from cliente;

insert into vendas(data_venda,valor,cpf)
values
('2026-10-11',150.2,"1234"),
('2026-11-12',100,"0987");

select * from vendas;

-- mostra o nome do cliente e suas vendas
select 
	cliente.nome,
    vendas.id, 
    vendas.data_venda,
    vendas.valor
from cliente 
inner join vendas 
	on cliente.cpf=vendas.cpf;
    
insert into vendas(data_venda,valor,cpf)
values
('2025-10-11',170.85,"1234");
    
-- total de vendas por cliente
select 
	cliente.nome,
    sum(vendas.valor) as total_gasto
from cliente inner join vendas
	on cliente.cpf=vendas.cpf
    group by cliente.cpf,cliente.nome;
    
-- valor total vendido pela a loja
select sum(valor) as total_vendas from vendas;
