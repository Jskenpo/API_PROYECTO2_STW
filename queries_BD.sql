create table usuarios(
	id_usuario SERIAL PRIMARY KEY,
	usuario varchar(100),
	contraseña varchar(100)
);


create table categorias(
	id_categoria SERIAL PRIMARY KEY,
	categoria varchar(50)
);

create table restaurantes(
	id_restaurante SERIAL PRIMARY KEY,
	nombre_restaurante varchar(100),
	estado varchar(50),
	id_categoría int REFERENCES categorias(id_categoria)
);

create table reservas(
	id_reserva SERIAL PRIMARY KEY,
	id_restaurante int REFERENCES restaurantes(id_restaurante),
	id_usuario int REFERENCES usuarioS(id_usuario),
	hora varchar(50),
	cant_presonas int
);

INSERT INTO categorias (categoria) VALUES
	('Pizza'),
	('Hamburguesas'),
	('Sushi');
	
INSERT INTO restaurantes (nombre_restaurante, estado, id_categoría) VALUES
	('Shake Shack', 'Abierto', 2),
	('Sushiito', 'Abierto', 3),
	('Little Ceasars', 'Abierto', 1),
	('Frisco Grill', 'Abierto', 2),
	('Dominos Pizza', 'Abierto', 1);
	
insert into usuarios(usuario,contraseña) values 
	('kenpo','12345'),
	('teviet','12345'),
	('valdecin','12345');

insert into reservas(id_restaurante,id_usuario,hora,cant_presonas) values 
	(1,1,'12:30 PM',4),
	(2,3,'7:30 PM',2),
	(3,2,'9:00 PM',6);

select * from reservas;
select from usuarios;
select * from restaurantes;
	
select * from categorias;