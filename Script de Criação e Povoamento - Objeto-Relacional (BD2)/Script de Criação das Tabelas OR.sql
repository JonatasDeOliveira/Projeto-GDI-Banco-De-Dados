DROP TYPE tp_diagnostico FORCE;
DROP TYPE tp_trabalha FORCE;
DROP TYPE tp_reconhecedor FORCE;
DROP TYPE tp_corpo FORCE;
DROP TYPE tp_departamento FORCE;
DROP TYPE tp_nt_exames FORCE;
DROP TYPE tp_exame FORCE;
DROP TYPE tp_periciado FORCE;
DROP TYPE tp_admTerc FORCE;
DROP TYPE tp_medico FORCE;
DROP TYPE tp_funcionario FORCE;
DROP TYPE tp_fones FORCE;
DROP TYPE tp_fone FORCE;
DROP TYPE tp_endereco FORCE;
DROP TYPE tp_ser_examinado FORCE;
DROP TYPE tp_nt_diagnosticos FORCE;
DROP TYPE tp_resulta FORCE;

DROP TABLE tb_diagnostico CASCADE CONSTRAINT;
DROP TABLE tb_trabalha CASCADE CONSTRAINT;
DROP TABLE tb_departamento CASCADE CONSTRAINT;
DROP TABLE tb_reconhecedor CASCADE CONSTRAINT;
DROP TABLE tb_corpo CASCADE CONSTRAINT;
DROP TABLE tb_exame CASCADE CONSTRAINT;
DROP TABLE tb_periciado CASCADE CONSTRAINT;
DROP TABLE tb_medico CASCADE CONSTRAINT; 
DROP TABLE tb_admTerc CASCADE CONSTRAINT;
DROP TABLE tb_ser_examinado CASCADE CONSTRAINT;


CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	CEP varchar2(9), 
	Logradouro varchar2(255));
/

CREATE OR REPLACE TYPE tp_fone AS OBJECT (
	Cod varchar2(2), 
	Numero varchar2(9));
/

CREATE OR REPLACE TYPE tp_fones AS VARRAY(5) OF tp_fone;
/

CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
	CPF varchar2(14), 
	Nome varchar2(255), 
	Sexo char, 
	Endereco tp_endereco, 
	Salario Number(10,2), 
	Telefone tp_fones, 
	Data_Nasc date) NOT FINAL;
/

CREATE OR REPLACE TYPE tp_admTerc UNDER tp_funcionario(
	Tipo varchar2(255), 
	Nivel varchar2(40));
/

CREATE OR REPLACE TYPE tp_medico UNDER tp_funcionario(
	CRM varchar2(10), 
	Especializacao varchar2(40), 
	Supervisor REF tp_medico);
/

CREATE OR REPLACE TYPE tp_periciado AS OBJECT (
	Codigo varchar2(8), 
	Nome varchar2(255), 
	Nacionalidade varchar2(255), 
	Filiacao varchar2(255), 
	Data_Nasc date, 
	Sexo char, 
	Estado_Civil varchar2(255), 
	CPF varchar2(14), 
	Endereco tp_endereco);
/

CREATE OR REPLACE TYPE  tp_diagnostico AS OBJECT (
	Codigo varchar2(8), 
	Data_Diag date, 
	Descricao varchar2(255));
/


CREATE OR REPLACE TYPE tp_nt_diagnosticos AS TABLE OF REF tp_diagnostico;
/

CREATE OR REPLACE TYPE tp_exame AS OBJECT (
	Codigo varchar2(8), 
	Orgao_Solic varchar2(255), 
	Data_Req date, 
	Data_Ex date,   
	lista_diagnostico tp_nt_diagnosticos); 
/ 

CREATE OR REPLACE TYPE tp_nt_exames AS TABLE OF REF tp_exame;
/

CREATE OR REPLACE TYPE tp_reconhecedor AS OBJECT (
	Nome varchar2(252),
	CPF varchar2(252));
/

CREATE OR REPLACE TYPE tp_nt_reconhecedores AS TABLE OF REF tp_reconhecedor;
/

CREATE OR REPLACE TYPE tp_departamento AS OBJECT (
	Codigo varchar2(8), 
	Especializacao varchar2(40), 
	Descricao varchar2(255), 
	Cad_chef REF tp_medico, 
	lista_exames tp_nt_exames);
/

CREATE OR REPLACE TYPE tp_corpo AS OBJECT (
	Codigo varchar2(8), 
	Nome varchar2(40), 
	Nacionalidade varchar2(20), 
	Filiacao varchar2(252), 
	Data_Nasc date, Sexo char, 
	Estado_Civil varchar2(10), 
	CPF varchar2(14), 
	Cod_Dept REF tp_departamento,
	lista_reconhecedores tp_nt_reconhecedores);
/

CREATE OR REPLACE TYPE tp_trabalha AS OBJECT (
	Funcionario REF tp_funcionario, 
	Departamento REF tp_departamento, Data_inic date);
/

CREATE OR REPLACE TYPE tp_ser_examinado AS OBJECT (
	Cod_Med REF tp_medico,
    Cod_Ex REF tp_exame,
    Cod_Peri REF tp_periciado);
/

CREATE TABLE tb_admTerc OF tp_admTerc (
	CPF PRIMARY KEY);

CREATE TABLE tb_medico OF tp_medico (
	CPF PRIMARY KEY, CRM UNIQUE NOT NULL, 
	Supervisor WITH ROWID REFERENCES tb_medico);

CREATE TABLE tb_periciado OF tp_periciado (
	Codigo PRIMARY KEY, 
	CPF UNIQUE);

CREATE TABLE tb_diagnostico OF tp_diagnostico (
	Codigo PRIMARY KEY);
	
CREATE TABLE tb_exame OF tp_exame (
	Codigo PRIMARY KEY)
NESTED TABLE lista_diagnostico STORE AS tb_lista_diagnosticos; 

CREATE TABLE tb_reconhecedor OF tp_reconhecedor (
	CPF PRIMARY KEY);

CREATE TABLE tb_departamento OF tp_departamento (
	Codigo PRIMARY KEY, 
	Cad_chef WITH ROWID REFERENCES tb_medico) 
NESTED TABLE lista_exames STORE AS tb_exames_dept;
	
CREATE TABLE tb_corpo OF tp_corpo (
	Cod_Dept WITH ROWID REFERENCES tb_departamento,
	Codigo PRIMARY KEY, 
	CPF UNIQUE)
NESTED TABLE lista_reconhecedores STORE AS tb_lista_reconhecedores;
	
CREATE TABLE tb_trabalha OF tp_trabalha;

CREATE TABLE tb_ser_examinado OF tp_ser_examinado (
    Cod_Med WITH ROWID REFERENCES tb_medico, 
    Cod_Ex WITH ROWID REFERENCES tb_exame,
    Cod_Peri WITH ROWID REFERENCES tb_periciado); 
