create table endereco(
	codEnd int primary key,
	estado char(50),
	cidade char(50),
	bairro char(50),
	rua char(50),
	numero int
);

create table parque (
	nomeParque char(50),
	codEnd int references endereco(codEnd),
	codParque int primary key
);

create table setor(
	codSetor int primary key,
	setor char(50),
	codFkParque int references parque(codParque)
);

create table tipoFuncionario(
	codTipoFunc int primary key,
	tipoFuncionario char(50),
	tipoAcesso char(50)
);

create table funcionario(
	codFunc int primary key,
	nome char(50),
	codFkSetor int references setor(codsetor),
	codFkTipoFunc int references tipofuncionario(codtipofunc)
);

create table status(
	codStatus int primary key,
	nomeStatus char(50)
);

create table tipoRequisicao(
	codTipoReq int primary key,
	tipoRequisicao char(50)
);

create table registro(
	codReg int primary key,
	dataReg timestamp
);

create table requisicao(
	codReq int primary key,
	infoReq char(50),
	codFkStatus int references status(codStatus),
	codFkFunc int references funcionario(codFunc),
	codFkTipoReq int references tipoRequisicao(codTipoReq),
	codFkReg int references registro(codReg)
);

create table pagina(
	codPagina int primary key,
	enderecoWeb char(50),
	online bool,
	totalVisitas int,
	codFkParque int references parque(codparque)
);

create table tipoAtracao(
	codTipoAtr int primary key,
	tipoAtracao char(50)
);

create table atracao(
	codAtracao int primary key,
	lucro float,
	manutencao bool,
	nomeAtr char(50),
	codFkParque int references parque(codparque),
	codFkTipoAtr int references tipoAtracao(codTipoAtr)
);

create table cliente(
	codCliente int primary key,
	nome char(50),
	codEnd int references endereco(codEnd),
	CPF char(50),
	telefone char(50)
);

create table cartao(
	codCartao int primary key,
	saldo float,
	numCartao char(50),
	codFkCliente int references cliente(codcliente)
);

create table pagamentoAtracao(
	codPagamento int primary key,
	valor float,
	codFkCartao int references cartao(codCartao),
	codFkAtracao int references atracao(codatracao),
	codFkReg int references registro(codreg)
);