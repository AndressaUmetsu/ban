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


CREATE OR REPLACE FUNCTION verificaQuartoTemEstadia() RETURNS trigger AS
$$
BEGIN
	--idCliente, #&numQuarto, #&idHotel, #dataCheckIn
	-- NÃO ESTÁ COMPLETO, FALTA COISA NO JOIN
	IF NOT (SELECT 1 FROM estadia e JOIN servico s ON (e.numQuarto = s.numQuarto)) THEN
		RAISE EXCEPTION 'Já existe uma estadia nesse quarto';
	END IF;
	RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ServicoVerificaQuartoEstadia
BEFORE INSERT OR UPDATE ON servico
FOR EACH ROW EXECUTE PROCEDURE verificaQuartoTemEstadia();

-- IdQuarto sequencial

CREATE OR REPLACE FUNCTION numSequencial() RETURNS trigger AS
$$
	DECLARE maximo INT;
	BEGIN
		SELECT MAX(q.numQuarto) INTO maximo FROM quarto q WHERE q.idHotel = new.idHotel;
		maximo := maximo + 1;
		new.numQuarto := maximo;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER GerarNumQuarto BEFORE INSERT ON quarto
FOR EACH ROW EXECUTE PROCEDURE numSequencial();



