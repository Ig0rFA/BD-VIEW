
	create table marcas (
	mrc_id int primary key auto_increment,
	mrc_nome varchar (50) not null,
	mrc_nacionalidade varchar(50)
	);

	create table produtos (
	prd_id int primary key auto_increment,
	prd_nome varchar (50) not null,
	prd_qt_estoque int not null default 0,
	prd_estoque_mim int not null default 0,
	prd_data_frabricacao timestamp default now(),
	prd_perecivel boolean,
	prd_valor decimal (10,2),
	prd_marca_id int,
	constraint fk_marcas foreign key (prd_marca_id) references marcas(mrc_id)
	);

	create table fornecedores (
	frn_id int primary key auto_increment,
	frn_nome varchar(50),
	frn_email varchar (50)
	);

	create table produto_fornecedor(
	pf_prod_id int references produtos (prd_id),
	pf_forn_id int references fornecedores (frn_id),	 

	primary key (pf_prod_id, pf_forn_id)
	);

	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_perecivel, prd_valor, prd_marca_id)
	values ('geladeira', 80, 50, 0, 3000, 1);
	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_perecivel, prd_valor, prd_marca_id)
	values ('televisao', 150, 80, 0, 5000, 2);
	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_perecivel, prd_valor, prd_marca_id)
	values ('ar condicionado', 100, 75, 0, 2500, 3);
	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_perecivel, prd_valor, prd_marca_id)
	values ('cama', 500, 150, 0, 800, 4);
	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_perecivel, prd_valor, prd_marca_id)
	values ('mesa', 20, 15, 0, 850, 5);
	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_perecivel, prd_valor, prd_marca_id)
	values ('sofa', 50, 25, 0, 500, 6);

	insert into marcas(mrc_nome, mrc_nacionalidade)
	values ('sansung', 'china');
	insert into marcas(mrc_nome, mrc_nacionalidade)
	values ('Samsung', 'china');
	insert into marcas(mrc_nome, mrc_nacionalidade)
	values ('lg', 'eua');
	insert into marcas(mrc_nome, mrc_nacionalidade)
	values ('zezinho', 'brasileira');
	insert into marcas(mrc_nome, mrc_nacionalidade)
	values ('zezinho', 'brasileira');
	insert into marcas(mrc_nome, mrc_nacionalidade)
	values ('sorocaba moveis', 'brasileira');

	insert into fornecedores (frn_nome, frn_email)
	values ('Casas Bahia', 'casbahia@gmail.com');
	insert into fornecedores (frn_nome, frn_email)
	values ('Magazine Luiza', 'magazineluiza@gmail.com');
	insert into fornecedores (frn_nome, frn_email)
	values ('Americanas', 'americanas@gmail.com');
	insert into fornecedores (frn_nome, frn_email)
	values ('polishop', 'polishop@gmail.com');

create view TodosProdutos_Marcas as
	select p.prd_nome , m.mrc_nome
    	from produtos p
    	inner join marcas m 
    	on p.prd_marca_id = m.mrc_id;
    
    	select * from TodosProdutos_Marcas;



	create view TodosProdutos_Fornecedores as
	select p.prd_nome as "Nome_Produto", f.frn_nome as "Nome_Fornecedor"
	from produtos p
	inner join fornecedores f
	on f.frn_id = p.prd_id;

	select * from TodosProdutos_Fornecedores;



	create view TodosProdutos_Fornecedores_Marcas as
  	select p.prd_nome "Nome_Produto", f.frn_nome as "Nome_Fornecedor", m.mrc_nome as "Marca"
	from produtos p
	inner join fornecedores f
	on f.frn_id = p.prd_id
    	inner join marcas m
    	on m.mrc_id = p.prd_marca_id;
    
    
	select * from TodosProdutos_Fornecedores_Marcas;



	create view produtos_abaixo_estoque_minimo as
	select p.prd_nome as "Nome_Produto" 
	from produtos p
	where p.prd_qt_estoque < p.prd_estoque_mim;

	select * from produtos_abaixo_estoque_minimo;

	alter table produtos
	add prd_data_validade date;


	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_data_frabricacao, prd_perecivel, prd_valor, prd_marca_id, prd_data_validade) values ('panela', 50, 25, '2023-10-16', 0, 100.50, 1, '2023-10-20');
	insert into produtos (prd_nome, prd_qt_estoque, prd_estoque_mim, prd_data_frabricacao, prd_perecivel, prd_valor, prd_marca_id, prd_data_validade) values ('liquidificador', 100, 50, '2023-05-19', 0, 80.99, 2, '2023-10-26');


	select prd_id, prd_nome, prd_valor
	from produtos
	where prd_valor > (select avg(prd_valor) from produtos   	
    );



