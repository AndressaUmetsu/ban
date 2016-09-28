-- TipoQuarto (#idTipoQuarto, preco)
CREATE TABLE TipoQuarto
(
	idTipoQuarto int,
	preco real,
	PRIMARY KEY (idTipoQuarto)
)

WITH (OIDS = FALSE);

ALTER TABLE TipoQuarto OWNER TO postgres;


-- Hotel (#idHotel, nome, endereco, telefone)
CREATE TABLE Hotel
(
	idHotel int,
	nome varchar(20),
	endereco varchar(20),
	telefone varchar(12),
	PRIMARY KEY (idHotel)
)

WITH (OIDS = FALSE);

ALTER TABLE Hotel OWNER TO postgres;


-- Cliente (#idCliente, nome, endereco, telefone)
CREATE TABLE Cliente
(
	idCliente int,
	nome varchar(20),
	endereco varchar(20),
	telefone varchar(12),
	PRIMARY KEY (idCliente)
)

WITH (OIDS = FALSE);

ALTER TABLE Cliente OWNER TO postgres;


-- Empregado (#idEmpregado, nome)
CREATE TABLE Empregado
(
	idEmpregado int,
	nome varchar(20),
	PRIMARY KEY (idEmpregado)
)

WITH (OIDS = FALSE);

ALTER TABLE Empregado OWNER TO postgres;


-- TipoServico (#idTipoServico, custo)
CREATE TABLE TipoServico
(
	idTipoServico int,
	custo real,
	PRIMARY KEY (idTipoServico)
)

WITH (OIDS = FALSE);

ALTER TABLE TipoServico OWNER TO postgres;


-- Quarto (#numQuarto, localizacao, &idTipoQuarto, #&idHotel)
CREATE TABLE Quarto
(
	numQuarto int,
	idHotel int,
	idTipoQuarto int,
	andar int,
	PRIMARY KEY (numQuarto, idHotel),
	FOREIGN KEY (idHotel) REFERENCES Hotel (idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idTipoQuarto) REFERENCES TipoQuarto (idTipoQuarto)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
)

WITH (OIDS = FALSE);

ALTER TABLE Quarto OWNER TO postgres;


-- Limpeza (#&numQuarto, #&idHotel, #data, #hora, &idEmpregado)
CREATE TABLE Limpeza
(
	numQuarto int,
	idHotel int,
	data date,
	hora time,
	idEmpregado int,
	PRIMARY KEY (numQuarto, idHotel, data, hora),
	FOREIGN KEY (idHotel) REFERENCES Hotel (idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto) REFERENCES Quarto (numQuarto)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idEmpregado) REFERENCES Empregado (idEmpregado)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
)

WITH (OIDS = FALSE);

ALTER TABLE Limpeza OWNER TO postgres;


-- Servico (#idServico, &idTipoServico, &idCliente, &numQuarto, &idHotel, &dataCheckIn, data, hora)
CREATE TABLE Servico
(
	idServico int,
	idTipoServico int,
	idCliente int,
	numQuarto time,
	idHotel int,
	dataCheckIn time,
	data date,
	hora time,
	PRIMARY KEY (idServico),
	FOREIGN KEY (idTipoServico) REFERENCES TipoServico (idTipoServico)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idCliente, numQuarto, idHotel, dataCheckIn) REFERENCES Estadia (idCliente, numQuarto, idHotel, dataCheckIn)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
)

WITH (OIDS = FALSE);

ALTER TABLE Servico OWNER TO postgres;


-- Estadia (#&idCliente, #&numQuarto, #&idHotel, #dataCheckIn, dataCheckOut)
CREATE TABLE Estadia
(
	idCliente int,
	numQuarto time,
	idHotel int,
	dataCheckIn date,
	dataCheckOut date,
	PRIMARY KEY (idCliente, numQuarto, idHotel, dataCheckIn),
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quarto (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
)

WITH (OIDS = FALSE);

ALTER TABLE Estadia OWNER TO postgres;


-- Reserva (#&idCliente, #&numQuarto, #&idHotel, #dataReserva, dataCheckIn, dataCheckOut, valorEntrada)
CREATE TABLE Reserva
(
	idCliente int,
	numQuarto time,
	idHotel int,
	dataReserva date,
	dataCheckIn date,
	dataCheckOut date,
	valorEntrada real,
	PRIMARY KEY (idCliente, numQuarto, idHotel, dataReserva),
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quarto (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
)

WITH (OIDS = FALSE);

ALTER TABLE Reserva OWNER TO postgres;
