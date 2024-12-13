use campeonatobrasileiro;

DELIMITER $$

CREATE TRIGGER antes_de_inserir_usuario
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    IF NEW.nome IS NULL OR NEW.nome = '' THEN
        SET NEW.nome = 'Nome Padrão';
    END IF;
END;

DELIMITER ;