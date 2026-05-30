CREATE TABLE PESSOA(
    cpf VARCHAR(14),
    sexo CHAR(1),
    nome VARCHAR(100),
    dt_nasc DATE,
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    cep VARCHAR(9),
    CONSTRAINT pk_pessoa PRIMARY KEY (cpf)
);

CREATE TABLE ALUNO(
    matricula VARCHAR(20),
    serie VARCHAR(30),
    cpf_aluno VARCHAR(14) UNIQUE,
    id_turma VARCHAR(20),
    CONSTRAINT pk_aluno PRIMARY KEY (matricula),
    FOREIGN KEY (cpf_aluno) REFERENCES PESSOA(cpf)
);

CREATE TABLE FUNCIONARIO(
    salario NUMERIC(8, 2),
    cpf_func VARCHAR(14),
    id_dept VARCHAR(20),
    CONSTRAINT pk_funcionario PRIMARY KEY (cpf_func),
    FOREIGN KEY (cpf_func) REFERENCES PESSOA(cpf)
);

CREATE TABLE PROFESSOR(
    formacao VARCHAR(100),
    cpf_func VARCHAR(14),
    CONSTRAINT pk_professor PRIMARY KEY (cpf_func),
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO(cpf_func)
);

CREATE TABLE PROFESSOR_DISCIPLINA(
    hr_semanais INTEGER,
    cpf_prof VARCHAR(14),
    CONSTRAINT pk_prof_disc PRIMARY KEY (cpf_prof),
    FOREIGN KEY (cpf_prof) REFERENCES PROFESSOR(cpf_func)
);

CREATE TABLE TELEFONE_FUNC(
    telefone VARCHAR(20),
    cpf_func VARCHAR(14),
    CONSTRAINT pk_telefone PRIMARY KEY (telefone),
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO(cpf_func)
);

CREATE TABLE DEPARTAMENTO(
    id_dept VARCHAR(20),
    nome VARCHAR(100),
    gestor VARCHAR(100),
    localizacao VARCHAR(100),
    id_prof_disc VARCHAR(14),
    CONSTRAINT pk_departamento PRIMARY KEY (id_dept),
    FOREIGN KEY (id_prof_disc) REFERENCES PROFESSOR_DISCIPLINA(cpf_prof)
);

CREATE TABLE EX_ALUNO(
    ano INTEGER,
    turma VARCHAR(20),
    cpf_ex_aluno VARCHAR(14),
    id_dept VARCHAR(20),
    CONSTRAINT pk_ex_aluno PRIMARY KEY (cpf_ex_aluno),
    FOREIGN KEY (cpf_ex_aluno) REFERENCES PESSOA(cpf),
    FOREIGN KEY (id_dept) REFERENCES DEPARTAMENTO(id_dept)
);

CREATE TABLE TURMA(
    id_turma VARCHAR(20),
    sala VARCHAR(20),
    ano INTEGER,
    semestre INTEGER,
    CONSTRAINT pk_turma PRIMARY KEY (id_turma)
);

CREATE TABLE ADMINISTRATIVO(
    cargo VARCHAR(50),
    cpf_func VARCHAR(14),
    CONSTRAINT pk_administrativo PRIMARY KEY (cpf_func),
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO(cpf_func)
);

CREATE TABLE ALUNO_MONITOR(
    tempo_monitoria VARCHAR(50),
    cpf_func VARCHAR(14),
    CONSTRAINT pk_aluno_monitor PRIMARY KEY (cpf_func),
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO(cpf_func)
);

CREATE TABLE DISCIPLINA(
    id_disciplina VARCHAR(20),
    nome VARCHAR(100),
    carga_hor INTEGER,
    id_dept VARCHAR(20),
    cpf_prof_disc VARCHAR(14),
    CONSTRAINT pk_disciplina PRIMARY KEY (id_disciplina),
    FOREIGN KEY (id_dept) REFERENCES DEPARTAMENTO(id_dept),
    FOREIGN KEY (cpf_prof_disc) REFERENCES PROFESSOR(cpf_func)
);

CREATE TABLE CURSO_EXTRACURRICULAR(
    id_curso VARCHAR(20),
    carga_horaria INTEGER,
    id_disciplina VARCHAR(20),
    id_dept VARCHAR(20),
    CONSTRAINT pk_curso_extra PRIMARY KEY (id_curso),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina),
    FOREIGN KEY (id_dept) REFERENCES DEPARTAMENTO(id_dept)
);

CREATE TABLE HISTORICO_GERAL(
    id_hist_geral SERIAL,
    periodo VARCHAR(20),
    media NUMERIC(4, 2),
    matricula_aluno VARCHAR(20),
    CONSTRAINT pk_historico_geral PRIMARY KEY (id_hist_geral),
    FOREIGN KEY (matricula_aluno) REFERENCES ALUNO(matricula)
);

CREATE TABLE HISTORICO_DISCIPLINA(
    id_hist_disc SERIAL,
    nota NUMERIC(4, 2),
    frequencia NUMERIC(5, 2),
    id_hist_geral INTEGER,
    id_disc VARCHAR(20),
    CONSTRAINT pk_historico_disciplina PRIMARY KEY (id_hist_disc),
    FOREIGN KEY (id_hist_geral) REFERENCES HISTORICO_GERAL(id_hist_geral),
    FOREIGN KEY (id_disc) REFERENCES DISCIPLINA(id_disciplina)
);

CREATE TABLE RESPONSAVEL_ATIVIDADES(
    certificados VARCHAR(100),
    cpf_func VARCHAR(14),
    id_disciplina VARCHAR(20),
    CONSTRAINT pk_resp_ativ PRIMARY KEY (cpf_func, id_disciplina), -- rever
    FOREIGN KEY (cpf_func) REFERENCES FUNCIONARIO(cpf_func),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)
);

CREATE TABLE CURSA(
    horas INTEGER,
    matricula_aluno VARCHAR(20),
    id_disciplina VARCHAR(20),
    CONSTRAINT pk_cursa PRIMARY KEY (matricula_aluno, id_disciplina),
    FOREIGN KEY (matricula_aluno) REFERENCES ALUNO(matricula),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)
);

CREATE TABLE ESTA_MATRICULADO(
    semestre VARCHAR(20),
    matricula_aluno VARCHAR(20),
    id_curso VARCHAR(20),
    CONSTRAINT pk_esta_matriculado PRIMARY KEY (matricula_aluno, id_curso),
    FOREIGN KEY (matricula_aluno) REFERENCES ALUNO(matricula),
    FOREIGN KEY (id_curso) REFERENCES CURSO_EXTRACURRICULAR(id_curso)
);

CREATE TABLE OFERECE(
    vagas INTEGER,
    id_disciplina VARCHAR(20),
    id_turma VARCHAR(20),
    CONSTRAINT pk_oferece PRIMARY KEY (id_disciplina, id_turma),
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina),
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma)
);