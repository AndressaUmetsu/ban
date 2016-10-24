-- TipoQuarto (#idTipoQuarto, preco, nome)
CREATE TABLE TipoQuarto
(
	idTipoQuarto serial,
	nome varchar(16),
	preco real,
	PRIMARY KEY (idTipoQuarto)
);

-- Hotel (#idHotel, nome, endereco, telefone)
CREATE TABLE Hotel
(
	idHotel serial,
	nome varchar(20),
	endereco varchar(40),
	telefone varchar(12),
	PRIMARY KEY (idHotel)
);

-- Cliente (#idCliente, nome, endereco, telefone)
CREATE TABLE Cliente
(
	idCliente serial,
	nome varchar(20),
	endereco varchar(20),
	telefone varchar(12),
	PRIMARY KEY (idCliente)
);

-- Empregado (#idEmpregado, nome)
CREATE TABLE Empregado
(
	idEmpregado serial,
	nome varchar(20),
	PRIMARY KEY (idEmpregado)
);

-- TipoServico (#idTipoServico, custo, nome)
CREATE TABLE TipoServico
(
	idTipoServico serial,
	nome varchar(16),
	custo real,
	PRIMARY KEY (idTipoServico)
);
-- Quarto (#numQuarto, localizacao, &idTipoQuarto, #&idHotel)
CREATE TABLE Quarto
(
	numQuarto serial,
	idHotel int,
	idTipoQuarto int,
	andar int,
	PRIMARY KEY (numQuarto, idHotel),
	FOREIGN KEY (idHotel) REFERENCES Hotel (idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idTipoQuarto) REFERENCES TipoQuarto (idTipoQuarto)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

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
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quarto (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idEmpregado) REFERENCES Empregado (idEmpregado)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Estadia (#&idCliente, #&numQuarto, #&idHotel, #dataCheckIn, dataCheckOut)
CREATE TABLE Estadia
(
	idCliente int,
	numQuarto int,
	idHotel int,
	dataCheckIn date,
	dataCheckOut date,
	PRIMARY KEY (numQuarto, idHotel, dataCheckIn),
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quarto (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Servico (#idServico, &idTipoServico, &idCliente, &numQuarto, &idHotel, &dataCheckIn, data, hora)
CREATE TABLE Servico
(
	idServico serial,
	idTipoServico int,
	idCliente int,
	numQuarto int,
	idHotel int,
	dataCheckIn date,
	data date,
	hora time,
	PRIMARY KEY (idServico),
	FOREIGN KEY (idTipoServico) REFERENCES TipoServico (idTipoServico)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel, dataCheckIn) REFERENCES Estadia (numQuarto, idHotel, dataCheckIn)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Reserva (#&idCliente, #&numQuarto, #&idHotel, #dataReserva, dataCheckIn, dataCheckOut, valorEntrada)
CREATE TABLE Reserva
(
	idCliente int,
	numQuarto int,
	idHotel int,
	dataReserva date,
	dataCheckIn date,
	dataCheckOut date,
	valorEntrada real,
	PRIMARY KEY (numQuarto, idHotel, dataReserva),
	FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quarto (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);
