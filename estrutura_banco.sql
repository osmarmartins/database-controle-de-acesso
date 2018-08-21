/*
	RELAÇÃO DE OPERAÇÕES DOS SISTEMAS (login_operacao)
    ==================================================
    Classificação das funcionalidades do sistemas que poderão ser ativadas ou bloqueadas
    Exemplo:
    Cadastro de vendedores
    Cadastro de clientes
    Cadastro de produtos
    Pedido de venda
    Faturamento de pedido
    Relatório de contas a pagar
    etc...
*/
create table login_operacao (
	id_operacao integer unsigned auto_increment,
    classificacao varchar(100),
    descricao varchar(200),
    ativo boolean default true,
    versao integer default 0,
    primary key (id_operacao)
) engine=innoDB;



/*
	PERFIL DE USUÁRIOS (login_perfil)
    =================================
    Grupo de usuários do sistema. Podendo ser agrupados por setor, função, módulos, etc...
    Exemplo:
    ADMINISTRADOR
    USUARIO
    ATENDENTE
    FISCAL
    MARKETING
    etc...
*/
CREATE TABLE login_perfil (
    id_perfil INTEGER UNSIGNED AUTO_INCREMENT,
    descricao VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE,
    versao INTEGER DEFAULT 0,
    PRIMARY KEY (id_perfil)
)  ENGINE=INNODB;


/*
	OPERAÇÕES POR PERFIL (login_perfil_operacao)
    ============================================
    Relação das operações disponíveis por perfil (grupo) de usuários.
    Informação necessária na autorização das funcionalidades.
    Exemplo:
    +----------------+-----------------------------------------------------+
    | P E R F I L    | O P E R A Ç Ã O                                     | 
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
create table login_perfil_operacao (
    id_perfil integer unsigned not null,
    id_operacao integer unsigned not null,
    primary key (id_perfil, id_operacao)
) engine=innoDB;

alter table login_perfil_operacao add constraint fk_perfil_operacao_perfil
	foreign key (id_perfil) references login_perfil (id_perfil);
    
alter table login_perfil_operacao add constraint fk_perfil_operacao_operacao
	foreign key (id_operacao) references login_operacao (id_operacao);


/*
	RELAÇÃO DE USUÁRIOS (login_usuario)
    ===================================
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
    
    
    

    