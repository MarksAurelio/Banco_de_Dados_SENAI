-- trigger chamado antes_inserir_evento que impede a inserção de registros na tabela evento
-- caso o jogador especificado (NEW.id_jogador) não pertença a um dos dois times envolvidos na partida (NEW.id_partida).
-- Aqui está uma análise do funcionamento e algumas observações para ajustes, caso necessário:
use campeonatobrasileiro;

DELIMITER $$

CREATE TRIGGER antes_inserir_evento
BEFORE INSERT ON evento
FOR EACH ROW
BEGIN
	DECLARE stJogador BOOLEAN DEFAULT FALSE;
    SELECT TRUE INTO stJogador FROM partida as p
    INNER JOIN jogador as j ON p.id_mandante = j.id_time OR p.id_visitante = j.id_time
    WHERE id_partida = NEW.id_partida AND id_jogador = NEW.id_jogador;
    
    IF NOT stJogador THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não permitido gravar um jogador nessa partida';
	END IF;
END$$

DELIMITER ;

select * from evento where id_partida = 1;