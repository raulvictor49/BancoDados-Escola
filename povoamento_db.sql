-- -------------------------------------------------------------
-- 1. PESSOA
-- -------------------------------------------------------------
INSERT INTO PESSOA (cpf, sexo, nome, dt_nasc, rua, bairro, cidade, cep) VALUES
-- Alunos (13 a 17 anos)
('010.020.030-01', 'M', 'Arthur Lemos Cavalcanti',      '2009-03-12', 'Rua das Mangueiras, 15',    'Boa Viagem',   'Recife', '51020-000'),
('010.020.030-02', 'F', 'Maria Clara Souza Ramos',      '2010-07-08', 'Rua do Progresso, 88',      'Espinheiro',   'Recife', '52020-000'),
('010.020.030-03', 'M', 'João Pedro Alves Ferraz',      '2008-11-25', 'Av. Norte, 300',            'Graças',       'Recife', '52011-000'),
('010.020.030-04', 'F', 'Ana Beatriz Lima Torres',      '2009-01-17', 'Rua Harmonia, 10',          'Madalena',     'Recife', '50710-000'),
('010.020.030-05', 'M', 'Pedro Lucas Barros Neto',      '2008-09-05', 'Rua das Acácias, 55',       'Aflitos',      'Recife', '52050-000'),
('010.020.030-06', 'F', 'Sophia Andrade Freitas',       '2010-04-22', 'Av. Caxangá, 200',          'Várzea',       'Recife', '50741-000'),
('010.020.030-07', 'M', 'Guilherme Rocha Moreira',      '2007-12-30', 'Rua Nova, 77',              'Encruzilhada', 'Recife', '52031-000'),
('010.020.030-08', 'F', 'Isabela Nascimento Cruz',      '2008-06-14', 'Av. Agamenon, 654',         'Casa Forte',   'Recife', '52061-000'),
('010.020.030-09', 'M', 'Miguel Teixeira Gomes',        '2007-02-19', 'Rua do Sol, 33',            'Beberibe',     'Recife', '52110-000'),
('010.020.030-10', 'F', 'Larissa Campos Guimarães',     '2009-08-03', 'Rua Beberibe, 120',         'Boa Vista',    'Recife', '50060-000'),
-- Funcionários (professores, administrativos, monitores)
('040.050.060-01', 'M', 'Prof. Eduardo Paes Nogueira',  '1978-05-10', 'Rua Imperial, 88',          'Santo Amaro',  'Recife', '50040-000'),
('040.050.060-02', 'F', 'Profa. Mônica Leal Santana',   '1982-09-20', 'Av. Conde, 210',            'Boa Vista',    'Recife', '50060-000'),
('040.050.060-03', 'M', 'Prof. Fábio Correia Duarte',   '1975-03-15', 'Rua da Aurora, 55',         'Boa Vista',    'Recife', '50050-000'),
('040.050.060-04', 'F', 'Profa. Cristiane Melo Vidal',  '1980-11-28', 'Rua do Hospício, 70',       'Boa Vista',    'Recife', '50060-000'),
('040.050.060-05', 'M', 'Roberto Dias Figueiredo',      '1985-07-03', 'Av. Dezessete, 99',         'Ilha do Leite','Recife', '50070-000'),
('040.050.060-06', 'F', 'Sônia Vieira Magalhães',       '1990-01-17', 'Rua Formosa, 14',           'Boa Vista',    'Recife', '50050-000'),
('040.050.060-07', 'M', 'Lucas Henrique Prado',         '2006-10-22', 'Rua Gervásio Pires, 40',    'Boa Vista',    'Recife', '50050-000'),
('040.050.060-08', 'F', 'Camila Bastos Rezende',        '2007-04-05', 'Av. Manoel Borba, 120',     'Boa Vista',    'Recife', '50060-000'),
-- Ex-alunos
('070.080.090-01', 'M', 'Rafael Queiroz Monteiro',      '2003-06-30', 'Rua do Riachuelo, 300',     'Boa Vista',    'Recife', '50050-000'),
('070.080.090-02', 'F', 'Fernanda Borges Alencar',      '2004-02-14', 'Av. Agamenon, 800',         'Aflitos',      'Recife', '52050-000');

-- -------------------------------------------------------------
-- 2. DEPARTAMENTO
-- (em escolas, departamentos equivalem às coordenações por área do conhecimento)
-- -------------------------------------------------------------
INSERT INTO DEPARTAMENTO (id_dept, nome, gestor, localizacao) VALUES
('DEPT-01', 'Coordenação de Ciências Exatas e da Natureza', 'Prof. Eduardo Paes Nogueira',  'Bloco Administrativo - Sala 01'),
('DEPT-02', 'Coordenação de Linguagens e Códigos',          'Profa. Mônica Leal Santana',   'Bloco Administrativo - Sala 02'),
('DEPT-03', 'Coordenação de Ciências Humanas',              'Prof. Fábio Correia Duarte',   'Bloco Administrativo - Sala 03'),
('DEPT-04', 'Coordenação Pedagógica e Apoio ao Aluno',      'Profa. Cristiane Melo Vidal',  'Bloco Administrativo - Sala 04');

-- -------------------------------------------------------------
-- 3. TURMA
-- -------------------------------------------------------------
INSERT INTO TURMA (id_turma, sala, ano, semestre) VALUES
('8ANO-A',  'Sala 05', 2024, 1),
('8ANO-B',  'Sala 06', 2024, 1),
('9ANO-A',  'Sala 07', 2024, 2),
('9ANO-B',  'Sala 08', 2024, 2),
('1EM-A',   'Sala 09', 2025, 1);

-- -------------------------------------------------------------
-- 4. FUNCIONARIO
-- -------------------------------------------------------------
INSERT INTO FUNCIONARIO (cpf_func, salario, id_dept) VALUES
('040.050.060-01', 4500.00, 'DEPT-01'),
('040.050.060-02', 4300.00, 'DEPT-02'),
('040.050.060-03', 4400.00, 'DEPT-03'),
('040.050.060-04', 4300.00, 'DEPT-04'),
('040.050.060-05', 3100.00, 'DEPT-04'),
('040.050.060-06', 2900.00, 'DEPT-04'),
('040.050.060-07', 1200.00, 'DEPT-01'),
('040.050.060-08', 1200.00, 'DEPT-02');

-- -------------------------------------------------------------
-- 5. PROFESSOR
-- -------------------------------------------------------------
INSERT INTO PROFESSOR (cpf_func, formacao) VALUES
('040.050.060-01', 'Licenciatura em Matemática e Física - UFPE'),
('040.050.060-02', 'Licenciatura em Letras - Português e Inglês - UFPE'),
('040.050.060-03', 'Licenciatura em História e Geografia - UFPE'),
('040.050.060-04', 'Licenciatura em Pedagogia - UNICAP');

-- -------------------------------------------------------------
-- 6. PROFESSOR_DISCIPLINA
-- (horas semanais dedicadas às disciplinas que leciona)
-- -------------------------------------------------------------
INSERT INTO PROFESSOR_DISCIPLINA (cpf_prof, hr_semanais) VALUES
('040.050.060-01', 20),
('040.050.060-02', 18),
('040.050.060-03', 16),
('040.050.060-04', 12);

-- -------------------------------------------------------------
-- 7. ADMINISTRATIVO
-- -------------------------------------------------------------
INSERT INTO ADMINISTRATIVO (cpf_func, cargo) VALUES
('040.050.060-05', 'Coordenador Pedagógico'),
('040.050.060-06', 'Secretária Escolar');

-- -------------------------------------------------------------
-- 8. ALUNO_MONITOR
-- (alunos mais velhos que auxiliam professores em reforço)
-- -------------------------------------------------------------
INSERT INTO ALUNO_MONITOR (cpf_func, tempo_monitoria) VALUES
('040.050.060-07', '4 meses - Reforço de Matemática'),
('040.050.060-08', '4 meses - Reforço de Português');

-- -------------------------------------------------------------
-- 9. TELEFONE_FUNC
-- -------------------------------------------------------------
INSERT INTO TELEFONE_FUNC (telefone, cpf_func) VALUES
('(81) 98300-2001', '040.050.060-01'),
('(81) 98300-2002', '040.050.060-02'),
('(81) 98300-2003', '040.050.060-03'),
('(81) 98300-2004', '040.050.060-04'),
('(81) 98300-2005', '040.050.060-05'),
('(81) 98300-2006', '040.050.060-06');

-- -------------------------------------------------------------
-- 10. ALUNO
-- -------------------------------------------------------------
INSERT INTO ALUNO (matricula, serie, cpf_aluno, id_turma) VALUES
('20240001', '8º Ano - Fundamental II', '010.020.030-01', '8ANO-A'),
('20240002', '8º Ano - Fundamental II', '010.020.030-02', '8ANO-A'),
('20240003', '8º Ano - Fundamental II', '010.020.030-03', '8ANO-B'),
('20240004', '8º Ano - Fundamental II', '010.020.030-04', '8ANO-B'),
('20240005', '9º Ano - Fundamental II', '010.020.030-05', '9ANO-A'),
('20240006', '9º Ano - Fundamental II', '010.020.030-06', '9ANO-A'),
('20240007', '9º Ano - Fundamental II', '010.020.030-07', '9ANO-B'),
('20240008', '9º Ano - Fundamental II', '010.020.030-08', '9ANO-B'),
('20240009', '1º Ano - Ensino Médio',   '010.020.030-09', '1EM-A'),
('20240010', '1º Ano - Ensino Médio',   '010.020.030-10', '1EM-A');

-- -------------------------------------------------------------
-- 11. EX_ALUNO
-- (alunos que já concluíram o ensino médio na escola)
-- -------------------------------------------------------------
INSERT INTO EX_ALUNO (cpf_ex_aluno, ano, turma, id_dept) VALUES
('070.080.090-01', 2022, '3EM-A-2022', 'DEPT-01'),
('070.080.090-02', 2023, '3EM-A-2023', 'DEPT-02');

-- -------------------------------------------------------------
-- 12. DISCIPLINA
-- -------------------------------------------------------------
INSERT INTO DISCIPLINA (id_disciplina, nome, carga_hor, id_dept, cpf_prof_disc) VALUES
('DISC-01', 'Matemática',          160, 'DEPT-01', '040.050.060-01'),
('DISC-02', 'Física',               80, 'DEPT-01', '040.050.060-01'),
('DISC-03', 'Química',              80, 'DEPT-01', '040.050.060-01'),
('DISC-04', 'Língua Portuguesa',   160, 'DEPT-02', '040.050.060-02'),
('DISC-05', 'Língua Inglesa',       80, 'DEPT-02', '040.050.060-02'),
('DISC-06', 'História',             80, 'DEPT-03', '040.050.060-03'),
('DISC-07', 'Geografia',            80, 'DEPT-03', '040.050.060-03'),
('DISC-08', 'Ciências/Biologia',    80, 'DEPT-04', '040.050.060-04');

-- -------------------------------------------------------------
-- 13. CURSO_EXTRACURRICULAR
-- (reforço escolar e atividades de contraturno)
-- -------------------------------------------------------------
INSERT INTO CURSO_EXTRACURRICULAR (id_curso, carga_horaria, id_disciplina, id_dept) VALUES
('CURSO-01', 20, 'DISC-01', 'DEPT-01'),
('CURSO-02', 20, 'DISC-04', 'DEPT-02'),
('CURSO-03', 15, 'DISC-02', 'DEPT-01'),
('CURSO-04', 15, 'DISC-06', 'DEPT-03');

-- -------------------------------------------------------------
-- 14. HISTORICO_GERAL
-- -------------------------------------------------------------
INSERT INTO HISTORICO_GERAL (periodo, media, matricula_aluno) VALUES
('2024.1', 7.80, '20240001'),
('2024.1', 8.50, '20240002'),
('2024.1', 6.40, '20240003'),
('2024.1', 9.10, '20240004'),
('2024.1', 7.20, '20240005'),
('2024.2', 6.60, '20240006'),
('2024.2', 8.70, '20240007'),
('2024.2', 7.30, '20240008'),
('2024.2', 5.90, '20240009'),
('2024.2', 8.10, '20240010');

-- -------------------------------------------------------------
-- 15. HISTORICO_DISCIPLINA
-- -------------------------------------------------------------
INSERT INTO HISTORICO_DISCIPLINA (nota, frequencia, id_hist_geral, id_disc) VALUES
(7.5,  88.00, 1,  'DISC-01'),
(8.0,  90.00, 1,  'DISC-04'),
(8.5,  93.00, 2,  'DISC-01'),
(8.5,  94.00, 2,  'DISC-04'),
(6.0,  75.00, 3,  'DISC-01'),
(6.8,  80.00, 3,  'DISC-06'),
(9.0,  97.00, 4,  'DISC-01'),
(9.2,  98.00, 4,  'DISC-04'),
(7.0,  82.00, 5,  'DISC-02'),
(7.4,  85.00, 5,  'DISC-08'),
(6.3,  72.00, 6,  'DISC-04'),
(6.9,  78.00, 6,  'DISC-07'),
(8.6,  94.00, 7,  'DISC-01'),
(8.8,  92.00, 7,  'DISC-06'),
(7.1,  83.00, 8,  'DISC-04'),
(7.5,  87.00, 8,  'DISC-08'),
(5.5,  65.00, 9,  'DISC-02'),
(6.2,  70.00, 9,  'DISC-03'),
(8.0,  91.00, 10, 'DISC-04'),
(8.2,  93.00, 10, 'DISC-08');

-- -------------------------------------------------------------
-- 16. RESPONSAVEL_ATIVIDADES
-- -------------------------------------------------------------
INSERT INTO RESPONSAVEL_ATIVIDADES (cpf_func, id_disciplina, certificados) VALUES
('040.050.060-01', 'DISC-01', 'Certificado - Olimpíada de Matemática OBMEP 2024'),
('040.050.060-02', 'DISC-04', 'Certificado - Sarau Literário Escolar 2024'),
('040.050.060-03', 'DISC-06', 'Certificado - Feira Cultural de História 2024'),
('040.050.060-04', 'DISC-08', 'Certificado - Feira de Ciências Escolar 2024'),
('040.050.060-05', 'DISC-07', 'Certificado - Mostra de Geografia 2024');

-- -------------------------------------------------------------
-- 17. CURSA
-- -------------------------------------------------------------
INSERT INTO CURSA (matricula_aluno, id_disciplina, horas) VALUES
('20240001', 'DISC-01', 160),
('20240001', 'DISC-04', 160),
('20240002', 'DISC-01', 160),
('20240002', 'DISC-04', 160),
('20240003', 'DISC-01', 160),
('20240003', 'DISC-06', 80),
('20240004', 'DISC-01', 160),
('20240004', 'DISC-04', 160),
('20240005', 'DISC-02', 80),
('20240005', 'DISC-08', 80),
('20240006', 'DISC-04', 160),
('20240006', 'DISC-07', 80),
('20240007', 'DISC-01', 160),
('20240007', 'DISC-06', 80),
('20240008', 'DISC-04', 160),
('20240008', 'DISC-08', 80),
('20240009', 'DISC-02', 80),
('20240009', 'DISC-03', 80),
('20240010', 'DISC-04', 160),
('20240010', 'DISC-08', 80);

-- -------------------------------------------------------------
-- 18. ESTA_MATRICULADO
-- -------------------------------------------------------------
INSERT INTO ESTA_MATRICULADO (matricula_aluno, id_curso, semestre) VALUES
('20240001', 'CURSO-01', '2024.1'),
('20240003', 'CURSO-02', '2024.1'),
('20240005', 'CURSO-03', '2024.1'),
('20240007', 'CURSO-01', '2024.2'),
('20240008', 'CURSO-02', '2024.2'),
('20240010', 'CURSO-04', '2024.2');

-- -------------------------------------------------------------
-- 19. OFERECE
-- -------------------------------------------------------------
INSERT INTO OFERECE (id_disciplina, id_turma, vagas) VALUES
('DISC-01', '8ANO-A', 35),
('DISC-04', '8ANO-A', 35),
('DISC-01', '8ANO-B', 35),
('DISC-06', '8ANO-B', 35),
('DISC-02', '9ANO-A', 30),
('DISC-08', '9ANO-A', 30),
('DISC-01', '9ANO-B', 30),
('DISC-06', '9ANO-B', 30),
('DISC-02', '1EM-A',  40),
('DISC-03', '1EM-A',  40);

-- =============================================================
-- FIM DO SCRIPT
-- =============================================================
