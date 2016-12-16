--1. Juego al que se han empatado más partidas. 

select p.juego
from partida p
where p.resultado = 0
group by p.juego
having count(*) = (select max(cuenta)
                  from (select count(*) as cuenta 
                  from partida p
                  where p.resultado = 0
                  group by p.juego));

--2. Número de partidas que ha jugado cada “retador” contra adversarios más jóvenes que él.  


select distinct retador.nick
from (((jugador retador join partida on retador.nick = partida.nickretador) join jugador retado on retado.nick = partida.nickretado))
where retado.edad < retador.edad;

--3. Maestros de un juego que han jugado partidas a otros juegos.  

select distinct nick
from maestro m join partida p on m.nick = p.nickretador or m.nick = p.nickretado
where m.juego <> p.juego;

--4. Nick, edad y número de juegos en los que son maestros aquellas personas que han jugado más de 100 partidas (a cualquier juego).

select nick,edad, count(*)
from (select * from maestro natural join jugador) maestros join partida p on nick = p.nickretador or  nick = p.nickretado
group by nick, edad
having count(*) > 20;

--select cuentao + cuentaor as suma, p1 as nick
--from (select count(*) as cuentao, p.nickretado as p1
--from partida p
--group by nickretado)
--natural join
--(select count(*) as cuentaor, p.nickretador as p1
--from partida p
--group by nickretador);





--5. Nick  de  las  personas  que  sólo  han  retado  al  ajedrez,  es  decir,  que  no  han  jugado  como retadores en otro juego que no sea el ajedrez.  
--6. Número de partidas ganadas por el retador, por el retado y empatadas para cada juego.  
