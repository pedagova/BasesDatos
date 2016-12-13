CREATE TABLE jugador( 
  nick varchar2(15) CONSTRAINT  nick_cn NOT NULL, 
  sexo VARCHAR2(1) constraint sexi_cn not null,
  edad number CONSTRAINT  edad_cn NOT NULL, 
  PRIMARY KEY (nick)
);

CREATE TABLE partida( 
  nickRetador varchar2(15) CONSTRAINT  nickRetador_cn NOT NULL, 
  nickRetado varchar2(15) CONSTRAINT  nickretado_cn NOT NULL,
  juego VARCHAR2(20) constraint juego_cn not null,
  fecha date CONSTRAINT  fecha_cn NOT NULL,
  resultado number, 
  PRIMARY KEY (nickRetador, nickRetado),
  FOREIGN KEY(nickRetador) references jugador(nick),
  FOREIGN KEY(nickRetado) references jugador(nick)
);

create table maestro(
  nick varchar2(15)  CONSTRAINT  nickM_cn NOT NULL,
  juego varchar2(20) CONSTRAINT  juegosM_cn NOT NULL,
  primary key (nick, juego),
  foreign key (nick) references jugador(nick)
);
