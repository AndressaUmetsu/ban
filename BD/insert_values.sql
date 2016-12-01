-- idTipoQuarto é Serial, logo o valor 1 é assumido pra primary key do single
-- 2 para duploe, 3 para casal e 4 para suito.
INSERT INTO Tipo_Quartos (nome, preco, created_at, updated_at) VALUES
	('single', 25, current_timestamp, current_timestamp),
	('duplo', 25, current_timestamp, current_timestamp),
	('casal', 25, current_timestamp, current_timestamp),
	('suite', 25, current_timestamp, current_timestamp);

INSERT INTO Hotels (nome, endereco, telefone, created_at, updated_at) VALUES
	('Doguinhos', 		'R. Blumenau, 302', 		'5599882211', current_timestamp, current_timestamp),
	('Tangerine Dream', 'R. Laranja, 42', 			'6611111111', current_timestamp, current_timestamp),
	('Air', 			'R. XV de Novembro, 95', 	'6612341234', current_timestamp, current_timestamp);

INSERT INTO Clientes (nome, endereco, telefone, created_at, updated_at) VALUES
	('Anna Karenina', 		'R. Itajai, 101', 	'5511222222', current_timestamp, current_timestamp),
	('Lev Tolstoy', 		'R. Curitiba, 202', '5522333333', current_timestamp, current_timestamp),
	('Andrei Tarkovsky', 	'R. Curitiba, 203', '5533444444', current_timestamp, current_timestamp),
	('Andrzej Sapkowski', 	'R. Londrina, 511', '6611222222', current_timestamp, current_timestamp),
	('Hidetoshi Sato', 		'R. Peixe, 95', 	'6622333333', current_timestamp, current_timestamp),
	('Kazuki Fuse', 		'R. Lobo, 10', 		'6633444444', current_timestamp, current_timestamp),
	('Keanu Reeves', 		'R. Lobo, 20', 		'6644555555', current_timestamp, current_timestamp);

INSERT INTO Empregados (nome, created_at, updated_at) VALUES
	('Sen', current_timestamp, current_timestamp),
	('Lin', current_timestamp, current_timestamp);
--
INSERT INTO Tipo_Servicos (nome, custo, created_at, updated_at) VALUES
	('Malabarista', 100, current_timestamp, current_timestamp),
	('Exorcista', 1000, current_timestamp, current_timestamp),
	('Waifu', 250, current_timestamp, current_timestamp);

-- -- numQuarto ser serial, irá criar a situação em que numero do quarto do hotel 2 comece em 3
INSERT INTO Quartos (num, hotel_id, tipo_quarto_id, andar, created_at, updated_at) VALUES
	(1, 1, 1, 2, current_timestamp, current_timestamp),
	(2, 1, 1, 3, current_timestamp, current_timestamp),
	(3, 1, 2, 2, current_timestamp, current_timestamp),
	(4, 1, 2, 3, current_timestamp, current_timestamp),
	(5, 1, 3, 2, current_timestamp, current_timestamp),
	(6, 1, 3, 3, current_timestamp, current_timestamp),
	(1, 2, 1, 1, current_timestamp, current_timestamp),
	(2, 2, 2, 2, current_timestamp, current_timestamp),
	(3, 2, 3, 3, current_timestamp, current_timestamp),
	(4, 2, 4, 4, current_timestamp, current_timestamp);
--
-- -- INSERT INTO Limpeza (numQuarto, idHotel, data, hora, idEmpregado) VALUES
--
-- INSERT INTO Estadias (idCliente, numQuarto, idHotel, dataCheckIn, dataCheckOut) VALUES
-- 	(1, 1, 1, '10/12/2016', '10/16/2016', current_timestamp, current_timestamp);
--
-- INSERT INTO Servicos (idTipoServico, idCliente, numQuarto, idHotel, dataCheckIn, data, hora) VALUES
-- 	(1, 1, 1, 1, '10/12/2016', '10/13/2016', '10:10', current_timestamp, current_timestamp);

-- Quando faço reserva de um quarto precisa de tipo de quarto
-- INSERT INTO Reserva (idCliente, numQuarto, idHotel, dataReserva, dataCheckIn, dataCheckOut, valorEntrada) VALUES
