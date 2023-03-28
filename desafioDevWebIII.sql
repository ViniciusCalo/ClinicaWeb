CREATE DATABASE dbClinica;
use dbClinica;

create table tbPaciente(
	codPaciente int auto_increment,
    nomePaciente varchar(255) not null,
    telPaciente varchar(20) not null,
    celPaciente varchar(20) not null,
    primary key(codPaciente)
);

create table tbEspecialidade(
	codEspecialidade int auto_increment,
	especialidade varchar(255) not null,
    primary key(codEspecialidade)
);

create table tbMedico(
	codMedico int auto_increment,
    nomeMedico varchar(255) not null,
    telMedico varchar(20) not null,
    celMedico varchar(20) not null,
    codEspecialidade int,
    primary key(codMedico),
    foreign key (codEspecialidade) references tbEspecialidade(codEspecialidade)
);

create table tbAgendamento(
	codAgendamento int primary key auto_increment,
    dataAgendamento date,
    horaAgendamento time,
    codPaciente int,
    codMedico int,
    foreign key (codPaciente) references tbPaciente(codPaciente),
    foreign key (codMedico) references tbMedico(codMedico),
	diagnosticoAgendamento varchar(255)
);


insert into tbEspecialidade (especialidade) values ('Fisioterapia');
insert into  tbEspecialidade (especialidade) values ('Cirurgião');
insert into  tbEspecialidade (especialidade) values ('Pediatra');
insert into  tbEspecialidade (especialidade) values ('Clinico Geral');
insert into  tbEspecialidade (especialidade) values ('Otorrinolaringologista');