create schema anotacao;

use anotacao;

create user 'user'@'db-projeto-integrador.ck0s1wz3xnuf.us-east-1.rds.amazonaws.com' identified by 'today16092020';

grant select, insert, delete, update on anotacao.* to user@'db-projeto-integrador.ck0s1wz3xnuf.us-east-1.rds.amazonaws.com';

create table usr_usuario (
  usr_id bigint unsigned not null auto_increment,
  usr_nome varchar(20) not null,
  usr_senha varchar(50) not null,
  primary key (usr_id),
  unique key uni_usuario_nome (usr_nome)
);

create table aut_autorizacao (
  aut_id bigint unsigned not null auto_increment,
  aut_nome varchar(20) not null,
  primary key (aut_id),
  unique key uni_aut_nome (aut_nome)
);

create table uau_usuario_autorizacao (
  usr_id bigint unsigned not null,
  aut_id bigint unsigned not null,
  primary key (usr_id, aut_id),
  foreign key aut_usuario_fk (usr_id) references usr_usuario (usr_id) on delete restrict on update cascade,
  foreign key aut_autorizacao_fk (aut_id) references aut_autorizacao (aut_id) on delete restrict on update cascade
);