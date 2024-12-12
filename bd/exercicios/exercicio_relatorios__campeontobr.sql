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
 
select 
-- timestampdiff(year, dt_nascimento, curdate()) as idade,
-- 2024-year(dt_nascimento) idade,
datediff(curdate(), dt_nascimento) div 365.25 idade,
count(*) as quantidade_jogadores
from jogador
where dt_nascimento is not null and posicao not in ('Auxiliar técnico', 'Técnico')
group by idade
order by idade desc;

-- 05. Elabore um relatório por jogador e quantidade de cartões, 
-- detalhar também a quantidade de Cartões Vermelho e Amarelo
-- ordene pela quantidade total de Cartões
/* exemplo:
numero 	nome 			qt_amarelo 	qt_vermelho qt_total
16		Jadson			15			1			16
19		Emanuel Brítez	12			2			14
3		Zé Marcos		12			2			14
10		Luciano			12			1			13
.
.
*/
select
tb.*,
qt_amarelo + qt_vermelho qt_cartoes
from (
select 
numero, 
nome, 
sum(if(descricao like '%amarelo%',1,0)) qt_amarelo,
sum(if(descricao like '%vermelho%',1,0)) qt_vermelho
from jogador as j
inner join evento as e on j.id_jogador = e.id_jogador
where descricao like 'cartão%'
group by numero, nome) tb;
    
-- 06. Deseja-se saber qual a quantidade de jogos que aconteceram por dia
/* exemplo:
dia		quantidade
sábado	98
domingo	121
terça	11
quarta	64
quinta	29
segunda	11
sexta	8
*/
select * from partida
;
-- 07. Desejase saber a quantidade total de cada evento 
-- e quantos aconteceram ate os 45min e depois dos 45min
/*exemplo:
descricao									total	ate_45		depois_45
Gol (Gol de campo)							734		327			407
Cartão Amarelo								1806	658			1148
Substituição								3256	112			3144
Bola na Trave								217		93			124
Pênalti Perdido								23		12			11
Cartão Vermelho								80		25			55
Gol anulado (Var)							39		17			22
Cartão Vermelho (Segundo Cartão Amarelo)	44		7			37
Gol (Pênalti)								71		37			34
Gol (Gol Contra)							14		5			9
*/
select descricao, count(*) as total,
    sum(case when minuto <= 45 then 1 else 0 end) as ate_45,
    sum(case when minuto > 45 then 1 else 0 end) as depois_45
from evento
group by descricao;

-- 08. Deseja-se saber a quantidade dos eventos:
-- "Bola na Trave", "Pênalti Perdido" , "Gol anulado (Var)" pelos clubes
/*exemplo:
sigla 	Bola na Trave 	Pênalti Perdido Gol anulado (Var)
ACG		4				2				2
CAP		12				1				1
CAM		16				1				3
BAH		12				0				1
BOT		10				2				1
*/
select sigla, 
sum(if(descricao = 'Bola na Trave',1,0)) 'Bola na Trave',
sum(if(descricao = 'Pênalti Perdido',1,0)) 'Bola na Trave',
sum(if(descricao = 'Gol anulado (Var)',1,0)) 'Bola na Trave'
from evento as e
inner join jogador as j on t.id_time = j.id_time
inner join time as t on e.id_jogador = j.id_jogador
group by sigla;

-- 09. Deseja-se saber a quantidade de jogador por faixa etária
/*exemplo:
faixa_etaria	qt
Entre 30 e39	191
Entre 20 e29	405
Entre 10 e19	30
Entre 40 e49	4
*/
select
    case
        when timestampdiff(year, dt_nascimento, curdate()) between 30 and 39 then 'Entre 30-39 anos'
        when timestampdiff(year, dt_nascimento, curdate()) between 20 and 29 then 'Entre 20-29 anos'
        when timestampdiff(year, dt_nascimento, curdate()) between 10 and 19 then 'Entre 10-19 anos'
        when timestampdiff(year, dt_nascimento, curdate()) between 40 and 49 then 'Entre 40-49 anos'
        else 'Idade Indefinida'
    end as faixa_etaria,
    count(*) as quantidade
from
    jogador
group by
    faixa_etaria;

-- 10. Deseja-se saber o total de gols em cada estádio
/*exemplo:
nome_estadio									quantidade
Mineirão (Estádio Governador Magalhães Pinto)	87
Morumbi (Estádio Cícero Pompeu de Toledo)		80
Maracanã										77
Neo Química Arena								48
Estádio Alfredo Jaconi							48
*/
select 
    nome,
    sum(gol_mandante + gol_visitante) as quantidade
from
	partida as p
    inner join estadio as e on p.id_estadio = e.id_estadio
group by
   nome;
