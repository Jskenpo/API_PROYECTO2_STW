

create table categorias(
	id_categoria SERIAL PRIMARY KEY,
	categoria varchar(50)
);

create table restaurantes(
	id_restaurante SERIAL PRIMARY KEY,
	usuario varchar(100),
	contraseña varchar(100),
	nombre_restaurante varchar(100),
	describción varchar(200),
	hora_apertura varchar(50),
	hora_cerrada varchar(50),
	id_categoría int REFERENCES categorias(id_categoria)
);

create table reservas(
	id_reserva SERIAL PRIMARY KEY,
	id_restaurante int REFERENCES restaurantes(id_restaurante),
	cliente varchar(100),
	hora varchar(50),
	fecha_reserva date,
	cant_personas int
);

drop table reservas;

INSERT INTO categorias (categoria) VALUES
	('Pizza'),
	('Hamburguesas'),
	('Sushi');
	
INSERT INTO restaurantes (usuario, contraseña, nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría)
VALUES 
    ('carls_user', 'carls_pass', 'Carls', 'Restaurante de comida rápida especializado en hamburguesas.', '09:00', '21:00', 2),
    ('b2_user', 'b2_pass', 'B2', 'Restaurante con variedad de opciones de comida, desde platos principales hasta postres.', '08:00', '22:00', 2),
    ('bk_user', 'bk_pass', 'BK', 'Famosa cadena de hamburguesas con opciones para todos los gustos.', '10:00', '20:00', 2),
    ('delpuente_user', 'delpuente_pass', 'Del Puente', 'Restaurante con vistas panorámicas y cocina moderna.', '08:30', '21:30', 2),
    ('mc_user', 'mc_pass', 'Mc', 'Conocida cadena de comida rápida especializada en hamburguesas y papas fritas.', '07:00', '23:00', 2),
    ('lachisca_user', 'lachisca_pass', 'La Chisca', 'Acogedor restaurante de comida tradicional con platos caseros.', '10:30', '22:30', 2),
    ('berlin_user', 'berlin_pass', 'Berlin', 'Restaurante de comida internacional con un toque moderno.', '09:30', '20:30', 2),
    ('latrama_user', 'latrama_pass', 'La Trama', 'Elegante restaurante con un menú gourmet y una experiencia culinaria única.', '10:00', '22:00', 2),
    ('pecosbill_user', 'pecosbill_pass', 'Pecos Bill', 'Auténtico restaurante texano con carnes a la parrilla y platos sabrosos.', '08:00', '23:00', 2),
    ('frisco_user', 'frisco_pass', 'Frisco', 'Restaurante con ambiente familiar y una amplia selección de platos caseros.', '09:00', '21:00', 2),
    ('worldclass_user', 'worldclass_pass', 'World Class', 'Restaurante de alta cocina con menú degustación y platos elaborados.', '07:30', '22:30', 2),
    ('goliatburger_user', 'goliatburger_pass', 'Goliat Burger', 'Hamburguesas gigantes y sabrosas que satisfacen cualquier apetito.', '08:30', '20:30', 2),
    ('wendys_user', 'wendys_pass', 'Wendys', 'Cadena de comida rápida conocida por sus hamburguesas frescas y saborizadas.', '10:00', '22:00', 2),
    ('newyorkburgers_user', 'newyorkburgers_pass', 'New York Burgers', 'Hamburguesas inspiradas en el estilo de Nueva York con ingredientes de calidad.', '09:00', '21:00', 2),
    
INSERT INTO restaurantes (usuario, contraseña, nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría)
VALUES 
    ('littlec_user', 'littlec_pass', 'Little C', 'Pequeño restaurante especializado en comida italiana.', '10:00', '22:00', 1),
    ('hut_user', 'hut_pass', 'Hut', 'Cadena de pizzerías famosa por sus pizzas estilo americano.', '11:00', '23:00', 1),
    ('dominos_user', 'dominos_pass', 'Dominos', 'Reconocida cadena de pizzerías con entrega a domicilio.', '10:30', '22:30', 1),
    ('almacarone_user', 'almacarone_pass', 'Al Macarone', 'Restaurante italiano con una amplia variedad de pastas y salsas.', '09:00', '21:00', 1),
    ('castor_user', 'castor_pass', 'Castor', 'Acogedor restaurante con especialidad en pizzas gourmet.', '12:00', '00:00', 1),
    ('papajohns_user', 'papajohns_pass', 'Papa Johns', 'Cadena de pizzerías con énfasis en ingredientes frescos y de calidad.', '10:00', '22:00', 1),
    ('pizzasdeloso_user', 'pizzasdeloso_pass', 'Pizzas del Oso', 'Pizzería con pizzas al estilo tradicional con un toque único.', '11:30', '23:30', 1),
    ('pizzagrizzly_user', 'pizzagrizzly_pass', 'Pizza Grizzly', 'Restaurante con pizzas deliciosas y creativas en un ambiente acogedor.', '10:00', '22:00', 1),
    ('antiguaboreal_user', 'antiguaboreal_pass', 'Antigua Boreal', 'Restaurante italiano con auténticos sabores de la región de Bari.', '09:00', '21:00', 1),
    ('ilcapricco_user', 'ilcapricco_pass', 'Il Capricco', 'Elegante restaurante italiano con platos clásicos y sofisticados.', '12:00', '00:00', 1),
    ('trefra_user', 'trefra_pass', 'Tre Fra', 'Trattoria italiana con auténticos platos de la región de Emilia-Romaña.', '10:30', '22:30', 1),
    ('vesuvio_user', 'vesuvio_pass', 'Vesuvio', 'Pizzería con horno de leña y pizzas napolitanas auténticas.', '11:00', '23:00', 1),
    ('quinos_user', 'quinos_pass', 'Quinos', 'Restaurante italiano con menú variado que incluye pastas, risottos y más.', '10:00', '22:00', 1),
    ('stradapizza_user', 'stradapizza_pass', 'Strada Pizza', 'Cadena de pizzerías con opciones clásicas y especialidades gourmet.', '09:30', '21:30', 1),
    
INSERT INTO restaurantes (usuario, contraseña, nombre_restaurante, descripcion, hora_apertura, hora_cerrada, id_categoría)
VALUES 
    ('mrsushi_user', 'mrsushi_pass', 'Mr. Sushi', 'Restaurante especializado en sushi y cocina japonesa.', '11:00', '23:00', 3),
    ('sushiito_user', 'sushiito_pass', 'Sushiito', 'Lugar de sushi con opciones creativas y frescas.', '10:30', '22:30', 3),
    ('nacionsushi_user', 'nacionsushi_pass', 'Nacion Sushi', 'Restaurante de sushi con variedad de rolls y sabores únicos.', '11:00', '23:00', 3),
    ('takeshi_user', 'takeshi_pass', 'Takeshi', 'Restaurante japonés con una amplia selección de sushi y platos calientes.', '11:30', '23:30', 3),
    ('ohkiku_user', 'ohkiku_pass', 'OH KIKU', 'Sushi bar con un ambiente moderno y opciones de sushi de alta calidad.', '10:00', '22:00', 3),
    ('tokoi_user', 'tokoi_pass', 'Tokoi - Sushi', 'Restaurante de sushi con un toque creativo y sabores únicos.', '11:30', '23:30', 3),
    ('akaisushi_user', 'akaisushi_pass', 'Akai Sushi & Oriental', 'Restaurante que combina sushi y platos orientales en un ambiente acogedor.', '11:00', '23:00', 3),
    ('ranjapones_user', 'ranjapones_pass', 'Ran Japones', 'Restaurante japonés con opciones de sushi tradicional y platos de la cocina japonesa.', '10:00', '22:00', 3),
    ('sakura_user', 'sakura_pass', 'Sakura Japanese Urban Bistro', 'Bistro japonés con una fusión de sabores tradicionales y modernos.', '11:30', '23:30', 3),
    ('sushimon_user', 'sushimon_pass', 'Sushimon', 'Restaurante de sushi con una amplia selección de rolls y combinaciones.', '10:00', '22:00', 3),
    ('satori_user', 'satori_pass', 'Satori Sushi GT', 'Sushi bar con una combinación de sabores tradicionales y contemporáneos.', '11:00', '23:00', 3),
    ('zakennayo_user', 'zakennayo_pass', 'Zakennayo Sushi', 'Sushi bar con opciones de sushi fresco y sabroso.', '10:30', '22:30', 3),
    ('tanoshii_user', 'tanoshii_pass', 'Tanoshii Sushi Bar', 'Bar de sushi con opciones de sushi creativas y frescas.', '11:00', '23:00', 3),
    ('nokiate_user', 'nokiate_pass', 'Nokiate', 'Restaurante japonés con una amplia variedad de platos, incluyendo sushi.', '10:00', '22:00', 3),


INSERT INTO reservas (id_restaurante, cliente, hora, fecha_reserva, cant_personas)
VALUES
    (1, 'Juan Pérez', '18:30', '2023-05-21', 2),
    (2, 'María Gómez', '19:00', '2023-05-22', 4),
    (3, 'Carlos Rodríguez', '20:15', '2023-05-23', 3),
    (4, 'Ana López', '19:30', '2023-05-24', 5),
    (5, 'Pedro Martínez', '20:00', '2023-05-25', 2),
    (6, 'Laura Fernández', '18:45', '2023-05-26', 3),
    (7, 'José García', '19:30', '2023-05-27', 4),
    (8, 'Sofía Morales', '20:15', '2023-05-28', 2),
    (9, 'Manuel Torres', '19:00', '2023-05-29', 3),
    (10, 'Marta Castro', '18:30', '2023-05-30', 2);

INSERT INTO reservas (id_restaurante, cliente, hora, fecha_reserva, cant_personas)
VALUES
    (1, 'Luis Ramírez', '19:00', '2023-06-01', 2),
    (2, 'Elena Navarro', '20:30', '2023-06-02', 4),
    (3, 'Andrés Morales', '18:45', '2023-06-03', 3),
    (4, 'Carolina Herrera', '19:30', '2023-06-04', 5),
    (5, 'Gabriel Sánchez', '20:15', '2023-06-05', 2),
    (1, 'Valeria Torres', '19:00', '2023-06-06', 3),
    (2, 'Fernando Ruiz', '18:30', '2023-06-07', 2),
    (3, 'Camila Vargas', '19:45', '2023-06-08', 4),
    (4, 'Alejandro Gómez', '20:30', '2023-06-09', 3),
    (5, 'Daniela Jiménez', '19:15', '2023-06-10', 2);



select * from reservas;
select * from restaurantes;
select * from categorias;

/*reservas al iniciar sesión*/
select  r.cliente, r.hora, r.fecha_reserva, r.cant_personas
from reservas r
    inner join restaurantes re on r.id_restaurante = re.id_restaurante
    where r.id_restaurante = 1;
;

/*restaurantes por categoría*/
select res.id_restaurante, res.nombre_restaurante, res.descripcion, res.hora_apertura, res.hora_cerrada, cat.categoria
from restaurantes res
    inner join categorias cat on res.id_categoría = cat.id_categoria
    where res.id_categoría = 3;

/*todos los restaurantes*/
select res.nombre_restaurante, res.descripcion, res.hora_apertura, res.hora_cerrada, cat.categoria
from restaurantes res
    inner join categorias cat on res.id_categoría = cat.id_categoria;

select * from reservas