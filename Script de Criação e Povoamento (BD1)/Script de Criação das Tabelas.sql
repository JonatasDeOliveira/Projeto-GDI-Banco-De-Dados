CREATE TABLE Especializacao_Dept
(Especializacao varchar2 (40),
Descricao varchar2 (252),
CONSTRAINT Especializacao_Dept_pkey PRIMARY KEY (Especializacao));

CREATE TABLE Funcionario
(CPF varchar2 (14),
Nome varchar2 (252),
Sexo char,
Salario number (10,2),
Data_Nasc date,
CEP varchar2 (9),
Logradouro varchar2 (252),
CONSTRAINT Funcionario_pkey PRIMARY KEY (CPF),
CONSTRAINT Funcionario_checkSex CHECK (Sexo = 'M' OR Sexo = 'F'),
CONSTRAINT Funcionario_checkSal CHECK (Salario >= 880.00));

CREATE TABLE Medico
(CPF varchar2 (14),
CRM varchar2 (10),
Especializacao varchar2 (20),
Cad_Supv varchar2 (14),
CONSTRAINT Medico_pkey PRIMARY KEY (CPF),
CONSTRAINT Medico_fkey FOREIGN KEY (Cad_Supv)
REFERENCES Medico (CPF),
CONSTRAINT Medico_fkey1 FOREIGN KEY (CPF)
REFERENCES Funcionario (CPF));

CREATE TABLE Departamento
(Codigo varchar2 (8),
Especializacao varchar2 (40),
Cad_Chef varchar2 (14),
CONSTRAINT Departamento_pkey PRIMARY KEY (Codigo),
CONSTRAINT Departamento_fkey1 FOREIGN KEY (Especializacao)
REFERENCES Especializacao_Dept(Especializacao),
CONSTRAINT Departamento_fkey2 FOREIGN KEY (Cad_Chef)
REFERENCES Medico (CPF));

CREATE TABLE Corpo
(Codigo varchar2 (8),
Nome varchar2 (252),
Nacionalidade varchar2 (20),
Filiacao varchar2 (252),
Data_Nasc date,
Sexo char,
Estado_Civil varchar2 (10),
Cod_Dept varchar2 (8),
CPF varchar2 (14),
CONSTRAINT Corpo_pkey PRIMARY KEY (Codigo),
CONSTRAINT Corpo_fkey FOREIGN KEY (Cod_Dept)
REFERENCES Departamento (Codigo),
CONSTRAINT Corpo_checkSex CHECK (Sexo = 'M' OR Sexo = 'F'));

CREATE TABLE Reconhecedor
(Nome varchar2 (252),
CPF varchar2 (14),
IDCorpo varchar2 (8),
CONSTRAINT Reconhecedor_pkey PRIMARY KEY (CPF),
CONSTRAINT Reconhecedor_fkey FOREIGN KEY (IDCorpo)
REFERENCES Corpo (Codigo));

CREATE TABLE Fone_Func
(CodFunc varchar2 (14),
Telefone varchar2 (11),
CONSTRAINT Fone_Func_fkey1 FOREIGN KEY (CodFunc)
REFERENCES Funcionario (CPF),
CONSTRAINT Fone_Func_pkey PRIMARY KEY (CodFunc, Telefone));

CREATE TABLE AdmTerc
(CPF varchar2 (14),
Tipo varchar2 (252),
Nivel varchar2 (40),
CONSTRAINT AdmTerc_fkey FOREIGN KEY (CPF)
REFERENCES Funcionario (CPF),
CONSTRAINT AdmTerc_pkey PRIMARY KEY (CPF));

CREATE TABLE Periciado
(Codigo varchar2 (8),
Nome varchar2 (252),
Nacionalidade varchar2 (20),
Filiacao varchar2 (252),
Data_Nasc date,
Sexo char,
Estado_Civil varchar2 (10),
CPF varchar2 (14),
CEP varchar2 (9),
Logradouro varchar2 (252),
CONSTRAINT Periciado_pkey PRIMARY KEY (Codigo));

CREATE TABLE Exame
(Codigo varchar2 (8),
Orgao_Solic varchar2 (15),
Data_Req date,
Data_Exame date,
Cod_Peri varchar2 (8),
Cod_Dept varchar2 (8),
CONSTRAINT Exame_pkey PRIMARY KEY (Codigo),
CONSTRAINT Exame_fkey1 FOREIGN KEY (Cod_Dept)
REFERENCES Departamento (Codigo),
CONSTRAINT Exame_fkey2 FOREIGN KEY (Cod_Peri)
REFERENCES Periciado (Codigo));

CREATE TABLE Trabalha
(CadEmp varchar2 (14),
CodDept varchar2 (8),
data date,
CONSTRAINT Trabalha_fkey1 FOREIGN KEY (CadEmp)
REFERENCES Funcionario (CPF),
CONSTRAINT Trabalha_fkey2 FOREIGN KEY (CodDept)
REFERENCES Departamento (Codigo),
CONSTRAINT Trabalha_pkey1 PRIMARY KEY (CadEmp, CodDept, data));

CREATE TABLE Ser_Examinado 
(Cod_Med varchar2(14), 
Cod_Ex varchar2(8), 
Cod_Peri varchar2(8),
CONSTRAINT Ser_Examinado_fkey1 FOREIGN KEY (Cod_Med)
REFERENCES Medico (Cpf),
CONSTRAINT Ser_Examinado_fkey2 FOREIGN KEY (Cod_Ex)
REFERENCES Exame (Codigo),
CONSTRAINT Ser_Examinado_fkey3 FOREIGN KEY (Cod_Peri)
REFERENCES Periciado (codigo),
CONSTRAINT Ser_Examinado_pkey1 PRIMARY KEY (Cod_Med, Cod_Ex));

CREATE TABLE Diagnostico
(Codigo varchar2 (8),
DataEnt date,
Descricao varchar2 (252),
Cod_Med varchar2(14),
Cod_Ex varchar2(8), 
CONSTRAINT Diagnostico_fkey FOREIGN KEY (Cod_Med, Cod_EX)
REFERENCES Ser_Examinado (Cod_Med, Cod_EX),
CONSTRAINT Diagnostico_pkey PRIMARY KEY (Codigo));