-- adicionar uma estadia apenas para quartos livres
-- adicionar uma reserva apenas para quartos livres
-- serviço só pode ser pedido por quartos que possuem estadia
-- quarto adicionado deve ser de um hotel existente
-- estadia deve estar relacionado com um quarto existente


CREATE OR REPLACE FUNCTION verificaQuartoLivre() RETURNS trigger AS
$$
	BEGIN
		IF (SELECT 1 FROM estadia e WHERE e.numQuarto = new.numQuarto AND new.dataCheckIn BETWEEN e.dataCheckIn AND e.dataCheckIn) THEN
			RAISE EXCEPTION 'Já existe uma estadia nesse quarto';
		END IF;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER QuartoParaEstadia BEFORE INSERT ON estadia
FOR EACH ROW EXECUTE PROCEDURE verificaQuartoLivre;


