-- serviço só pode ser pedido por quartos que possuem estadia
-- quarto adicionado deve ser de um hotel existente
-- estadia deve estar relacionado com um quarto existente

-- Reserva

CREATE OR REPLACE FUNCTION verificaQuartoLivre_Reserva() RETURNS trigger AS
$$
	DECLARE VidCliente INT;
	BEGIN
		IF (SELECT 1 FROM estadia e WHERE e.numQuarto = new.numQuarto AND new.dataCheckIn BETWEEN e.dataCheckIn AND e.dataCheckOut) THEN
			RAISE EXCEPTION 'Já existe uma estadia nesse quarto';
		ELSE
			IF (SELECT 1 FROM reserva r WHERE r.numQuarto = new.numQuarto AND new.dataCheckIn BETWEEN r.dataCheckIn AND r.dataCheckOut) THEN
				RAISE EXCEPTION 'Já existe uma reserva nesse quarto';
			END IF;
		END IF;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER QuartoParaReserva
BEFORE INSERT OR UPDATE ON reserva
FOR EACH ROW EXECUTE PROCEDURE verificaQuartoLivre_Reserva();

-- Estadia

CREATE OR REPLACE FUNCTION verificaQuartoLivre_Estadia() RETURNS trigger AS
$$
	DECLARE VidCliente INT;
	BEGIN
		IF (SELECT 1 FROM estadia e WHERE e.numQuarto = new.numQuarto AND new.dataCheckIn BETWEEN e.dataCheckIn AND e.dataCheckOut) THEN
			RAISE EXCEPTION 'Já existe uma estadia nesse quarto';
		ELSE
			SELECT r.idCliente INTO VidCliente FROM reserva r WHERE r.numQuarto = new.numQuarto AND r.dataCheckIn = new.dataCheckIn;
			IF (VidCliente != new.idCliente) THEN
				RAISE EXCEPTION 'Quarto reservado para outro cliente';
			END IF;
		END IF;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER QuartoParaEstadia
BEFORE INSERT OR UPDATE ON estadia
FOR EACH ROW EXECUTE PROCEDURE verificaQuartoLivre_Estadia();

CREATE OR REPLACE FUNCTION verificaNumero(text) RETURNS BOOLEAN AS
$$
	DECLARE x NUMERIC;
	BEGIN
		x = $1::NUMERIC;
		RETURN TRUE;
		EXCEPTION WHEN others THEN
		RETURN FALSE;
	END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION validaTelefone() RETURNS trigger AS
$$
	DECLARE telefone text;
	BEGIN
		telefone = new.telefone;
		IF NOT verificaNumero(telefone) THEN
			RAISE EXCEPTION 'Telefone inválido, não é composto de somente números.';
		END IF;
		IF length(telefone) < 8 THEN
			RAISE EXCEPTION 'Telefone muito curto.';
		END IF;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ValidaTelefoneCliente
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW EXECUTE PROCEDURE validaTelefone();

CREATE TRIGGER ValidaTelefoneHotel
BEFORE INSERT OR UPDATE ON hotel
FOR EACH ROW EXECUTE PROCEDURE validaTelefone();

-- IdQuarto sequencial

CREATE OR REPLACE FUNCTION numSequencial() RETURNS trigger AS
$$
	DECLARE maximo INT := 0;
	BEGIN
		SELECT MAX(q.numQuarto) INTO maximo FROM quarto q WHERE q.idHotel = new.idHotel;
		IF maximo IS NULL THEN
			maximo = 0;
		END IF;
		maximo := maximo + 1;
		new.numQuarto := maximo;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER GerarNumQuarto BEFORE INSERT ON quarto
FOR EACH ROW EXECUTE PROCEDURE numSequencial();
