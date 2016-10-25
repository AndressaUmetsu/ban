-- adicionar uma estadia apenas para quartos livres
-- adicionar uma reserva apenas para quartos livres
-- serviço só pode ser pedido por quartos que possuem estadia
-- quarto adicionado deve ser de um hotel existente
-- estadia deve estar relacionado com um quarto existente


CREATE OR REPLACE FUNCTION verificaQuartoLivre() RETURNS trigger AS
$$
	BEGIN
		IF (SELECT 1 FROM estadia e WHERE e.numQuarto = new.numQuarto AND new.dataCheckIn BETWEEN e.dataCheckIn AND e.dataCheckOut) THEN
			RAISE EXCEPTION 'Já existe uma estadia nesse quarto';
		END IF;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER QuartoParaEstadia
BEFORE INSERT OR UPDATE ON estadia
FOR EACH ROW EXECUTE PROCEDURE verificaQuartoLivre();
CREATE TRIGGER QuartoParaReserva
BEFORE INSERT OR UPDATE ON reserva
FOR EACH ROW EXECUTE PROCEDURE verificaQuartoLivre();

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
