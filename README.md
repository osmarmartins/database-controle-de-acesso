# CONTROLE DE ACESSO (Database) #
## Estrutura de tabelas para controle de acesso ##

Nesse script de banco de dados, são apresentadas tabelas e 
seus relacionamentos para serem utilizadas em um controle de acesso 
a funcionalidades de um sistema.


**Tabelas ** e suas finalidades:

| Tabela                | Finalidade                               |
|---------------------- | -----------------------------------------|
| login_usuario         | Relação de usuários                      |
| login_perfil          | Perfil de usuários (grupo de usuários)   |
| login_operacao        | Relação das funcionalidades              |
| login_usuario_perfil  | Usuários pertencentes a um perfil        |
| login_perfil_operacao | Operações permitidas por perfil          |


**DER** - Diagrama-Entidade-Relacionamento
![enter image description here](https://raw.githubusercontent.com/osmarmartins/database-controle-de-acesso/master/DER.JPG)

## Ferramentas ##
Banco de dados [MySQL Server Community.](https://dev.mysql.com/downloads/mysql/5.6.html)
Gerenciador de banco de dados [MySQL Workbench.](https://dev.mysql.com/downloads/workbench/)
 
## Documentação ##
[MySQL Server 5.6.](https://dev.mysql.com/doc/refman/5.6/en/)
[MySQL Workbench.](https://dev.mysql.com/doc/workbench/en/)

