Q1
select c.codigo, m.crm from Corpo c, Departamento d, Medico m
where d.codigo = c.cod_dept And d.cad_chef = m.cpf;

Q2 - com view
create or replace view q1 as
select d.codigo, count(*) as t_o from Departamento d
Inner Join Exame e
ON d.codigo = e.cod_dept
group by d.codigo
order by t_o Desc, codigo Asc;

select min(g.codigo) from q1 g
where g.t_o = (select max(t_o) from q1);

Q2 - sem view

select min(g.codigo) from (select d.codigo, count(*) as t_o from Departamento d
Inner Join Exame e
ON d.codigo = e.cod_dept
group by d.codigo
order by t_o Desc, codigo Asc) g
where g.t_o = (select max(t_o) from (select d.codigo, count(*) as t_o from Departamento d
Inner Join Exame e
ON d.codigo = e.cod_dept
group by d.codigo
order by t_o Desc, codigo Asc));



select min(cod_dept) from (
select cod_dept from Exame
group by cod_dept
having count(codigo) = (select max(count(codigo)) from exame group by cod_dept));

Q3 - com view
create or replace view q3 as
select f.sexo, count(*) as co from funcionario f
where f.cpf = some (select cpf from admterc
where nivel like 'Tecnico')
group by sexo;

select g.sexo from q3 g
where g.co = (select max(co) from q3);

Q3 - sem view

select f.sexo from funcionario f 
where f.cpf = some (select cpf from admterc
where nivel like 'Tecnico') 
group by f.sexo
having count(cpf) = (select max(count(t.cpf)) from funcionario t where t.cpf = some (select cpf from admterc
where nivel like 'Tecnico')  group by sexo);


Q4 - com view
create or replace view q4 as
select m.cad_supv, count(*) as co from  medico m
where m.cad_supv is not null
group by m.cad_supv;

select c.codigo from corpo c
where c.cod_dept = (select d.codigo from departamento d
where d.cad_chef = (select cad_supv from q4
where co = (select max(co) from q4)));

Q4 - sem view

select c.codigo from corpo c 
where c.cod_dept = (select d.codigo from departamento d
where d.cad_chef = (select cad_supv from (select m.cad_supv, count(*) as co from  medico m
where m.cad_supv is not null
group by m.cad_supv)
where co = (select max(co) from (select m.cad_supv, count(*) as co from  medico m
where m.cad_supv is not null
group by m.cad_supv))));

Q5 - com view
create or replace view v_count as
select r.idcorpo, count(r.cpf) as co from reconhecedor r
group by r.idcorpo;

create or replace view view_q5 as
select c.cod_dept, d.especializacao, sum(q.co) as co from corpo c, v_count q, departamento d
where q.idcorpo = c.codigo and d.codigo = c.cod_dept
group by c.cod_dept, d.especializacao;

select d.codigo, d.especializacao, q.co from view_q5 q
full outer join departamento d
on d.codigo = q.cod_dept;

Q5 - sem view

select de.especializacao, q1.co as quantidade from (select c.cod_dept, d.especializacao, sum(q.co) 
as co from corpo c, (select r.idcorpo, count(r.cpf) as co from reconhecedor r
group by r.idcorpo) q, departamento d
where q.idcorpo = c.codigo and d.codigo = c.cod_dept
group by c.cod_dept, d.especializacao) q1
full outer join departamento de
on de.codigo = q1.cod_dept;


Q6 - com view 

select a.nome from (select f.nome, f.cpf, t.data, f.data_nasc from funcionario f, 
medico m, trabalha t where f.cpf = m.cpf and t.cademp = f.cpf and t.data > 
to_date('31/12/2014','dd/mm/yyyy')) a where a.data_nasc = (select min(data_nasc) from(select f.data_nasc from funcionario f, 
medico m, trabalha t where f.cpf = m.cpf and t.cademp = f.cpf and t.data > 
to_date('31/12/2014','dd/mm/yyyy')));

select a.nome from funcionario a where a.data_nasc = (select min(data_nasc) from(select f.data_nasc from funcionario f, 
medico m, trabalha t where f.cpf = m.cpf and t.cademp = f.cpf and t.data > 
to_date('31/12/2014','dd/mm/yyyy')));

Q7 - sem view

select cod_peri, cod_ex, count(cod_med) from ser_examinado
group by cod_peri, cod_ex;

Q8 - sem view 

select cod_med from periciado
where nacionalidade = 'Americana';

Q9 - sem view

select count(codigo) from exame;

Q10 - sem view

select p.nome from ser_examinado s, diagnostico d, periciado p
where s.cod_ex = d.cod_ex and p.codigo = s.cod_peri
group by s.cod_peri, p.nome
having count(d.codigo) = (select max(count(d.codigo)) from ser_examinado s, diagnostico d 
where s.cod_ex = d.cod_ex group by s.cod_peri);

Q11 

set serveroutput on;

declare

v_cpf periciado.cpf%type;

cursor c_cpf is
select cpf from periciado
where data_nasc >= to_date('1980','yyyy');

begin

open c_cpf;

loop
fetch c_cpf into v_cpf;
exit when c_cpf%NOTFOUND;
dbms_output.put_line('CPF: '||''||to_char(v_cpf));
end loop;
close c_cpf;

end;

Q12

set serveroutput on;

declare

v_nome funcionario.nome%type;
v_sexo funcionario.sexo%type;

cursor c_func is
select nome, sexo from funcionario
where salario > (select avg(salario) from funcionario);

begin

open c_func;

loop
fetch c_func into v_nome, v_sexo;
exit when c_func%NOTFOUND;
dbms_output.put_line('Nome: '||to_char(v_nome)||', sexo: '||to_char(v_sexo));
end loop;
close c_func;

end;

Q13

set serveroutput on;

create or replace procedure promover(p_cpf medico.cpf%type) is

v_cpf medico.cpf%type;
v_supervisor medico.cpf%type;

begin
    select cad_supv into v_cpf from medico where cpf = p_cpf;
    select cad_supv into v_supervisor from medico where cpf = v_cpf;
	update medico
	set cad_supv = v_supervisor
	where cpf = p_cpf;

exception
	when no_data_found then
	dbms_output.put_line('Não foi possivel promover o funcionario de cpf '||p_cpf);
end promover;
/

Q14

create or replace procedure p_telefone(p_cpf fone_func.codfunc%type, p_fone fone_func.telefone%type) is

v_cpf funcionario.cpf%type;


begin
	select cpf into v_cpf from funcionario where p_cpf = cpf;
	insert into fone_func(codfunc,telefone) values(p_cpf, p_fone);
	
exception
	when no_data_found then
	dbms_output.put_line('Não existe funcionario com o cpf '||p_cpf);	
	when DUP_VAL_ON_INDEX then 
	dbms_output.put_line('O telefone '||p_fone||' já está cadastrado para o funcionario com o cpf '||p_cpf);
end p_telefone;
/

Q15

create or replace procedure chefiar(p_crm medico.crm%type, p_codigo departamento.codigo%type) is

v_cpf medico.cpf%type;
v_codigo departamento.codigo%type;

begin	
	select cpf into v_cpf from medico where p_crm = crm;
	select codigo into v_codigo from departamento where p_codigo = codigo;
	update departamento
	set cad_chef = v_cpf
	where codigo = v_codigo;
exception
	when no_data_found then
	dbms_output.put_line('Não existe departamento com o codigo '||p_codigo||' e/ou não exite medico com o crm '||p_crm);
end chefiar;
/
	
Q16

create or replace function f_reconhecedor (p_id_corpo corpo.codigo%type)
return varchar2 is

cursor c_nome is
select nome from reconhecedor
where idcorpo = p_id_corpo;

retorno varchar2(2560) := '';
v_nome reconhecedor.nome%type;

begin
	open c_nome;
	loop
	fetch c_nome into v_nome;
	exit when c_nome%notfound;
	retorno := retorno || v_nome || ',';
	end loop;
	retorno := substr(retorno,0,length(retorno)-1);
	return retorno;
end f_reconhecedor;
/


Q17 

create or replace function f_supervisor (p_codigo_corpo corpo.codigo%type)
return varchar2 is
retorno funcionario.come%type;
begin
	select f.nome into retorno from funcionario f, departamento d, medico m, corpo c
	where c.codigo = p_codigo_corpo and c.cod_dept = d.codigo and m.cpf = d.cad_chef
	and m.cad_supv = f.cpf;
	return retorno;
end f_supervisor;
/

Q20

create or replace procedure add_mon(p_cpf funcionario.cpf%type) is

v_data trabalha.data%type;

begin
	select max(data) into v_data from trabalha where p_cpf = cademp;
	update trabalha set data = add_months(v_data, 1) where p_cpf = cademp and data = v_data;
exception
	when no_data_found then
	dbms_output.put_line('Não existe funcionario com o cpf '||p_cpf||' cadastrado.');
end add_mon;
/ 