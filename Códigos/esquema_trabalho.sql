CREATE TABLE Usuario(
    nome_usuario varchar2(50) not null,
    email varchar2(50) not null,
    atividade char(1) default 'S',
    constraint pk_usuario 
        primary key (nome_usuario),
    constraint sk_usuario
        unique (email),
    constraint ck_usuario_atividade
        CHECK (upper(atividade) in ('S', 'N'))
);

CREATE TABLE Site(
    url varchar2(50) not null,
    nome varchar2(50) not null,
    dono varchar2(50) not null,
    constraint pk_site 
        primary key (url)
);

CREATE TABLE User_Site(
    site varchar2(50) not null,
    usuario varchar2(50) not null,
    nota number(4,2) not null, -- Formato XX.XX
    comentario varchar2(200),
    constraint pk_user_site
        primary key (site, usuario),
    constraint fk_user_site_nome_usuario
        foreign key (usuario) references Usuario(nome_usuario) on delete cascade,
    constraint fk_user_site_site
        foreign key (site) references Site(url) on delete cascade
);

CREATE TABLE Cliente(
    email varchar2(50) not null,
    tipo char(2) not null, 
    nome varchar2(50) not null,
    cnpj varchar2(14), -- Formato: XX.XXX.XXX/0001-XX
    cpf varchar2(11), -- Formato: XXX.XXX.XXX-XX
    genero char(1), -- Pus apenas Masculino (M) e Feminino (F)
    constraint pk_cliente
        primary key (email),
    constraint ck_cliente_tipo
        CHECK (upper(tipo) in ('PF', 'PJ')),
    constraint ck_cliente_genero
        CHECK (upper(genero) in ('M', 'F')),
    constraint ck_cliente_cpf
        check (regexp_like(cpf, '[0-9]{11}')),
    constraint ck_cliente_cnpj
        check (regexp_like(cnpj, '[0-9]{14}'))
);

CREATE TABLE Telefones(
    cliente varchar2(50) not null,
    telefone varchar2(13), -- Formato: (XX)XXXX-XXXX
    constraint pk_telefones
        primary key (cliente, telefone),
    constraint fk_telefones_cliente
        foreign key (cliente) references Cliente(email) on delete cascade
);

CREATE TABLE Servico(
    serv_cod int not null,
    site varchar2(50) not null,
    cliente varchar2(50) not null,
    tipo varchar2(5) not null,
    inicio date,
    custo number,
    preco number,
    duracao int,
    constraint pk_servico
        primary key (serv_cod),
    constraint fk_servico_site
        foreign key (site) references site(url) on delete cascade,
    constraint fk_servico_cliente
        foreign key (cliente) references cliente(email) on delete cascade,
    constraint ck_servico_tipo
        check (upper(tipo) in ('AVAL', 'ADAPT'))
);

CREATE TABLE Adaptacao(
    servico int not null,
    constraint pk_adaptacao
        primary key(servico),
    constraint fk_adaptacao_servico
        foreign key (servico) references servico(serv_cod) on delete cascade
);

CREATE TABLE Avaliacao(
    servico int not null,
    constraint pk_avaliacao
        primary key(servico),
    constraint fk_avaliacao_servico
        foreign key (servico) references servico(serv_cod) on delete cascade
);

CREATE TABLE Desenvolvedor(
    cpf char(11) not null,
    nome varchar2(50),
    endereco varchar2(50),
    salario number(6,2),    
    constraint pk_desenvolvedor
        primary key (cpf),
    constraint ck_desenvolvedor_cpf
        check (regexp_like(cpf, '[0-9]{11}'))
);

CREATE TABLE Consultor(
    cpf char(11) not null,
    nome varchar2(50),
    endereco varchar2(50),
    salario number(6,2),    
    constraint pk_consultor
        primary key (cpf),
    constraint ck_consultor_cpf
        check (regexp_like(cpf, '[0-9]{11}'))
);

CREATE TABLE Testador(
    cpf char(11) not null,
    nome varchar2(50),
    endereco varchar2(50),
    constraint pk_testador
        primary key (cpf),
    constraint ck_testador_cpf
        check (regexp_like(cpf, '[0-9]{11}'))
);

CREATE TABLE Pessoa_Func(
    pessoa_cpf char(11) not null,
    funcao char(2) not null,
    constraint pk_pessoa_func
        primary key (pessoa_cpf),
    constraint ck_pessoa_func_cpf
        check (regexp_like(pessoa_cpf, '[0-9]{11}')),
    constraint ck_pessoa_func_funcao
    	check (upper(funcao) in ('TE', 'DE', 'CO', 'DC'))
);

DROP TABLE Contribuicao;

CREATE TABLE Contribuicao(
    id number not null,
    avaliacao int not null,
    consultor char(11) not null,
    testador char(11) not null,
    data date,
    gratificacao number,
    nota number(4,2), -- Formato: XX.XX
    comentario varchar2(200),
    constraint pk_contribuicao
        primary key (id),
    constraint sk_contribuicao
        unique(avaliacao, consultor, testador),
    constraint fk_contribuicao_avaliacao
        foreign key (avaliacao) references avaliacao(servico) on delete cascade,
    constraint fk_contribuicao_consultor
        foreign key (consultor) references consultor(cpf) on delete cascade,
    constraint fk_contribuicao_testador
        foreign key (testador) references testador(cpf) on delete cascade
);

CREATE TABLE Problema(
    contribuicao number not null,
    tipo varchar2(200), -- Fiz a suposição de que se trata de uma descricao
    constraint pk_problema 
        primary key (contribuicao, tipo),
    constraint fk_problema_contribuicao
        foreign key (contribuicao) references contribuicao(id) on delete cascade
);

CREATE TABLE Mudanca(
    adaptacao int not null,
    data date not null,
    desenvolvedor char(11) not null,
    descricao varchar2(200),
    constraint pk_mudanca
        primary key (adaptacao, data, desenvolvedor),
    constraint fk_mudanca_adaptacao
        foreign key (adaptacao) references adaptacao(servico) on delete cascade,
    constraint fk_mudanca_desenvolvedor
        foreign key (desenvolvedor) references desenvolvedor(cpf) on delete cascade
);