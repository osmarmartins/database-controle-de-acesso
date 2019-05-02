/*
	RELAÇÃO DE AUTORIZAÇÕES DOS SISTEMAS (login_autorizacao)
    ==============================================================
    Classificação das funcionalidades do sistemas que poderão ser 
    liberadas ou bloqueadas de acordo com os privilégios (autorizações)
    Exemplo:
    Cadastro de vendedores
    Cadastro de clientes
    Cadastro de produtos
    Pedido de venda
    Faturamento de pedido
    Relatório de contas a pagar
    etc...
*/
create table login_autorizacao (
    id_autorizacao integer unsigned auto_increment,
    classificacao varchar(100),
    descricao varchar(200),
    ativo boolean default true,
    versao integer default 0,
    primary key (id_autorizacao)
) engine=innoDB;



/*
	PERFIL DE USUÁRIOS (login_perfil)
    =======================================
    Grupo de usuários do sistema. 
    Podendo ser agrupados por setor, função, módulos, etc...
    Exemplo:
    ADMINISTRADOR
    USUARIO
    ATENDENTE
    FISCAL
    MARKETING
    etc...
*/
CREATE TABLE login_perfil (
  id_perfil int(10) unsigned NOT NULL AUTO_INCREMENT,
  descricao varchar(20) DEFAULT NULL,
  notificar_inclusao_usuario tinyint(4) DEFAULT '0',
  ativo tinyint(1) DEFAULT '1',
  versao int(11) DEFAULT '0',
  PRIMARY KEY (id_perfil)
) ENGINE=InnoDB;

/*
	OPERAÇÕES POR PERFIL (login_perfil_operacao)
    ============================================
    Relação das operações disponíveis por perfil (grupo) de usuários.
    Informação necessária na autorização das funcionalidades.
    Exemplo:
    +----------------+-----------------------------------------------------+
    | P E R F I L    | O P E R A Ç Ã O (privilégios)                       | 
    +----------------+-----------------------------------------------------+
    | MASTER         | Todas as operações                                  | 
    +----------------+-----------------------------------------------------+
    | ADMINISTRADOR  | Manutenção de usuários, Cancelamento de Venda, ...  |
    +----------------+-----------------------------------------------------+
    | VENDEDOR       | Cadastro cliente, pedido de venda, orçamento...     | 
    +----------------+-----------------------------------------------------+
    | etc...         | ...                                                 |
    +----------------+-----------------------------------------------------+
*/
create table login_perfil_autorizacao (
    id_perfil integer unsigned not null,
    id_autorizacao integer unsigned not null,
    primary key (id_perfil, id_autorizacao)
) engine=innoDB;

alter table login_perfil_autorizacao add constraint fk_perfil_autorizacao_perfil
	foreign key (id_perfil) references login_perfil (id_perfil);

alter table login_perfil_autorizacao add constraint fk_perfil_autorizacao_autorizacao
	foreign key (id_autorizacao) references login_autorizacao (id_autorizacao);


/*
	RELAÇÃO DE USUÁRIOS (login_usuario)
    ========================================
    Usuários com autorização de uso do sistema.
*/

create table login_usuario (
	id_usuario integer unsigned auto_increment,
    nome varchar(100),
    login varchar(30),
    email varchar(100) not null,
    senha varchar(30) not null,
    ativo boolean default true,
    versao integer default 0,
    primary key (id_usuario)
) engine=innoDB;


/*
	USUÁRIOS POR PERFIL (login_usuario_perfil)
    ==========================================
    Relação de usuários agrupados por perfil.
    Exemplo:
    +----------------+-----------------------------------------------------+
    | P E R F I L    | U S U Á R I O S                                     | 
    +----------------+-----------------------------------------------------+
    | MASTER         | Pedro, Angela                                       | 
    +----------------+-----------------------------------------------------+
    | ADMINISTRADOR  | João, Paulo, Fabiana, ...                           |
    +----------------+-----------------------------------------------------+
    | VENDEDOR       | João, Maria, Paulo, Antônio, Creuza, ...            | 
    +----------------+-----------------------------------------------------+
    | etc...         | ...                                                 |
    +----------------+-----------------------------------------------------+
*/
create table login_usuario_perfil (
    id_usuario integer unsigned,
    id_perfil integer unsigned,
    primary key (id_usuario, id_perfil)
) engine=innoDB;

alter table login_usuario_perfil add constraint fk_usuario_perfil_usuario
	foreign key (id_usuario) references login_usuario (id_usuario);

alter table login_usuario_perfil add constraint fk_usuario_perfil_perfil
	foreign key (id_perfil) references login_perfil (id_perfil);

