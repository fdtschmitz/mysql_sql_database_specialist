-- explorando os comandos de DDL

select now() as Timestamp;
create database manipulation;

use manipulation;

CREATE TABLE bankAccounts (
	Id_account INT auto_increment PRIMARY KEY,
	Ag_num INT NOT NULL,
	Ac_num INT NOT NULL,
	Saldo FLOAT,
	CONSTRAINT identification_account_constraint UNIQUE (Ag_num, Ac_num)
);

alter table bankAccounts add LimiteCredito float
	not null default 500.00;

alter table bankAccounts add email varchar(60);
alter table bankAccounts drop email;
    
desc bankAccounts;

insert into bankAccounts (Ag_num, Ac_num, Saldo) values (156, 264358, 0);
select * from bankAccounts;

CREATE TABLE bankClient(
	Id_client INT auto_increment,
	ClientAccount INT,
	CPF VARCHAR(11) NOT NULL,
	RG VARCHAR(9) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Endereço VARCHAR(100) NOT NULL,
	Renda_mensal FLOAT,
    primary key (Id_client, ClientAccount),
	CONSTRAINT fk_acconut_client foreign key (ClientAccount) REFERENCES bankAccounts(Id_account) 
	ON UPDATE CASCADE
);
insert into bankClient (ClientAccount, CPF, RG, Nome, Endereço, Renda_mensal) values(1, 12345678913, 123456789, 'Fulano', 'rua de lá', 6500.6);
select * from bankClient;
alter table bankClient add UFF char(2) not null default 'RJ';
update bankClient set UFF='MG' where Id_client = 1;

CREATE TABLE bankTransactions(
	Id_transcation INT auto_increment PRIMARY KEY,
	Ocorrencia datetime,
	Status_transaction VARCHAR(20),
	Valor_transferido FLOAT,
	Source_account INT,
	Destination_account INT,
	CONSTRAINT fk_source_transaction foreign key (Source_account) REFERENCES
	bankAccounts(id_Account),
	CONSTRAINT fk_destionation_transaction foreign key (destination_account) REFERENCES
	bankAccounts(id_Account)
);

UPDATE Customers SET UF ='RJ' WHERE City='Rio de Janeiro';

-- drop versus delete statement

drop table bankTransactions;
drop database manipulation;

DELETE FROM bankClient WHERE name='Teste';

ALTER TABLE bankClient ADD Email varchar(255);
ALTER TABLE Customers DROP COLUMN Email;
-- ALTER TABLE table_name MODIFY COLUMN column_name datatype;
-- ALTER TABLE Custumers ADD CONSTRAINT;


SELECT account_id, product_cd, open_date, avail_balance
FROM account
ORDER BY avail_balance DESC;
