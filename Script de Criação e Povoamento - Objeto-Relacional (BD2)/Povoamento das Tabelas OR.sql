-- Funcionario Administrativo/Terceirizado --

INSERT INTO tb_admTerc VALUES (tp_admTerc('155.956.944-16', 'Rafaela Araujo Santos', 'F', tp_endereco('51320-460', 'Rua Domingos Antonio Jorge, 646, Recife-PE'), '2050.00', tp_fones(tp_fone('81', '998710203')), TO_DATE('07/12/1960', 'dd/mm/yyyy'), 'Recepcionista', 'Medio'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('468.191.198-44', 'Gabrielly Azevedo Pinto','F', tp_endereco('50070-090', 'Rua Carlos Porto Carreiro, 79, Recife-PE'), '2650.00', tp_fones(tp_fone('81', '998765900')), TO_DATE('28/05/1988', 'dd/mm/yyyy'), 'Auxiliar de legista','Tecnico'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('522.798.868-47', 'Egdar Vitor Albuquerque','M', tp_endereco('50875-090', 'Rua Anita Ferreira da Silva, 199, Recife-PE'), '2000.00', tp_fones(tp_fone('81', '987231260')), TO_DATE('29/03/1990', 'dd/mm/yyyy'), 'Auxiliar de legista','Tecnico'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('913.560.667-39', 'Daniel Souza Oliveira','M', tp_endereco('51190-330', 'Rua Anita Garibaldi, 1795, Recife-PE'), '1500.00', tp_fones(tp_fone('81', '985132276')), TO_DATE('08/07/1991', 'dd/mm/yyyy'), 'Auxiliar de laboratorio','Tecnico'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('592.304.141-31', 'Isabelle Souza Cardoso','F', tp_endereco('52211-480', 'Rua Anitopolis, 124, Recife-PE'), '1720.00', tp_fones(tp_fone('81', '987225260')), TO_DATE('21/01/1991', 'dd/mm/yyyy'), 'Faxineiro','Medio'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('325.533.181-11', 'Julia Asfora','F', tp_endereco('51350-260', 'Rua Anizio Galvao, 1290, Recife-PE'),'2000.00', tp_fones(tp_fone('81', '995136028')), TO_DATE('30/09/1989', 'dd/mm/yyyy'), 'Recepcionista','Medio'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('211.528.928-51', 'Tiago Souza Melo', 'M', tp_endereco('50630-320', 'Rua Carmem de Souza Leao, 1340, Recife-PE'), '1550.00', tp_fones(tp_fone('81', '987659878')), TO_DATE('09/04/1995', 'dd/mm/yyyy'), 'Faxineiro','Medio'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('249.348.216-60', 'Diego Dias Almeida', 'M', tp_endereco('50820-470', 'Rua Manoel Azevedo, 1737, Recife-PE'), '3200.00', tp_fones(tp_fone('81', '984567122')), TO_DATE('15/10/1966', 'dd/mm/yyyy'), 'Auxiliar de laboratorio','Tecnico'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('723.499.276-60', 'Rafaela Barbosa Dias', 'F', tp_endereco('52110-550', 'Rua Irapiranga, 585, Recife-PE'), '2300.00', tp_fones(tp_fone('81', '984018817')), TO_DATE('30/11/1970', 'dd/mm/yyyy'), 'Auxiliar de legista', 'Medio'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('419.117.609-98', 'Douglas Fernandes Pinto', 'M', tp_endereco('50640-720', 'Rua Itacuruba, 1737, Recife-PE'), '3250.00', tp_fones(tp_fone('81', '994237266')), TO_DATE('22/05/1973', 'dd/mm/yyyy'), 'Auxiliar de laboratorio','Tecnico'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('540.393.729-30', 'Antonio Rodrigues Cardoso', 'M', tp_endereco('51320-560', 'Rua Gonçalves Ledo, 1681, Recife-PE'), '2950.00', tp_fones(tp_fone('81', '998237288')), TO_DATE('23/04/1991', 'dd/mm/yyyy'), 'Faxineiro', 'Medio'));
INSERT INTO tb_admTerc VALUES (tp_admTerc('646.440.783-01', 'Evelyn Carvalho Costa', 'F', tp_endereco('52041-140', 'Rua Fortaleza, 585, Recife-PE'), '3300.00', tp_fones(tp_fone('81', '992475816')), TO_DATE('15/01/1964', 'dd/mm/yyyy'), 'Auxiliar de laboratorio','Tecnico'));

-- Funcionario Medico --

INSERT INTO tb_medico VALUES (tp_medico('629.546.185-90', 'Marisa Gomes Cunha','F', tp_endereco('50751-390', 'Rua Anne Frank, 667, Recife-PE'), '7500.00', tp_fones(tp_fone('81', '985326019')), TO_DATE('10/12/1988', 'dd/mm/yyyy'), '16180', 'Odontolegista', null));
INSERT INTO tb_medico VALUES (tp_medico('129.201.107-64', 'Gustavo Dimmas Iwand','M', tp_endereco('50090-240', 'Rua Anna Bezerra, 616, Recife-PE'), '3000.00', tp_fones(tp_fone('81', '981176240')), TO_DATE('16/08/1987', 'dd/mm/yyyy'), '06899', 'Radiologista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '629.546.185-90')));
INSERT INTO tb_medico VALUES (tp_medico('683.132.239-52', 'Maria Elena Dantas','F', tp_endereco('50690-705', 'Rua Centenario, 1916, Recife-PE'),'7200.00', tp_fones(tp_fone('81', '988705577'), tp_fone('81', '997685517'), tp_fone('81', '998251703')), TO_DATE('12/01/1970', 'dd/mm/yyyy'), '04022', 'Medico Legista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '629.546.185-90')));
INSERT INTO tb_medico VALUES (tp_medico('834.246.567-55', 'Flavio Soares','M', tp_endereco('52140-320', 'Rua Anori, 878, Recife-PE'),'4000.00',tp_fones(tp_fone('81', '981251342')), TO_DATE('09/05/1984', 'dd/mm/yyyy'), '11101', 'Medico Laboral', (SELECT REF(M) FROM tb_medico M WHERE CPF = '683.132.239-52')));
INSERT INTO tb_medico VALUES (tp_medico('723.842.503-37', 'Laura Cohim','F',tp_endereco('50760-825', 'Rua Celio Pinheiro de Albuquerque, 1921, Recife-PE'),'4850.00', tp_fones(tp_fone('81', '997162533'), tp_fone('81', '981274357')), TO_DATE('18/11/1972', 'dd/mm/yyyy'), '03021', 'Medico Legista', null));
INSERT INTO tb_medico VALUES (tp_medico('444.788.547-69', 'Joyce Ferreira','F', tp_endereco('51350-200', 'Rua Carire, 610, Recife-PE'),'8050.00', tp_fones(tp_fone('81', '987707097'), tp_fone('81', '984632716'), tp_fone('81', '987095567')), TO_DATE('01/08/1967', 'dd/mm/yyyy'), '03065', 'Medico Legista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '723.842.503-37')));
INSERT INTO tb_medico VALUES (tp_medico('718.263.835-57', 'Victor Sales','M', tp_endereco('51240-630', 'Rua Celio Lopes, 1385, Recife-PE'),'3100.00', tp_fones(tp_fone('81', '985646423')), TO_DATE('11/06/1982', 'dd/mm/yyyy'), '12249', 'Radiologista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '444.788.547-69')));
INSERT INTO tb_medico VALUES (tp_medico('297.907.250-86', 'Victor Martins Pinto', 'M', tp_endereco('50620-310', 'Rua Carnaubal, 1387, Recife-PE'), '7720.00 ', tp_fones(tp_fone('81', '992453726'), tp_fone('81', '997165543')), TO_DATE('28/06/1989', 'dd/mm/yyyy'), '02255', 'Medico Legista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '683.132.239-52')));
INSERT INTO tb_medico VALUES (tp_medico('468.243.001-79', 'Beatrice Araujo Rodrigues', 'F', tp_endereco('53422-290', 'Rua Manuel Padilha, 609, Recife-PE'), '4500.00', tp_fones(tp_fone('81', '981271644')), TO_DATE('27/03/1980', 'dd/mm/yyyy'), '16949', 'Radiologista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '444.788.547-69')));
INSERT INTO tb_medico VALUES (tp_medico('458.370.681-20', 'Gustavo Castro Rodrigues', 'M', tp_endereco('50771-240', 'Rua Mabel, 1681, Recife-PE'), '4950.00', tp_fones(tp_fone('81', '997650998')), TO_DATE('23/12/1986', 'dd/mm/yyyy'), '05127', 'Odontolegista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '444.788.547-69')));
INSERT INTO tb_medico VALUES (tp_medico('655.012.586-33', 'Giovanna Santos Ribeiro', 'F', tp_endereco('51230-470', 'Rua Ivonete Ferreira da Silva, 1921, Recife-PE'), '5850.00', tp_fones(tp_fone('81', '998261502')), TO_DATE('25/11/1984', 'dd/mm/yyyy'), '07835', 'Radiologista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '444.788.547-69')));
INSERT INTO tb_medico VALUES (tp_medico('885.391.980-96', 'Enzo Dias Barbosa', 'M', tp_endereco('50910-360', 'Rua Gomes Bezerra Cavalcanti, 609, Recife-PE'), '2600.00', tp_fones(tp_fone('81', '984532267')), TO_DATE('14/01/1977', 'dd/mm/yyyy'), '13301', 'Medico Laboral', (SELECT REF(M) FROM tb_medico M WHERE CPF = '297.907.250-86')));
INSERT INTO tb_medico VALUES (tp_medico('472.287.144-23', 'Otavio Barros Ribeiro', 'M', tp_endereco('51110-330', 'Rua Freire de Andrade, 1921, Recife-PE'), '2500.00', tp_fones(tp_fone('81', '988645327')), TO_DATE('15/02/1965', 'dd/mm/yyyy'), '16010', 'Odontolegista', (SELECT REF(M) FROM tb_medico M WHERE CPF = '468.243.001-79')));

-- Periciado -- 

INSERT INTO tb_periciado VALUES (tp_periciado('perix1', 'Alef Henrique Barbosa', 'Brasileira', 'Isabela Gonçalves Santos',TO_DATE('12/08/1986', 'dd/mm/yyyy'), 'M', 'Casado', '610.933.033-79', tp_endereco ('83708-380', 'Rua Jose Basso, 720, Araucaria-PR'))); 
INSERT INTO tb_periciado VALUES (tp_periciado('perix2', 'Larissa Rodrigues Lopes', 'Americana', 'Lavinia Alves costa',TO_DATE('25/02/1994', 'dd/mm/yyyy'), 'F', 'Solteira', '177.441.171-74',tp_endereco ('55034-195', 'Rua da Inconfidencia, 803, Caruaru-PE ')));
INSERT INTO tb_periciado VALUES (tp_periciado('perix3', 'Emilly Lima Cunha', 'Brasileira', 'Gabriele Cavalcanti Pinto ',TO_DATE('01/01/1951', 'dd/mm/yyyy'), 'F', 'Casada', '156.389.303-70', tp_endereco ('21675-410', 'Rua Professor Rodrigues Vale, 87, Rio de Janeiro-RJ'))); 
INSERT INTO tb_periciado VALUES (tp_periciado('perix4', 'Diego Correia Souza', 'Brasileira', 'Yasmim Correia Carvalho ',TO_DATE('11/07/1980', 'dd/mm/yyyy'), 'M', 'Solteiro', '835.387.465-24', tp_endereco('74969-422', ' Rua Maroco, 31, Aparecida de Goiania-GO')));
INSERT INTO tb_periciado VALUES (tp_periciado('perix5', 'Anna Castro Silva', 'Brasileira', 'Manuela Cunha Castro ', TO_DATE('28/08/1987', 'dd/mm/yyyy'), 'F', 'Solteira', '726.898.817-64', tp_endereco('30575-390', 'Rua Doutor Geraldo Cardoso, 342, Belo Horizonte-MG ')));
INSERT INTO tb_periciado VALUES (tp_periciado('perix6', 'Victor Costa Alves', 'Americana', 'Bruno Gomes', TO_DATE('08/07/1973', 'dd/mm/yyyy'), 'M', 'Solteiro', '888.166.966-80',tp_endereco ( '30575-390', 'Rua Doutor Geraldo Cardoso, 342, Belo Horizonte-MG '))); 
INSERT INTO tb_periciado VALUES (tp_periciado('perix7', 'Bruno Azevedo Carvalho', 'Brasileira', 'Arnaldo Gomes', TO_DATE('23/07/1965', 'dd/mm/yyyy'), 'M', 'Solteiro', '102.635.391-21', tp_endereco('40391-150', 'ua Ana Guerra,1817, Carpina-PE ')));
INSERT INTO tb_periciado VALUES (tp_periciado('perix8', 'Melissa Fernandes Rodrigues', 'Brasileira', 'Amando Gomes', TO_DATE('30/03/1976', 'dd/mm/yyyy'), 'F', 'Solteira', '268.837.906-24',tp_endereco ('88138-145', 'Rua Duque de Caixias, 545, Palhoça-SC')));
INSERT INTO tb_periciado VALUES (tp_periciado('perix9', 'Estevan Melo Rocha', 'Brasileira', 'Bruno Rocha', TO_DATE('14/03/1937', 'dd/mm/yyyy'), 'M', 'Solteiro', '502.230.663-89', tp_endereco('56312-271', 'Rua Vinte e Sete, 1652, Petrolina-PE')));
INSERT INTO tb_periciado VALUES (tp_periciado('perix10', 'Joao Castro Araujo', 'Brasileira', 'Tamires Goncalves', TO_DATE('19/01/1976', 'dd/mm/yyyy'), 'M', 'Solteiro', '167.310.168-29', tp_endereco ('54370-103', 'Rua Itacarambi. 747, Jaboatao dos Guararapes-PE')));

-- Diagnostico --

INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx1', TO_DATE('24/12/2016', 'dd/mm/yyyy') , 'Diagnostico final inconclusivo sobre agressao com martelo'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx2', TO_DATE('15/06/2015' , 'dd/mm/yyyy') , 'Diagnostico final inconclusivo sobre agressao com objetos cortantes'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx3', TO_DATE('05/01/2017' , 'dd/mm/yyyy') , 'Confirmado caso de estupro'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx4', TO_DATE('21/03/2017' , 'dd/mm/yyyy') , 'Confirmada agressao por chutes na regiao toraxica'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx5', TO_DATE('27/03/2016' , 'dd/mm/yyyy') , 'Confirmada agressao por metodo de tortura'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx6', TO_DATE('20/01/2016' , 'dd/mm/yyyy') , 'Diagnostico final inconclusivo sobre agressao com objeto'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx7', TO_DATE('15/01/2017' , 'dd/mm/yyyy') , 'Confirmada agressao por espancamento'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx8', TO_DATE('02/04/2016' , 'dd/mm/yyyy') , 'Confirmado caso de estupro'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx9', TO_DATE('03/02/2017' , 'dd/mm/yyyy') , 'Confirmado caso de estupro'));
INSERT INTO tb_diagnostico VALUES (tp_diagnostico('diagx10', TO_DATE('05/03/2005' , 'dd/mm/yyyy') , 'Diagnostico final inconclusivo por metodo de tortura'));

-- Exame --

INSERT INTO tb_exame VALUES (tp_exame('ex1', 'DM', TO_DATE('31/12/2016', 'dd/mm/yyyy'), TO_DATE('02/01/2017', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex1') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx1'));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex1') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx3'));

INSERT INTO tb_exame VALUES (tp_exame('ex2', 'DHCP', TO_DATE('21/12/2016', 'dd/mm/yyyy'), TO_DATE('21/12/2016', 'dd/mm/yyyy'), tp_nt_diagnosticos()));

INSERT INTO tb_exame VALUES (tp_exame('ex3', 'DATI', TO_DATE('01/01/2017', 'dd/mm/yyyy'), TO_DATE('26/02/2017', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex3') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx4')); 

INSERT INTO tb_exame VALUES (tp_exame('ex4', 'DPIA', TO_DATE('22/03/2016', 'dd/mm/yyyy'), TO_DATE('30/03/2016', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex4') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx5')); 

INSERT INTO tb_exame VALUES (tp_exame('ex5', 'DHCP', TO_DATE('02/06/2015', 'dd/mm/yyyy'), TO_DATE('13/06/2015', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex5') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx2')); 

INSERT INTO tb_exame VALUES (tp_exame('ex6', 'DHCP', TO_DATE('02/06/2016', 'dd/mm/yyyy'), TO_DATE('13/06/2015', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex6') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx7')); 

INSERT INTO tb_exame VALUES (tp_exame('ex7', 'DM', TO_DATE('31/12/2016', 'dd/mm/yyyy'), TO_DATE('02/02/2017', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex7') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx9')); 

INSERT INTO tb_exame VALUES (tp_exame('ex8', 'DM', TO_DATE('05/12/2015', 'dd/mm/yyyy'), TO_DATE('21/12/2016', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex8') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx6')); 

INSERT INTO tb_exame VALUES (tp_exame('ex9', 'DHCP', TO_DATE('07/02/2005', 'dd/mm/yyyy'), TO_DATE('26/02/2017', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex9') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx10')); 

INSERT INTO tb_exame VALUES (tp_exame('ex10', 'DATI', TO_DATE('02/03/2016', 'dd/mm/yyyy'), TO_DATE('30/03/2016', 'dd/mm/yyyy'), tp_nt_diagnosticos()));
	INSERT INTO TABLE (SELECT lista_diagnostico FROM  tb_exame WHERE codigo = 'ex10') VALUES ((SELECT REF(D) FROM tb_diagnostico D WHERE Codigo = 'diagx8')); 

-- Reconhecedor --

INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Pedro Henrique Silva', '096.005.441-31'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Junior Leifert', '403.844.318-36'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Bruna Souza', '372.545.411-66'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Marcus Kent', '593.286.833-35'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Jenyce Genro', '785.348.472-07'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Fernanda Rufino', '827.414.451-17'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Vivian Oliveira', '673.239.176-38'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Thais Barros Silva', '490.969.843-40'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Mariana Barros Lima', '885.542.885-30'));
INSERT INTO tb_reconhecedor VALUES (tp_reconhecedor('Murilo Goncalves Pinto', '298.089.007-39'));

-- Departamento --

INSERT INTO tb_departamento VALUES (tp_departamento('dx1', 'CML1', 'Clinica Medico-legal e um local da medicina legal dirigida à pessoa presente, analisando essencialmente vitimas de crimes contra a integridade fisica, crimes sexuais e de maus-tratos.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '723.842.503-37'), tp_nt_exames()));
	INSERT INTO TABLE(SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx1') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex1'));
	INSERT INTO TABLE(SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx1') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex4'));

INSERT INTO tb_departamento VALUES (tp_departamento('dx2', 'Necroterio2', 'Lugar onde sao colocados cadaveres que vao ser sujeitos a autopsia ou cuja identidade se pretende averiguar.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '444.788.547-69'), tp_nt_exames()));
	INSERT INTO TABLE (SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx2') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex5'));

INSERT INTO tb_departamento VALUES (tp_departamento('dx3', 'Necroterio3', 'Lugar onde sao colocados cadaveres que vao ser sujeitos a autopsia ou cuja identidade se pretende averiguar.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '718.263.835-57'), tp_nt_exames()));

INSERT INTO tb_departamento VALUES (tp_departamento('dx4', 'CML4', 'Clinica Medico-legal e um local da medicina legal dirigida à pessoa presente, analisando essencialmente vitimas de crimes contra a integridade fisica, crimes sexuais e de maus-tratos.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '834.246.567-55'), tp_nt_exames()));
	INSERT INTO TABLE (SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx4') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex2'));
	INSERT INTO TABLE(SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx1') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex8'));
	INSERT INTO TABLE(SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx1') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex9'));
	
INSERT INTO tb_departamento VALUES (tp_departamento('dx5', 'CML3', 'Clinica Medico-legal e um local da medicina legal dirigida à pessoa presente, analisando essencialmente vitimas de crimes contra a integridade fisica, crimes sexuais e de maus-tratos.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '629.546.185-90'), tp_nt_exames()));

INSERT INTO tb_departamento VALUES (tp_departamento('dx6', 'Necroterio1', 'Lugar onde sao colocados cadaveres que vao ser sujeitos a autopsia ou cuja identidade se pretende averiguar.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '683.132.239-52'), tp_nt_exames()));
	INSERT INTO TABLE (SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx6') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex7'));
		
INSERT INTO tb_departamento VALUES (tp_departamento('dx7', 'Necroterio5', 'Lugar onde sao colocados cadaveres que vao ser sujeitos a autopsia ou cuja identidade se pretende averiguar.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '129.201.107-64'), tp_nt_exames()));
	INSERT INTO TABLE (SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx7') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex6'));
	
INSERT INTO tb_departamento VALUES (tp_departamento('dx8', 'CML5', 'Clinica Medico-legal e um local da medicina legal dirigida à pessoa presente, analisando essencialmente vitimas de crimes contra a integridade fisica, crimes sexuais e de maus-tratos.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '468.243.001-79'), tp_nt_exames()));
	INSERT INTO TABLE (SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx8') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex3'));

INSERT INTO tb_departamento VALUES (tp_departamento('dx9', 'Necroterio4', 'Lugar onde sao colocados cadaveres que vao ser sujeitos a autopsia ou cuja identidade se pretende averiguar.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '655.012.586-33'), tp_nt_exames()));
	INSERT INTO TABLE (SELECT lista_exames FROM tb_departamento WHERE Codigo = 'dx9') VALUES ((SELECT REF(E) FROM tb_exame E WHERE Codigo = 'ex10'));

INSERT INTO tb_departamento VALUES (tp_departamento('dx10', 'CML2', 'Clinica Medico-legal e um local da medicina legal dirigida à pessoa presente, analisando essencialmente vitimas de crimes contra a integridade fisica, crimes sexuais e de maus-tratos.', (SELECT REF(M) FROM tb_medico M WHERE CPF = '297.907.250-86'), tp_nt_exames()));


-- Corpo --

INSERT INTO tb_corpo VALUES (tp_corpo('cx1', 'Jonatan Matos', 'Brasileira', null, TO_DATE('29/02/1988', 'dd/mm/yyyy'), 'M', 'Casado', null, (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), tp_nt_reconhecedores())); 
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx1') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '096.005.441-31'));

INSERT INTO tb_corpo VALUES (tp_corpo('cx2', 'Luciano Harper', 'Britanica', 'Andreia Harper', TO_DATE('03/03/1992', 'dd/mm/yyyy'),'M', 'Solteiro', null, (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx7'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx2') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '403.844.318-36'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx3', 'Adelia Silva', 'Brasileira','Mariane Silva', TO_DATE('24/10/1984', 'dd/mm/yyyy'),'F', 'Casada', null, (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), tp_nt_reconhecedores())); 
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx3') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '372.545.411-66'));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx3') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '827.414.451-17'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx4', 'Clark Kent', 'Americana','Martha Kent', TO_DATE('11/11/1980', 'dd/mm/yyyy'),'M', 'Casado',  null, (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx6'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx4') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '593.286.833-35'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx5', 'Lucia Genro', 'Brasileira', null, TO_DATE('02/04/1981', 'dd/mm/yyyy'),'F', 'Solteira', '454-965-425.36', (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx5') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '785.348.472-07'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx6', 'Alberto Pedrosa', 'Brasileira','Joao Pedrosa', TO_DATE('09/05/1998', 'dd/mm/yyyy'),'F', 'Solteira', '454-975-425.55', (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), tp_nt_reconhecedores()));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx7', 'Juliana Oliveira', 'Brasileira','Andreia Oliveira', TO_DATE('30/04/2001', 'dd/mm/yyyy'),'F', 'Divorciada', '324-972-425.36', (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx7'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx7') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '673.239.176-38'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx8', 'Douglas Cardoso Goncalves', 'Brasileira','Bruna Barros', TO_DATE('07/12/1968', 'dd/mm/yyyy'),'M', 'Casado', '218.899.096-02', (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx9'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx8') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '490.969.843-40'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx9', 'Erick Santos Oliveira', 'Brasileira','Ana Santos', TO_DATE('03/09/1987', 'dd/mm/yyyy'),'M', 'Casado', '323.950.429-43', (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx9'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx9') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '885.542.885-30'));
	
INSERT INTO tb_corpo VALUES (tp_corpo('cx10', 'Giovana Souza Cardoso', 'Brasileira','Alesson Ribeiro', TO_DATE('01/09/1963', 'dd/mm/yyyy'),'M', 'Casada', '696.611.784-61', (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx6'), tp_nt_reconhecedores()));
	INSERT INTO TABLE(SELECT lista_reconhecedores FROM tb_corpo WHERE Codigo = 'cx10') VALUES ((SELECT REF(R) FROM tb_reconhecedor R WHERE CPF = '298.089.007-39'));

-- Trabalha

INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '522.798.868-47'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx1'), TO_DATE('01/06/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '913.560.667-39'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx5'), TO_DATE('12/08/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '592.304.141-31'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx8'), TO_DATE('28/03/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '325.533.181-11'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), TO_DATE('06/07/2014', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '129.201.107-64'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx9'), TO_DATE('07/02/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '629.546.185-90'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx6'), TO_DATE('09/12/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '834.246.567-55'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx7'), TO_DATE('05/01/2017', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '718.263.835-57'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx3'), TO_DATE('12/03/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '723.842.503-37'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx1'), TO_DATE('19/04/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '683.132.239-52'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx4'), TO_DATE('25/05/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '444.788.547-69'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx5'), TO_DATE('28/08/2014', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '468.191.198-44'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx8'), TO_DATE('27/01/2014', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '211.528.928-51'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx9'), TO_DATE('12/11/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '297.907.250-86'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx1'), TO_DATE('20/09/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '155.956.944-16'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), TO_DATE('09/02/2014', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '249.348.216-60'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx5'), TO_DATE('18/07/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '468.243.001-79'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx4'), TO_DATE('20/09/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '458.370.681-20'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx9'), TO_DATE('18/04/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '723.499.276-60'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx8'), TO_DATE('20/10/2014', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '655.012.586-33'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx3'), TO_DATE('19/09/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '419.117.609-98'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx6'), TO_DATE('21/10/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '885.391.980-96'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx7'), TO_DATE('12/08/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '540.393.729-30'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx5'), TO_DATE('10/04/2017', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '646.440.783-01'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx6'), TO_DATE('18/02/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '472.287.144-23'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx10'), TO_DATE('15/11/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '297.907.250-86'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx10'), TO_DATE('09/10/2014', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '444.788.547-69'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx2'), TO_DATE('12/12/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '683.132.239-52'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx7'), TO_DATE('07/10/2015', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_medico F WHERE CPF = '683.132.239-52'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx6'), TO_DATE('20/08/2016', 'dd/mm/yyyy')));
INSERT INTO tb_trabalha VALUES (tp_trabalha((SELECT REF(F) FROM tb_admTerc F WHERE CPF = '646.440.783-01'), (SELECT REF(D) FROM tb_departamento D WHERE Codigo = 'dx4'), TO_DATE('08/08/2014', 'dd/mm/yyyy')));

INSERT INTO tb_ser_examinado VALUES (tp_ser_examinado((SELECT REF(M) FROM tb_medico M WHERE m.cpf = '683.132.239-52'), (SELECT REF(E) FROM tb_exame E WHERE e.codigo ='ex1'), (SELECT REF(P) FROM tb_periciado P WHERE p.codigo = 'perix2')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '683.132.239-52'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex2'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix5')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '683.132.239-52'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex3'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix3')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '444.788.547-69'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex4'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix1')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '444.788.547-69'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex5'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix4')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '444.788.547-69'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex6'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix9')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '723.842.503-37'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex7'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix6')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '885.391.980-96'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex8'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix8')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '472.287.144-23'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex9'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix10')));
INSERT INTO tb_ser_Examinado VALUES (tp_ser_Examinado((SELECT REF(M) FROM tb_medico M WHERE cpf = '723.842.503-37'), (SELECT REF(E) FROM tb_exame E WHERE codigo ='ex10'), (SELECT REF(P) FROM tb_periciado P WHERE codigo = 'perix7')));
