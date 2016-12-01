-- TipoQuarto (#idTipoQuarto, preco, nome)
CREATE TABLE Tipo_Quartos
(
	id serial,
	nome varchar(16),
	preco real,
	PRIMARY KEY (id)
);

-- Hotel (#idHotel, nome, endereco, telefone)
CREATE TABLE Hotels
(
	id serial,
	nome varchar(20),
	endereco varchar(40),
	telefone varchar(12),
	PRIMARY KEY (id)
);

-- Cliente (#idCliente, nome, endereco, telefone)
CREATE TABLE Clientes
(
	id serial,
	nome varchar(20),
	endereco varchar(20),
	telefone varchar(12),
	PRIMARY KEY (id)
);

-- Empregado (#idEmpregado, nome)
CREATE TABLE Empregados
(
	id serial,
	nome varchar(20),
	PRIMARY KEY (id)
);

-- TipoServico (#idTipoServico, custo, nome)
CREATE TABLE Tipo_Servicos
(
	id serial,
	nome varchar(16),
	custo real,
	PRIMARY KEY (id)
);

-- Quarto (#numQuarto, &idTipoQuarto, #&idHotel, andar)
CREATE TABLE Quartos
(
	id serial,
	numQuarto int,
	idHotel int,
	idTipoQuarto int,
	andar int,
	PRIMARY KEY (id),
	FOREIGN KEY (idHotel) REFERENCES Hotels (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idTipoQuarto) REFERENCES TipoQuartos (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Limpeza (#&numQuarto, #&idHotel, #data, #hora, &idEmpregado)
CREATE TABLE Limpezas
(
	id serial,
	idQuarto int,
	idHotel int,
	data date,
	hora time,
	idEmpregado int,
	PRIMARY KEY (id),
	FOREIGN KEY (idHotel) REFERENCES Hotels (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idQuarto) REFERENCES Quartos (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idEmpregado) REFERENCES Empregados (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Estadia (&idCliente, #&numQuarto, #&idHotel, #dataCheckIn, dataCheckOut)
CREATE TABLE Estadias
(
	id serial,
	idCliente int,
	idQuarto int,
	idHotel int,
	dataCheckIn date,
	dataCheckOut date,
	PRIMARY KEY (id),
	FOREIGN KEY (idCliente) REFERENCES Clientes (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idQuarto) REFERENCES Quartos (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idHotel) REFERENCES Hotels (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Servico (idServico, &idTipoServico, &idCliente, &numQuarto, &idHotel, &dataCheckIn, data, hora)
CREATE TABLE Servicos
(
	id serial,
	idTipoServico int,
	idEstadia int,
	idQuarto int,
	idHotel int,
	dataCheckIn date,
	data date,
	hora time,
	PRIMARY KEY (id),
	FOREIGN KEY (idTipoServico) REFERENCES TipoServicos (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idEstadia) REFERENCES Estadias (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idQuarto) REFERENCES Quartos (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idHotel) REFERENCES Hotels (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Reserva (&idCliente, #&numQuarto, #&idHotel, #dataReserva, dataCheckIn, dataCheckOut, valorEntrada )
CREATE TABLE Reservas
(
	id serial,
	idCliente int,
	idQuarto int,
	idHotel int,
	dataReserva date,
	dataCheckIn date,
	dataCheckOut date,
	valorEntrada real,
	PRIMARY KEY (id),
	FOREIGN KEY (idCliente) REFERENCES Clientes (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idQuarto) REFERENCES Quartos (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idHotel) REFERENCES Hotels (id)
		MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);
