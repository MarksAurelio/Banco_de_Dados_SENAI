-- 01. Atualize na tabela evento as descrições 
-- DE "Substitution" PARA "Substituição"
SET SQL_SAFE_UPDATES=0;
update evento set descricao = 'Substituição' where descricao = 'Substitution';
select * from evento where descricao = 'Substituição';

-- DE "Woodwork" PARA "Bola na Trave"
update evento set descricao = 'Bola na Trave' where descricao = 'Woodwork';
select * from evento where descricao = 'Bola na Trave';

-- DE "Cartão Vermelho (Second Yellow Card)" PARA "Cartão Vermelho (Segundo Cartão Amarelo)"
update evento set descricao = 'Cartão Vermelho (Segundo Cartão Amarelo)' where descricao = 'Cartão Vermelho (Second Yellow Card)';
select * from evento where descricao = 'Cartão Vermelho (Segundo Cartão Amarelo)';

-- 02. Atualize o resultado das partidas do brasileirão 
-- que já aconteceram e ainda não foi gravado o resultado.
select id_partida, rodada, tm.sigla, gol_mandante, gol_visitante, tv.sigla
from partida as p
inner join time as tm on id_mandante = tm.id_time
inner join time as tv on id_visitante = tv.id_time
where gol_mandante is null or rodada >=35
order by id_partida;

update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 341;
update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 342;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 343;
update partida set gol_mandante = 2, gol_visitante = 2 where id_partida = 344;
update partida set gol_mandante = 4, gol_visitante = 1 where id_partida = 345;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 346;
update partida set gol_mandante = 3, gol_visitante = 1 where id_partida = 347;
update partida set gol_mandante = 0, gol_visitante = 0 where id_partida = 348;
update partida set gol_mandante = 0, gol_visitante = 0 where id_partida = 349;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 350;

select id_partida, rodada, tm.sigla, gol_mandante, gol_visitante, tv.sigla
from partida as p
inner join time as tm on id_mandante = tm.id_time
inner join time as tv on id_visitante = tv.id_time
where gol_mandante is null or rodada >=36
order by id_partida;

update partida set gol_mandante = 2, gol_visitante = 3 where id_partida = 351;
update partida set gol_mandante = 1, gol_visitante = 3 where id_partida = 352;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 353;
update partida set gol_mandante = 2, gol_visitante = 4 where id_partida = 354;
update partida set gol_mandante = 2, gol_visitante = 2 where id_partida = 355;
update partida set gol_mandante = 2, gol_visitante = 1 where id_partida = 356;
update partida set gol_mandante = 3, gol_visitante = 2 where id_partida = 357;
update partida set gol_mandante = 2, gol_visitante = 0 where id_partida = 358;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 359;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 360;

select id_partida, rodada, tm.sigla, gol_mandante, gol_visitante, tv.sigla
from partida as p
inner join time as tm on id_mandante = tm.id_time
inner join time as tv on id_visitante = tv.id_time
where gol_mandante is null or rodada >=37
order by id_partida;

update partida set gol_mandante = 0, gol_visitante = 1 where id_partida = 361;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 362;
update partida set gol_mandante = 1, gol_visitante = 1 where id_partida = 363;
update partida set gol_mandante = 1, gol_visitante = 0 where id_partida = 364;
update partida set gol_mandante = 2, gol_visitante = 0 where id_partida = 365;
update partida set gol_mandante = 3, gol_visitante = 0 where id_partida = 366;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 367;
update partida set gol_mandante = 1, gol_visitante = 2 where id_partida = 368;
update partida set gol_mandante = 3, gol_visitante = 1 where id_partida = 369;
update partida set gol_mandante = 3, gol_visitante = 0 where id_partida = 370;

select id_partida, rodada, tm.sigla, gol_mandante, gol_visitante, tv.sigla
from partida as p
inner join time as tm on id_mandante = tm.id_time
inner join time as tv on id_visitante = tv.id_time
where gol_mandante is null or rodada >=38
order by id_partida;

-- 03. Elabore um relatório por minuto e a quantidade de gols (não contar "Gol anulado (Var)")
-- e ordene pela quantidade do maior para o menor
select minuto, count(*) quantidade from evento
where descricao like 'Gol%' and descricao not like '%Var%'
-- descricao in ('Gol (Gol de campo)','Gol (Pênalti)','Gol (Gol Contra)')
group by minuto
order by quantidade desc;

-- 04. Elabore um relatório por idade e quantidade de jogadores
-- remover data nula e posições 'Auxiliar técnico e 'Técnico
-- ordene pela idade do mais velho ao mais novo
 
select timestampdiff(year, dt_nascimento, curdate()) as idade,
count(*) as quantidade_jogadores
from jogador
where dt_nascimento is not null and posicao not in ('Auxiliar técnico', 'Técnico')
group by idade
order by idade desc;

-- 05. Elabore um relatório por jogador e quantidade de cartões, 
-- detalhar também a quantidade de Cartões Vermelho e Amarelo
-- ordene pela quantidade total de Cartões
select 
	id_jogador,
    sum(if(descricao like '%Amarelo%', 1, 0))
