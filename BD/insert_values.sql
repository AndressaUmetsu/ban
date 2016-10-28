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

INSERT INTO Empregado (nome) VALUES
	('Sen'),
	('Lin');

-- INSERT INTO TipoServico (nome, custo) VALUES

-- numQuarto ser serial, irá criar a situação em que numero do quarto do hotel 2 comece em 3
INSERT INTO Quarto (numQuarto, idHotel, idTipoQuarto, andar) VALUES
	(999, 1, 1, 2),
	(999, 1, 1, 3),
	(3, 1, 2, 2),
	(4, 1, 2, 3),
	(5, 1, 3, 2),
	(6, 1, 3, 3),
	(7, 2, 1, 1),
	(8, 2, 2, 2),
	(9, 2, 3, 3),
	(10,2, 4, 4);

-- INSERT INTO Limpeza (numQuarto, idHotel, data, hora, idEmpregado) VALUES

INSERT INTO Estadia (idCliente, numQuarto, idHotel, dataCheckIn, dataCheckOut) VALUES
	(1, 1, 1, '10/12/2016', '10/16/2016');

-- INSERT INTO Servico (idTipoServico, idCliente, numQuarto, idHotel, dataCheckIn, data, hora) VALUES

-- Quando faço reserva de um quarto precisa de tipo de quarto
-- INSERT INTO Reserva (idCliente, numQuarto, idHotel, dataReserva, dataCheckIn, dataCheckOut, valorEntrada) VALUES
