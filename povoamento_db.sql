-- =============================================================
-- SCRIPT DE POPULAÇÃO DO BANCO DE DADOS ESCOLAR
-- Ordem respeitando dependências entre tabelas (FKs)
-- =============================================================

-- -------------------------------------------------------------
-- 1. PESSOA (base de tudo)
-- -------------------------------------------------------------
INSERT INTO PESSOA (cpf, sexo, nome, dt_nasc, rua, bairro, cidade, cep) VALUES
('111.111.111-01', 'M', 'Carlos Eduardo Souza',      '1990-03-15', 'Rua das Flores, 10',     'Centro',        'Recife',    '50010-000'),
('111.111.111-02', 'F', 'Ana Paula Lima',             '1988-07-22', 'Av. Boa Viagem, 300',    'Boa Viagem',    'Recife',    '51011-000'),
('111.111.111-03', 'M', 'Roberto Alves Ferreira',    '1985-11-05', 'Rua do Sol, 45',          'Várzea',        'Recife',    '50741-000'),
('111.111.111-04', 'F', 'Fernanda Costa Dias',       '1992-01-30', 'Rua Nova, 88',            'Encruzilhada',  'Recife',    '52031-000'),
('111.111.111-05', 'M', 'Marcos Vinicius Teixeira',  '1995-09-18', 'Av. Norte, 150',          'Casa Forte',    'Recife',    '52061-000'),
('111.111.111-06', 'F', 'Juliana Melo Santos',       '1993-04-12', 'Rua do Parque, 7',        'Graças',        'Recife',    '52011-000'),
('111.111.111-07', 'M', 'Pedro Henrique Oliveira',   '1987-12-01', 'Rua Beberibe, 200',       'Beberibe',      'Recife',    '52110-000'),
('111.111.111-08', 'F', 'Luciana Barros Ramos',      '1991-06-25', 'Av. Agamenon, 500',       'Aflitos',       'Recife',    '52050-000'),
('111.111.111-09', 'M', 'Diego Martins Cruz',        '1996-02-14', 'Rua Harmonia, 33',        'Espinheiro',    'Recife',    '52020-000'),
('111.111.111-10', 'F', 'Tatiane Rocha Neves',       '1994-08-09', 'Rua das Acácias, 12',     'Madalena',      'Recife',    '50710-000'),
-- Funcionários (professores, administrativos, monitores)
('222.222.222-01', 'M', 'Prof. Alexandre Mendes',    '1975-05-10', 'Rua Imperial, 88',        'Santo Amaro',   'Recife',    '50040-000'),
('222.222.222-02', 'F', 'Profa. Carla Vasconcelos',  '1978-09-20', 'Av. Conde, 210',          'Boa Vista',     'Recife',    '50060-000'),
('222.222.222-03', 'M', 'Prof. Henrique Farias',     '1980-03-15', 'Rua da Aurora, 55',       'Boa Vista',     'Recife',    '50050-000'),
('222.222.222-04', 'F', 'Profa. Beatriz Cavalcanti', '1982-11-28', 'Rua do Hospício, 70',     'Boa Vista',     'Recife',    '50060-000'),
('222.222.222-05', 'M', 'José Augusto Pereira',      '1983-07-03', 'Av. Dezessete, 99',       'Ilha do Leite', 'Recife',    '50070-000'),
('222.222.222-06', 'F', 'Márcia Lopes Guimarães',    '1986-01-17', 'Rua Formosa, 14',         'Boa Vista',     'Recife',    '50050-000'),
('222.222.222-07', 'M', 'André Luiz Correia',        '1998-10-22', 'Rua Gervásio Pires, 40',  'Boa Vista',     'Recife',    '50050-000'),
('222.222.222-08', 'F', 'Priscila Torres Maia',      '1999-04-05', 'Av. Manoel Borba, 120',   'Boa Vista',     'Recife',    '50060-000'),
-- Ex-alunos
('333.333.333-01', 'M', 'Bruno Nascimento Silva',    '1985-06-30', 'Rua do Riachuelo, 300',   'Boa Vista',     'Recife',    '50050-000'),
('333.333.333-02', 'F', 'Simone Araújo Freitas',     '1987-02-14', 'Av. Agamenon, 800',       'Aflitos',       'Recife',    '52050-000');

-- -------------------------------------------------------------
-- 2. DEPARTAMENTO
-- -------------------------------------------------------------
INSERT INTO DEPARTAMENTO (id_dept, nome, gestor, localizacao) VALUES
('DEPT-01', 'Departamento de Ciência da Computação', 'Prof. Alexandre Mendes', 'Bloco A - 2º andar'),
('DEPT-02', 'Departamento de Matemática',             'Profa. Carla Vasconcelos','Bloco B - 1º andar'),
('DEPT-03', 'Departamento de Administração',          'José Augusto Pereira',   'Bloco C - Térreo'),
('DEPT-04', 'Departamento de Letras',                 'Profa. Beatriz Cavalcanti','Bloco D - 1º andar');

-- -------------------------------------------------------------
-- 3. TURMA
-- -------------------------------------------------------------
INSERT INTO TURMA (id_turma, sala, ano, semestre) VALUES
('TURMA-001', 'A-101', 2024, 1),
('TURMA-002', 'A-102', 2024, 1),
('TURMA-003', 'B-201', 2024, 2),
('TURMA-004', 'B-202', 2024, 2),
('TURMA-005', 'C-301', 2025, 1);

-- -------------------------------------------------------------
-- 4. FUNCIONARIO (depende de PESSOA e DEPARTAMENTO)
-- -------------------------------------------------------------
INSERT INTO FUNCIONARIO (cpf_func, salario, id_dept) VALUES
('222.222.222-01', 8500.00, 'DEPT-01'),
('222.222.222-02', 8000.00, 'DEPT-02'),
('222.222.222-03', 7800.00, 'DEPT-01'),
('222.222.222-04', 7900.00, 'DEPT-04'),
('222.222.222-05', 5500.00, 'DEPT-03'),
('222.222.222-06', 5200.00, 'DEPT-03'),
('222.222.222-07', 1800.00, 'DEPT-01'),
('222.222.222-08', 1800.00, 'DEPT-02');

-- -------------------------------------------------------------
-- 5. PROFESSOR (depende de FUNCIONARIO)
-- -------------------------------------------------------------
INSERT INTO PROFESSOR (cpf_func, formacao) VALUES
('222.222.222-01', 'Doutorado em Ciência da Computação - UFPE'),
('222.222.222-02', 'Doutorado em Matemática Aplicada - UNICAMP'),
('222.222.222-03', 'Mestrado em Engenharia de Software - UFPE'),
('222.222.222-04', 'Doutorado em Linguística - UFPB');

-- -------------------------------------------------------------
-- 6. PROFESSOR_DISCIPLINA (depende de PROFESSOR)
-- -------------------------------------------------------------
INSERT INTO PROFESSOR_DISCIPLINA (cpf_prof, hr_semanais) VALUES
('222.222.222-01', 12),
('222.222.222-02', 10),
('222.222.222-03', 14),
('222.222.222-04', 10);

-- -------------------------------------------------------------
-- 7. ADMINISTRATIVO (depende de FUNCIONARIO)
-- -------------------------------------------------------------
INSERT INTO ADMINISTRATIVO (cpf_func, cargo) VALUES
('222.222.222-05', 'Coordenador Acadêmico'),
('222.222.222-06', 'Secretária');

-- -------------------------------------------------------------
-- 8. ALUNO_MONITOR (depende de FUNCIONARIO)
-- -------------------------------------------------------------
INSERT INTO ALUNO_MONITOR (cpf_func, tempo_monitoria) VALUES
('222.222.222-07', '6 meses - Algoritmos'),
('222.222.222-08', '4 meses - Cálculo I');

-- -------------------------------------------------------------
-- 9. TELEFONE_FUNC (depende de FUNCIONARIO)
-- -------------------------------------------------------------
INSERT INTO TELEFONE_FUNC (telefone, cpf_func) VALUES
('(81) 98001-0001', '222.222.222-01'),
('(81) 98001-0002', '222.222.222-02'),
('(81) 98001-0003', '222.222.222-03'),
('(81) 98001-0004', '222.222.222-04'),
('(81) 98001-0005', '222.222.222-05'),
('(81) 98001-0006', '222.222.222-06');

-- -------------------------------------------------------------
-- 10. ALUNO (depende de PESSOA e TURMA)
-- -------------------------------------------------------------
INSERT INTO ALUNO (matricula, serie, cpf_aluno, id_turma) VALUES
('2024001', '5º Período - CC',   '111.111.111-01', 'TURMA-001'),
('2024002', '3º Período - CC',   '111.111.111-02', 'TURMA-002'),
('2024003', '7º Período - CC',   '111.111.111-03', 'TURMA-003'),
('2024004', '1º Período - MAT',  '111.111.111-04', 'TURMA-001'),
('2024005', '3º Período - MAT',  '111.111.111-05', 'TURMA-002'),
('2024006', '5º Período - ADM',  '111.111.111-06', 'TURMA-004'),
('2024007', '2º Período - CC',   '111.111.111-07', 'TURMA-005'),
('2024008', '4º Período - CC',   '111.111.111-08', 'TURMA-003'),
('2024009', '6º Período - ADM',  '111.111.111-09', 'TURMA-004'),
('2024010', '2º Período - MAT',  '111.111.111-10', 'TURMA-005');

-- -------------------------------------------------------------
-- 11. EX_ALUNO (depende de PESSOA e DEPARTAMENTO)
-- -------------------------------------------------------------
INSERT INTO EX_ALUNO (cpf_ex_aluno, ano, turma, id_dept) VALUES
('333.333.333-01', 2020, 'CC-2020-A', 'DEPT-01'),
('333.333.333-02', 2021, 'ADM-2021-B', 'DEPT-03');

-- -------------------------------------------------------------
-- 12. DISCIPLINA (depende de DEPARTAMENTO e PROFESSOR)
-- -------------------------------------------------------------
INSERT INTO DISCIPLINA (id_disciplina, nome, carga_hor, id_dept, cpf_prof_disc) VALUES
('DISC-01', 'Algoritmos e Estruturas de Dados', 80, 'DEPT-01', '222.222.222-01'),
('DISC-02', 'Banco de Dados',                   60, 'DEPT-01', '222.222.222-03'),
('DISC-03', 'Programação Orientada a Objetos',  60, 'DEPT-01', '222.222.222-01'),
('DISC-04', 'Cálculo I',                        80, 'DEPT-02', '222.222.222-02'),
('DISC-05', 'Álgebra Linear',                   60, 'DEPT-02', '222.222.222-02'),
('DISC-06', 'Gestão Empresarial',               60, 'DEPT-03', '222.222.222-03'),
('DISC-07', 'Redação e Comunicação',            40, 'DEPT-04', '222.222.222-04'),
('DISC-08', 'Engenharia de Software',           80, 'DEPT-01', '222.222.222-03');

-- -------------------------------------------------------------
-- 13. CURSO_EXTRACURRICULAR (depende de DISCIPLINA e DEPARTAMENTO)
-- -------------------------------------------------------------
INSERT INTO CURSO_EXTRACURRICULAR (id_curso, carga_horaria, id_disciplina, id_dept) VALUES
('CURSO-01', 20, 'DISC-01', 'DEPT-01'),
('CURSO-02', 15, 'DISC-02', 'DEPT-01'),
('CURSO-03', 10, 'DISC-04', 'DEPT-02'),
('CURSO-04', 20, 'DISC-06', 'DEPT-03');

-- -------------------------------------------------------------
-- 14. HISTORICO_GERAL (depende de ALUNO)
-- -------------------------------------------------------------
INSERT INTO HISTORICO_GERAL (periodo, media, matricula_aluno) VALUES
('2024.1', 7.50, '2024001'),
('2024.1', 8.20, '2024002'),
('2024.1', 6.80, '2024003'),
('2024.1', 9.00, '2024004'),
('2024.1', 7.10, '2024005'),
('2024.2', 6.50, '2024006'),
('2024.2', 8.75, '2024007'),
('2024.2', 7.90, '2024008'),
('2024.2', 5.60, '2024009'),
('2024.2', 8.40, '2024010');

-- -------------------------------------------------------------
-- 15. HISTORICO_DISCIPLINA (depende de HISTORICO_GERAL e DISCIPLINA)
-- Supondo que os id_hist_geral foram gerados de 1 a 10 (SERIAL)
-- -------------------------------------------------------------
INSERT INTO HISTORICO_DISCIPLINA (nota, frequencia, id_hist_geral, id_disc) VALUES
(7.5,  85.00, 1, 'DISC-01'),
(7.5,  90.00, 1, 'DISC-03'),
(8.0,  88.00, 2, 'DISC-01'),
(8.5,  92.00, 2, 'DISC-02'),
(6.5,  78.00, 3, 'DISC-08'),
(7.2,  82.00, 3, 'DISC-02'),
(9.0,  95.00, 4, 'DISC-04'),
(9.0,  97.00, 4, 'DISC-05'),
(7.0,  80.00, 5, 'DISC-04'),
(7.3,  75.00, 5, 'DISC-05'),
(6.5,  70.00, 6, 'DISC-06'),
(6.5,  68.00, 6, 'DISC-07'),
(8.5,  91.00, 7, 'DISC-01'),
(9.0,  94.00, 7, 'DISC-03'),
(7.8,  87.00, 8, 'DISC-02'),
(8.0,  89.00, 8, 'DISC-08'),
(5.5,  65.00, 9, 'DISC-06'),
(5.7,  60.00, 9, 'DISC-07'),
(8.3,  93.00, 10,'DISC-04'),
(8.6,  90.00, 10,'DISC-05');

-- -------------------------------------------------------------
-- 16. RESPONSAVEL_ATIVIDADES (depende de FUNCIONARIO e DISCIPLINA)
-- -------------------------------------------------------------
INSERT INTO RESPONSAVEL_ATIVIDADES (cpf_func, id_disciplina, certificados) VALUES
('222.222.222-01', 'DISC-01', 'Certificado de Responsável - Algoritmos 2024'),
('222.222.222-02', 'DISC-04', 'Certificado de Responsável - Cálculo 2024'),
('222.222.222-03', 'DISC-02', 'Certificado de Responsável - BD 2024'),
('222.222.222-04', 'DISC-07', 'Certificado de Responsável - Redação 2024'),
('222.222.222-05', 'DISC-06', 'Certificado de Responsável - Gestão 2024');

-- -------------------------------------------------------------
-- 17. CURSA (depende de ALUNO e DISCIPLINA)
-- -------------------------------------------------------------
INSERT INTO CURSA (matricula_aluno, id_disciplina, horas) VALUES
('2024001', 'DISC-01', 80),
('2024001', 'DISC-03', 60),
('2024002', 'DISC-01', 80),
('2024002', 'DISC-02', 60),
('2024003', 'DISC-08', 80),
('2024003', 'DISC-02', 60),
('2024004', 'DISC-04', 80),
('2024004', 'DISC-05', 60),
('2024005', 'DISC-04', 80),
('2024005', 'DISC-05', 60),
('2024006', 'DISC-06', 60),
('2024006', 'DISC-07', 40),
('2024007', 'DISC-01', 80),
('2024007', 'DISC-03', 60),
('2024008', 'DISC-02', 60),
('2024008', 'DISC-08', 80),
('2024009', 'DISC-06', 60),
('2024009', 'DISC-07', 40),
('2024010', 'DISC-04', 80),
('2024010', 'DISC-05', 60);

-- -------------------------------------------------------------
-- 18. ESTA_MATRICULADO (depende de ALUNO e CURSO_EXTRACURRICULAR)
-- -------------------------------------------------------------
INSERT INTO ESTA_MATRICULADO (matricula_aluno, id_curso, semestre) VALUES
('2024001', 'CURSO-01', '2024.1'),
('2024002', 'CURSO-02', '2024.1'),
('2024004', 'CURSO-03', '2024.1'),
('2024007', 'CURSO-01', '2024.2'),
('2024008', 'CURSO-02', '2024.2'),
('2024010', 'CURSO-03', '2024.2');

-- -------------------------------------------------------------
-- 19. OFERECE (depende de DISCIPLINA e TURMA)
-- -------------------------------------------------------------
INSERT INTO OFERECE (id_disciplina, id_turma, vagas) VALUES
('DISC-01', 'TURMA-001', 40),
('DISC-02', 'TURMA-001', 40),
('DISC-03', 'TURMA-002', 35),
('DISC-04', 'TURMA-002', 45),
('DISC-05', 'TURMA-003', 40),
('DISC-06', 'TURMA-004', 30),
('DISC-07', 'TURMA-004', 30),
('DISC-08', 'TURMA-003', 35),
('DISC-01', 'TURMA-005', 40),
('DISC-04', 'TURMA-005', 45);

-- =============================================================
-- FIM DO SCRIPT
-- =============================================================
