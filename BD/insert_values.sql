-- idTipoQuarto é Serial, logo o valor 1 é assumido pra primary key do single
-- 2 para duploe, 3 para casal e 4 para suito.
INSERT INTO TipoQuarto (nome, preco) VALUES
	('single', 25),
	('duplo', 25),
	('casal', 25),
	('suite', 25);

INSERT INTO Hotel (nome, endereco, telefone) VALUES
	('Doguinhos', 		'R. Blumenau, 302', 		'5599882211'),
	('Tangerine Dream', 'R. Laranja, 42', 			'6611111111'),
	('Air', 			'R. XV de Novembro, 95', 	'6612341234');

INSERT INTO Cliente (nome, endereco, telefone) VALUES
	('Anna Karenina', 		'R. Itajai, 101', 	'5511222222'),
	('Lev Tolstoy', 		'R. Curitiba, 202', '5522333333'),
	('Andrei Tarkovsky', 	'R. Curitiba, 203', '5533444444'),
	('Andrzej Sapkowski', 	'R. Londrina, 511', '6611222222'),
	('Hidetoshi Sato', 		'R. Peixe, 95', 	'6622333333'),
	('Kazuki Fuse', 		'R. Lobo, 10', 		'6633444444'),
	('Keanu Reeves', 		'R. Lobo, 20', 		'6644555555');
