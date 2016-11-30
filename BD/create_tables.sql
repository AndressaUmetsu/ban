-- TipoQuarto (#idTipoQuarto, preco, nome)
CREATE TABLE TipoQuartos
(
	idTipoQuarto serial,
	nome varchar(16),
	preco real,
	PRIMARY KEY (idTipoQuarto)
);

-- Hotel (#idHotel, nome, endereco, telefone)
CREATE TABLE Hotels
(
	idHotel serial,
	nome varchar(20),
	endereco varchar(40),
	telefone varchar(12),
	PRIMARY KEY (idHotel)
);

-- Cliente (#idCliente, nome, endereco, telefone)
CREATE TABLE Clientes
(
	idCliente serial,
	nome varchar(20),
	endereco varchar(20),
	telefone varchar(12),
	PRIMARY KEY (idCliente)
);

-- Empregado (#idEmpregado, nome)
CREATE TABLE Empregados
(
	idEmpregado serial,
	nome varchar(20),
	PRIMARY KEY (idEmpregado)
);

-- TipoServico (#idTipoServico, custo, nome)
CREATE TABLE TipoServicos
(
	idTipoServico serial,
	nome varchar(16),
	custo real,
	PRIMARY KEY (idTipoServico)
);

-- Quarto (#numQuarto, &idTipoQuarto, #&idHotel, andar)
CREATE TABLE Quartos
(
	numQuarto int,
	idHotel int,
	idTipoQuarto int,
	andar int,
	PRIMARY KEY (numQuarto, idHotel),
	FOREIGN KEY (idHotel) REFERENCES Hotels (idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idTipoQuarto) REFERENCES TipoQuartos (idTipoQuarto)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Limpeza (#&numQuarto, #&idHotel, #data, #hora, &idEmpregado)
CREATE TABLE Limpezas
(
	numQuarto int,
	idHotel int,
	data date,
	hora time,
	idEmpregado int,
	PRIMARY KEY (numQuarto, idHotel, data, hora),
	FOREIGN KEY (idHotel) REFERENCES Hotels (idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quartos (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idEmpregado) REFERENCES Empregados (idEmpregado)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Estadia (&idCliente, #&numQuarto, #&idHotel, #dataCheckIn, dataCheckOut)
CREATE TABLE Estadias
(
	idCliente int,
	numQuarto int,
	idHotel int,
	dataCheckIn date,
	dataCheckOut date,
	PRIMARY KEY (numQuarto, idHotel, dataCheckIn),
	FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quartos (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Servico (idServico, &idTipoServico, &idCliente, &numQuarto, &idHotel, &dataCheckIn, data, hora)
CREATE TABLE Servicos
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
	FOREIGN KEY (idTipoServico) REFERENCES TipoServicos (idTipoServico)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel, dataCheckIn) REFERENCES Estadias (numQuarto, idHotel, dataCheckIn)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Reserva (&idCliente, #&numQuarto, #&idHotel, #dataReserva, dataCheckIn, dataCheckOut, valorEntrada )
CREATE TABLE Reservas
(
	idCliente int,
	numQuarto int,
	idHotel int,
	dataReserva date,
	dataCheckIn date,
	dataCheckOut date,
	valorEntrada real,
	PRIMARY KEY (numQuarto, idHotel, dataReserva),
	FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numQuarto, idHotel) REFERENCES Quartos (numQuarto, idHotel)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);
