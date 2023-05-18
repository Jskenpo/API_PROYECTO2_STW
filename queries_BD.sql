create table usuarios(
	id_usuario SERIAL PRIMARY KEY,
	usuario varchar(100),
	contraseña varchar(100),
	imagen BYTEA
)

create table categorias(
	id_categoria SERIAL PRIMARY KEY,
	categoria varchar(50)
)

create table restaurantes(
	id_restaurante SERIAL PRIMARY KEY,
	nombre_restaurante varchar(100),
	estado varchar(50),
	id_categoría int REFERENCES categorias(id_categoria)
)

create table reservas(
	id_reserva SERIAL PRIMARY KEY,
	id_restaurante int REFERENCES restaurantes(id_restaurante),
	id_usuario int REFERENCES usuarioS(id_usuario),
	hora varchar(50),
	cant_presonas int
)

INSERT INTO categorias (categoria) VALUES
	('Pizza'),
	('Hamburguesas'),
	('Sushi')
	
INSERT INTO restaurantes (nombre_restaurante, estado, id_categoría) VALUES
	('Shake Shack', 'Abierto', 2),
	('Sushiito', 'Abierto', 3),
	('Little Ceasars', 'Abierto', 1),
	('Frisco Grill', 'Abierto', 2),
	('Dominos Pizza', 'Abierto', 1);
	
select * from restaurantes 
	
select * from categorias