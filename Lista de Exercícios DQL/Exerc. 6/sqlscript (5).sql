REM   Script: Exerc. 6
REM   6. Contar quantos professores estão lecionando mais de 3 turmas
Liste os nomes dos professores que estão lecionando mais de 3 turmas.

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE professores CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE professores ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    especialidade VARCHAR2(100) NOT NULL 
);

INSERT INTO professores (nome, especialidade) VALUES ('Ana Oliveira', 'Matemática');

INSERT INTO professores (nome, especialidade) VALUES ('Carlos Silva', 'Física');

INSERT INTO professores (nome, especialidade) VALUES ('Beatriz Santos', 'História');

INSERT INTO professores (nome, especialidade) VALUES ('Daniel Lima', 'Química');

INSERT INTO professores (nome, especialidade) VALUES ('Eduardo Pereira', 'Biologia');

SELECT nome, especialidade 
FROM professores 
ORDER BY nome DESC;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE professores CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE professores ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    especialidade VARCHAR2(100) NOT NULL 
);

INSERT INTO professores (nome, especialidade) VALUES ('Ana Oliveira', 'Matemática');

INSERT INTO professores (nome, especialidade) VALUES ('Carlos Silva', 'Física');

INSERT INTO professores (nome, especialidade) VALUES ('Beatriz Santos', 'História');

INSERT INTO professores (nome, especialidade) VALUES ('Daniel Lima', 'Química');

INSERT INTO professores (nome, especialidade) VALUES ('Eduardo Pereira', 'Biologia');

SELECT nome, especialidade 
FROM professores 
ORDER BY nome DESC;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Biologia', 50);

SELECT nome, carga_horaria 
FROM disciplinas 
ORDER BY carga_horaria DESC;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE alunos CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE alunos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    status_matricula VARCHAR2(20) NOT NULL 
);

INSERT INTO alunos (nome, status_matricula) VALUES ('João Silva', 'Ativo');

INSERT INTO alunos (nome, status_matricula) VALUES ('Maria Santos', 'Concluído');

INSERT INTO alunos (nome, status_matricula) VALUES ('Pedro Oliveira', 'Ativo');

INSERT INTO alunos (nome, status_matricula) VALUES ('Ana Costa', 'Trancado');

INSERT INTO alunos (nome, status_matricula) VALUES ('Lucas Lima', 'Ativo');

INSERT INTO alunos (nome, status_matricula) VALUES ('Laura Mendes', 'Concluído');

INSERT INTO alunos (nome, status_matricula) VALUES ('Carla Souza', 'Trancado');

INSERT INTO alunos (nome, status_matricula) VALUES ('Rafael Ferreira', 'Ativo');

SELECT status_matricula, COUNT(*) AS numero_alunos 
FROM alunos 
GROUP BY status_matricula;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1); -- Matemática em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2); -- Física em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4); -- Química em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3); -- História em Humanidades 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5); -- Sociologia em Humanidades 
 
-- 8. Consulta para listar cursos com a soma total da carga horária de suas disciplinas 
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1); -- Matemática em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2); -- Física em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4); -- Química em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3); -- História em Humanidades 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5); -- Sociologia em Humanidades 
 
-- 8. Consulta para listar cursos com a soma total da carga horária de suas disciplinas 
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1); -- Matemática em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2); -- Física em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4); -- Química em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3); -- História em Humanidades 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5); -- Sociologia em Humanidades 
 
-- 8. Consulta para listar cursos com a soma total da carga horária de suas disciplinas 
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1); -- Matemática em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2); -- Física em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4); -- Química em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3); -- História em Humanidades 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5); -- Sociologia em Humanidades 
 
-- 8. Consulta para listar cursos com a soma total da carga horária de suas disciplinas 
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1); -- Matemática em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2); -- Física em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4); -- Química em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3); -- História em Humanidades 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5); -- Sociologia em Humanidades 
 
-- 8. Consulta para listar cursos com a soma total da carga horária de suas disciplinas 
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1); -- Matemática em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2); -- Física em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4); -- Química em Ciências Exatas 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3); -- História em Humanidades 
INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5); -- Sociologia em Humanidades 
 
-- 8. Consulta para listar cursos com a soma total da carga horária de suas disciplinas 
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE cursos_disciplinas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE cursos CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE disciplinas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE cursos ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE disciplinas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL, 
    carga_horaria NUMBER NOT NULL 
);

CREATE TABLE cursos_disciplinas ( 
    curso_id NUMBER NOT NULL, 
    disciplina_id NUMBER NOT NULL, 
    FOREIGN KEY (curso_id) REFERENCES cursos(id), 
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) 
);

INSERT INTO cursos (nome) VALUES ('Ciências Exatas');

INSERT INTO cursos (nome) VALUES ('Humanidades');

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Matemática', 80);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Física', 60);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('História', 40);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Química', 70);

INSERT INTO disciplinas (nome, carga_horaria) VALUES ('Sociologia', 50);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 1);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 2);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (1, 4);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 3);

INSERT INTO cursos_disciplinas (curso_id, disciplina_id) VALUES (2, 5);

SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total 
FROM cursos c 
JOIN cursos_disciplinas cd ON c.id = cd.curso_id 
JOIN disciplinas d ON cd.disciplina_id = d.id 
GROUP BY c.nome;

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE professores_turmas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE professores CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE turmas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE professores ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE turmas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE professores_turmas ( 
    professor_id NUMBER NOT NULL, 
    turma_id NUMBER NOT NULL, 
    FOREIGN KEY (professor_id) REFERENCES professores(id), 
    FOREIGN KEY (turma_id) REFERENCES turmas(id) 
);

INSERT INTO professores (nome) VALUES ('Ana Oliveira');

INSERT INTO professores (nome) VALUES ('Carlos Silva');

INSERT INTO professores (nome) VALUES ('Beatriz Santos');

INSERT INTO professores (nome) VALUES ('Daniel Lima');

INSERT INTO professores (nome) VALUES ('Eduardo Pereira');

INSERT INTO turmas (nome) VALUES ('Turma A');

INSERT INTO turmas (nome) VALUES ('Turma B');

INSERT INTO turmas (nome) VALUES ('Turma C');

INSERT INTO turmas (nome) VALUES ('Turma D');

INSERT INTO turmas (nome) VALUES ('Turma E');

INSERT INTO turmas (nome) VALUES ('Turma F');

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 1);

BEGIN 
  EXECUTE IMMEDIATE 'DROP TABLE professores_turmas CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE professores CASCADE CONSTRAINTS'; 
  EXECUTE IMMEDIATE 'DROP TABLE turmas CASCADE CONSTRAINTS'; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -942 THEN 
      RAISE; 
    END IF; 
END; 
/

CREATE TABLE professores ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

CREATE TABLE turmas ( 
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY, 
    nome VARCHAR2(100) NOT NULL 
);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 2);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 3);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 4);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (2, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (2, 2);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (2, 3);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (3, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 2);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 3);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 4);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 5);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (5, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (5, 2);

SELECT p.nome 
FROM professores p 
JOIN professores_turmas pt ON p.id = pt.professor_id 
GROUP BY p.nome 
HAVING COUNT(pt.turma_id) > 3;

CREATE TABLE professores_turmas ( 
    professor_id NUMBER NOT NULL, 
    turma_id NUMBER NOT NULL, 
    FOREIGN KEY (professor_id) REFERENCES professores(id), 
    FOREIGN KEY (turma_id) REFERENCES turmas(id) 
);

INSERT INTO professores (nome) VALUES ('Ana Oliveira');

INSERT INTO professores (nome) VALUES ('Carlos Silva');

INSERT INTO professores (nome) VALUES ('Beatriz Santos');

INSERT INTO professores (nome) VALUES ('Daniel Lima');

INSERT INTO professores (nome) VALUES ('Eduardo Pereira');

INSERT INTO turmas (nome) VALUES ('Turma A');

INSERT INTO turmas (nome) VALUES ('Turma B');

INSERT INTO turmas (nome) VALUES ('Turma C');

INSERT INTO turmas (nome) VALUES ('Turma D');

INSERT INTO turmas (nome) VALUES ('Turma E');

INSERT INTO turmas (nome) VALUES ('Turma F');

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 2);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 3);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (1, 4);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (2, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (2, 2);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (2, 3);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (3, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 2);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 3);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 4);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (4, 5);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (5, 1);

INSERT INTO professores_turmas (professor_id, turma_id) VALUES (5, 2);

SELECT p.nome 
FROM professores p 
JOIN professores_turmas pt ON p.id = pt.professor_id 
GROUP BY p.nome 
HAVING COUNT(pt.turma_id) > 3;

