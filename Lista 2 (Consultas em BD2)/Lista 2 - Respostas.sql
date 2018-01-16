-- Questão 1 --
 
select m.nome, m.sexo from tb_medico m where supervisor = (select ref(n) from tb_medico n where n.crm = '16180');
 
-- Questão 2 --
 
select s.nome from tb_corpo s where s.cod_dept.codigo = 
(select c.cod_dept.codigo from tb_corpo c group by c.cod_dept.codigo having count(c.codigo) = 
(select max(count(d.codigo)) from tb_corpo d group by d.cod_dept.codigo));
 
-- Questão 3 --
 
select c.cad_chef.nome from tb_departamento c, 
table(select lista_exames from tb_departamento where codigo = c.codigo)T 
group by c.cad_chef.nome having count(T.column_value) = 
(select max(count(Y.column_value)) from tb_departamento d, 
Table(select lista_exames from tb_departamento where codigo = d.codigo)Y group by d.codigo);
 
SELECT d.Cad_chef.Nome FROM tb_departamento d, TABLE(d.lista_exames) e 
GROUP BY d.Cad_chef.Nome HAVING COUNT(e.COLUMN_VALUE) = 
(SELECT MAX(COUNT(y.COLUMN_VALUE)) FROM tb_departamento d, TABLE(d.lista_exames) y GROUP BY d.Codigo);
 
SELECT d.Cad_chef.Nome FROM tb_departamento d, TABLE(d.lista_exames) e 
GROUP BY d.Cad_chef.Nome HAVING COUNT(value(e)) = 
(SELECT MAX(COUNT(value(y))) FROM tb_departamento d, TABLE(d.lista_exames) y GROUP BY d.Codigo);
 
-- Questão 4 --
 
Select c.codigo from tb_corpo c, 
Table(select lista_reconhecedores from tb_corpo where codigo = c.codigo) r 
where r.column_value.nome = 'Bruna Souza';

Select c.codigo from tb_corpo c, 
Table(select lista_reconhecedores from tb_corpo where codigo = c.codigo) r 
where value(r).nome = 'Bruna Souza';
 
-- Questão 5 --
 
insert into tb_reconhecedor values(tp_reconhecedor('Valar Morghulis','371.639.758-05'));
select cpf from tb_reconhecedor;
insert into table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos') values ((select ref(t) from tb_reconhecedor t where t.cpf = '371.639.758-05'));
select t.column_value.nome from table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos')t;
delete from table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos')t where t.column_value.cpf = '371.639.758-05';
select t.column_value.nome from table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos')t;
delete from tb_reconhecedor where cpf = '371.639.758-05';
select cpf from tb_reconhecedor;

insert into tb_reconhecedor values(tp_reconhecedor('Valar Morghulis','371.639.758-05'));
select cpf from tb_reconhecedor;
insert into table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos') values ((select ref(t) from tb_reconhecedor t where t.cpf = '371.639.758-05'));
select value(t).nome from table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos')t;
delete from table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos')t where t.column_value.cpf = '371.639.758-05';
select value(t).nome from table(select lista_reconhecedores from tb_corpo where nome = 'Jonatan Matos')t;
delete from tb_reconhecedor where cpf = '371.639.758-05';
select cpf from tb_reconhecedor;

 
-- Questão 6 --
 
select min(p.codigo) from (select s.cod_med.crm as codigo from tb_ser_examinado s group by s.cod_med.crm having count(s.cod_ex.codigo) = 
(select max(count(r.cod_ex.codigo)) from tb_ser_examinado r group by r.cod_med.crm)) p;
 
-- Questão 7 --
 
set serveroutput on;
 
declare
 
cursor c_medico is
select crm, cpf from tb_medico;
cursor c_admterc is
select tipo, cpf from tb_admterc;
v_crm tb_medico.crm%type;
v_tipo tb_admterc.tipo%type;
v_cpf tb_medico.cpf%type;
 
begin
 
open c_medico;
loop 
	fetch c_medico into v_crm, v_cpf;
	exit when c_medico%notfound;
	dbms_output.put_line('CRM: '||v_crm||', CPF: '||v_cpf);
end loop;
close c_medico;
open c_admterc;
loop
	fetch c_admterc into v_tipo, v_cpf;
	exit when c_admterc%notfound;
	dbms_output.put_line('TIPO: '||v_tipo||', CPF: '||v_cpf);
end loop;
close c_admterc;
end;
/
 
-- Questão 8 --
 
set serveroutput on;
 
declare
 
cursor c_corpo_periciado is
select c.codigo, p.cpf from tb_corpo c, tb_periciado p
where c.nacionalidade = p.nacionalidade
order by c.codigo, p.cpf;
v_corpo_id tb_corpo.codigo%type;
v_cpf tb_periciado.cpf%type;
 
begin
 
open c_corpo_periciado;
loop
	fetch c_corpo_periciado into v_corpo_id, v_cpf;
	exit when c_corpo_periciado%notfound;
	dbms_output.put_line('ID_CORPO: '||v_corpo_id||', CPF_PERICIADO: '||v_cpf);
end loop;
close c_corpo_periciado;
end;
/
 
-- Questão 9 --
 
alter type tp_corpo add member function reconhece(nome varchar2) return varchar2 cascade;
   
create or replace type body tp_corpo is
	member function reconhece(nome varchar2) return varchar2 is
		v_corpo varchar2(8);
		retorno varchar2(10) := 'NÃO';
	begin
		select self.codigo into v_corpo from table(self.lista_reconhecedores) r where r.column_value.Nome =  nome;
		dbms_output.put_line(v_corpo);
		if v_corpo is not null then
			retorno := 'SIM';
		end if;
		return retorno;
	exception 
		when no_data_found then 
			return retorno;
	end;
end;
/
 
create or replace type body tp_corpo is
	member function reconhece(nome varchar2) return varchar2 is
		v_corpo number(2,0);
		retorno varchar2(10) := 'SIM';
	begin
		select count(self.codigo) into v_corpo from table(self.lista_reconhecedores) r where r.column_value.Nome =  nome;
		dbms_output.put_line(v_corpo);
		if v_corpo = 0 then
			retorno := 'NÃO';
		end if;
		return retorno;
	end;
end;
/

create or replace type body tp_corpo is
	member function reconhece(nome varchar2) return varchar2 is
		v_corpo number(2,0);
		retorno varchar2(10) := 'SIM';
	begin
		select count(self.codigo) into v_corpo from table(self.lista_reconhecedores) r where value(r).Nome =  nome;
		dbms_output.put_line(v_corpo);
		if v_corpo = 0 then
			retorno := 'NÃO';
		end if;
		return retorno;
	end;
end;
/
 
select a.reconhece('Bruna Souza') from tb_corpo a;
 
-- Questão 10 --
 
declare 
 
cursor c_exame is
select T.column_value.codigo from tb_departamento d, table(d.lista_exames) T where d.codigo = 
(select d.codigo from tb_departamento d, table(d.lista_exames) T where T.column_value.codigo = 'ex2');
v_codigo tb_exame.codigo%type;
 
begin
 
open c_exame;
loop
	fetch c_exame into v_codigo;
	exit when c_exame%notfound;
	if v_codigo <> 'ex2' then
		dbms_output.put_line('Codigo do exame: '||v_codigo);
	end if;
end loop;
close c_exame;
end;
/

declare  
cursor c_exame is
select value(T).codigo from tb_departamento d, table(d.lista_exames) T where d.codigo = 
(select d.codigo from tb_departamento d, table(d.lista_exames) T where value(T).codigo = 'ex2');
v_codigo tb_exame.codigo%type;
 
begin
 
open c_exame;
loop
	fetch c_exame into v_codigo;
	exit when c_exame%notfound;
	if v_codigo <> 'ex2' then
		dbms_output.put_line('Codigo do exame: '||v_codigo);
	end if;
end loop;
close c_exame;
end;
/

-- Questão 11 --

SET serveroutput ON;
DECLARE
	ctx dbms_xmlgen.ctxhandle;
	result clob;
BEGIN
	ctx := dbms_xmlgen.newContext('SELECT m.Nome FROM tb_medico m WHERE m.Data_Nasc < TO_DATE(''1990'', ''yyyy'')');
	dbms_xmlgen.setRowsetTag(ctx, 'IML');
	dbms_xmlgen.setRowTag(ctx, 'Medico');
	result := dbms_xmlgen.getXML(ctx);
	dbms_output.put_line(result);
	dbms_xmlgen.closeContext(ctx);
END;
/

-- Questão 12 --

SET serveroutput ON;
DECLARE
	ctx dbms_xmlgen.ctxhandle;
	result clob;
BEGIN
	ctx := dbms_xmlgen.newContext('SELECT m.Nome FROM tb_medico m WHERE m.CPF LIKE ''4%'' AND m.Data_Nasc < TO_DATE(''1990'', ''yyyy'') UNION SELECT a.Nome FROM tb_admTerc a WHERE a.CPF LIKE ''4%'' AND a.Data_Nasc < TO_DATE(''1990'', ''yyyy'')');
	dbms_xmlgen.setRowsetTag(ctx, 'IML');
	dbms_xmlgen.setRowTag(ctx, 'Funcionario');
	result := dbms_xmlgen.getXML(ctx);
	dbms_output.put_line(result);
	dbms_xmlgen.closeContext(ctx);
END;
/

-- Questão 13 --

DECLARE
    ctx DBMS_XMLGEN.CTXHANDLE;
    result CLOB;
BEGIN 
    ctx := DBMS_XMLGEN.NEWCONTEXT('SELECT c.nome FROM tb_corpo c WHERE c.nome BETWEEN ''A%'' AND ''K%'' ORDER BY c.nome');
    DBMS_XMLGEN.SETROWSETTAG(ctx, 'IML');
    DBMS_XMLGEN.SETROWTAG(ctx, 'CORPO');
    result := DBMS_XMLGEN.GETXML(ctx);
    DBMS_OUTPUT.PUT_LINE(result);
    DBMS_XMLGEN.CLOSECONTEXT(ctx);
END;
/


-- Questão 14 --
 
DECLARE
    ctx DBMS_XMLGEN.CTXHANDLE;
    rst CLOB;
BEGIN 
    ctx := DBMS_XMLGEN.NEWCONTEXT('SELECT c.nome FROM tb_corpo c WHERE c.nome BETWEEN ''A%'' AND ''K%'' ORDER BY c.nome');
    DBMS_XMLGEN.SETROWSETTAG(ctx, 'IML');
    DBMS_XMLGEN.SETROWTAG(ctx, 'CORPO');
    rst := DBMS_XMLGEN.GETXML(ctx);
    DBMS_OUTPUT.PUT_LINE(rst);
    DBMS_XMLGEN.CLOSECONTEXT(ctx);
END;
/
