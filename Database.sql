create table endereco(
	codEnd int primary key,
	estado varchar(50),
	cidade varchar(50),
	bairro varchar(50),
	rua varchar(50),
	numero int
);

create table parque (
	nomeParque varchar(50),
	codEnd int references endereco(codEnd),
	codParque int primary key
);

create table setor(
	codSetor int primary key,
	setor varchar(50),
	codFkParque int references parque(codParque)
);

create table acesso(
	codAcesso int primary key,
	tipoAcesso int,
	infoAcesso varchar(50)
);

create table tipoFuncionario(
	codTipoFunc int primary key,
	tipoFuncionario varchar(50),
	tipoAcesso varchar(50) references acesso(codAcesso)
);

create table funcionario(
	codFunc int primary key,
	nome varchar(50),
	codFkSetor int references setor(codsetor),
	codFkTipoFunc int references tipofuncionario(codtipofunc),
	senha varchar(50),
	usuario varchar(50)
);

create table status(
	codStatus int primary key,
	nomeStatus varchar(50)
);

create table tipoRequisicao(
	codTipoReq int primary key,
	tipoRequisicao varchar(50)
);

create table registro(
	codReg int primary key,
	dataReg timestamp
);

create table requisicao(
	codReq int primary key,
	infoReq varchar(50),
	codFkStatus int references status(codStatus),
	codFkFunc int references funcionario(codFunc),
	codFkTipoReq int references tipoRequisicao(codTipoReq),
	codFkReg int references registro(codReg)
);

create table pagina(
	codPagina int primary key,
	enderecoWeb varchar(50),
	online bool,
	totalVisitas int,
	codFkParque int references parque(codparque)
);

create table tipoAtracao(
	codTipoAtr int primary key,
	tipoAtracao varchar(50)
);

create table atracao(
	codAtracao int primary key,
	lucro float,
	manutencao bool,
	nomeAtr varchar(50),
	codFkParque int references parque(codparque),
	codFkTipoAtr int references tipoAtracao(codTipoAtr)
);

create table cliente(
	codCliente int primary key,
	nome varchar(50),
	codEnd int references endereco(codEnd),
	CPF varchar(50),
	telefone varchar(50),
	senha varchar(50),
	usuario varchar(50)
);

create table cartao(
	codCartao int primary key,
	saldo float,
	numCartao varchar(50),
	codFkCliente int references cliente(codcliente)
);

create table pagamentoAtracao(
	codPagamento int primary key,
	valor float,
	codFkCartao int references cartao(codCartao),
	codFkAtracao int references atracao(codatracao),
	codFkReg int references registro(codreg)
);
