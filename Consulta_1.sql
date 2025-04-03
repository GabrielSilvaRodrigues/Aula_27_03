CREATE DATABASE clinica;
USE clinica;

CREATE TABLE medico (
   crm VARCHAR(11) NOT NULL PRIMARY KEY,
   nome VARCHAR(100) NOT NULL
);

CREATE TABLE paciente (
   codigo_pac INT AUTO_INCREMENT PRIMARY KEY,
   cpf_pac VARCHAR(11) NOT NULL UNIQUE,
   nome VARCHAR(100) NOT NULL
);

CREATE TABLE atende (
   codigo_atendimento BIGINT AUTO_INCREMENT PRIMARY KEY,
   data_atendimento DATE NOT NULL
);

CREATE TABLE especialidade (
   codigo_especialidade BIGINT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE exame (
   codigo_exame BIGINT AUTO_INCREMENT PRIMARY KEY,
   descricao VARCHAR(500) NOT NULL
);

CREATE TABLE convenio (
   codigo_convenio BIGINT AUTO_INCREMENT PRIMARY KEY,
   nome_convenio VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE consulta(
   numero_atendimento BIGINT AUTO_INCREMENT PRIMARY KEY,
   crm VARCHAR(11),
   cpf_pac VARCHAR(11),
   codigo_convenio BIGINT,
   codigo_especialidade BIGINT,
   diagnostico VARCHAR(500) NOT NULL,
   codigo_atendimento BIGINT NOT null,
   FOREIGN KEY (crm) REFERENCES medico(crm),
   FOREIGN KEY (cpf_pac) REFERENCES paciente(cpf_pac),
   FOREIGN KEY (codigo_convenio) REFERENCES convenio(codigo_convenio),
   FOREIGN KEY (codigo_especialidade) REFERENCES especialidade(codigo_especialidade),
   FOREIGN KEY (codigo_atendimento) REFERENCES atende(codigo_atendimento)
);

CREATE TABLE contem (
   numero_contem BIGINT AUTO_INCREMENT PRIMARY KEY,
   codigo_exame BIGINT, 
   FOREIGN KEY (codigo_exame) REFERENCES exame(codigo_exame)
);

INSERT INTO medico (crm, nome) VALUES
('12345678901', 'Dr. João Silva'),
('98765432100', 'Dra. Maria Oliveira');

INSERT INTO paciente (cpf_pac, nome) VALUES
('12345678901', 'Carlos Souza'),
('98765432100', 'Ana Costa');

INSERT INTO especialidade (nome) VALUES
('Cardiologia'),
('Dermatologia');

INSERT INTO exame (descricao) VALUES
('Exame de sangue'),
('Ressonância magnética');

INSERT INTO convenio (nome_convenio) VALUES
('Unimed'),
('Amil');

INSERT INTO atende (data_atendimento) VALUES
('2025-04-01'),
('2025-04-02');

INSERT INTO consulta (crm, cpf_pac, codigo_convenio, codigo_especialidade, diagnostico, codigo_atendimento) VALUES
('12345678901', '12345678901', 1, 1, 'Diagnóstico de hipertensão', 1),
('98765432100', '98765432100', 2, 2, 'Diagnóstico de acne', 2);


INSERT INTO contem (codigo_exame) VALUES
(1),
(2);


SELECT medico.nome AS nome_medico, paciente.nome AS nome_paciente FROM consulta, medico, paciente WHERE medico.crm AND paciente.cpf_pac;
SELECT medico.nome, paciente.nome FROM consulta INNER JOIN medico ON consulta.crm = medico.crm INNER JOIN paciente ON consulta.cpf_pac = paciente.cpf_pac;
CREATE VIEW vwlistamedicopaciente AS SELECT medico.nome AS nome_medico, paciente.nome AS nome_paciente, atende.data_atendimento FROM consulta, medico, paciente, atende WHERE medico.crm AND paciente.cpf_pac AND atende.data_atendimento;
SELECT * FROM vwlistamedicopaciente;
SELECT * FROM vwlistamedicopaciente WHERE nome_medico = 'Dr. João Silva' AND data_atendimento BETWEEN '2025-04-01' AND '2025-04-03';
DROP database clinica;
CREATE INDEX ixnomemedico ON medico(nome);
DROP view vwlistamedicopaciente;