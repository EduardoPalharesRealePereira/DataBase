#Sistema de Banco de Dados para Olimpíadas#
Este projeto visa criar um sistema de banco de dados para gerenciar informações relacionadas a eventos olímpicos. O banco de dados foi projetado para armazenar dados sobre atletas, competições, eventos, estádios, árbitros, ingressos, torcedores e comitês olímpicos, garantindo integridade e eficiência na manipulação dessas informações.

Estrutura do Banco de Dados
O banco de dados consiste nas seguintes tabelas:

Atletas
Arbitros
Arbitragem
ComiteOlimpicoInternacional
ComiteOlimpicoNacional
Competicoes
Escalacao
Esportes
Estadios
Eventos
Ingressos
Modalidades
Torcedores
Definições das Tabelas
Tabela Atletas
sql
Copiar código
CREATE TABLE Atletas (
    num_passaporte_atleta VARCHAR(50) PRIMARY KEY,
    tipo_sanguineo VARCHAR(3),
    altura DECIMAL(5,2),
    nome VARCHAR(100),
    data_nasc DATE,
    sexo VARCHAR(10),
    peso DECIMAL(5,2),
    nacionalidade VARCHAR(50),
    id_con INT,
    FOREIGN KEY (id_con) REFERENCES ComiteOlimpicoNacional(id_con)
);
Tabela Arbitros
sql
Copiar código
CREATE TABLE Arbitros (
    num_passaporte_arbitro VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(100),
    sexo VARCHAR(10),
    nacionalidade VARCHAR(50),
    data_nasc DATE
);
Tabela Arbitragem
sql
Copiar código
CREATE TABLE Arbitragem (
    id_arbitragem INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    num_passaporte_arbitro VARCHAR(50),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (num_passaporte_arbitro) REFERENCES Arbitros(num_passaporte_arbitro)
);
Tabela ComiteOlimpicoInternacional
sql
Copiar código
CREATE TABLE ComiteOlimpicoInternacional (
    id_coi INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
Tabela ComiteOlimpicoNacional
sql
Copiar código
CREATE TABLE ComiteOlimpicoNacional (
    id_con INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_coi INT,
    FOREIGN KEY (id_coi) REFERENCES ComiteOlimpicoInternacional(id_coi)
);
Tabela Competicoes
sql
Copiar código
CREATE TABLE Competicoes (
    id_competicao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    ano YEAR,
    cidade VARCHAR(50),
    pais VARCHAR(50)
);
Tabela Escalacao
sql
Copiar código
CREATE TABLE Escalacao (
    id_escalacao INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    num_passaporte_atleta VARCHAR(50),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (num_passaporte_atleta) REFERENCES Atletas(num_passaporte_atleta)
);
Tabela Esportes
sql
Copiar código
CREATE TABLE Esportes (
    id_esporte INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);
Tabela Estadios
sql
Copiar código
CREATE TABLE Estadios (
    id_estadio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    local VARCHAR(100),
    capacidade INT,
    id_coi INT,
    FOREIGN KEY (id_coi) REFERENCES ComiteOlimpicoInternacional(id_coi)
);
Tabela Eventos
sql
Copiar código
CREATE TABLE Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    local VARCHAR(100),
    data DATE,
    hora_inicio TIME,
    hora_fim TIME,
    id_modalidade INT,
    id_estadio INT,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidades(id_modalidade),
    FOREIGN KEY (id_estadio) REFERENCES Estadios(id_estadio)
);
Tabela Ingressos
sql
Copiar código
CREATE TABLE Ingressos (
    id_ingresso INT PRIMARY KEY AUTO_INCREMENT,
    num_assento INT,
    preco DECIMAL(10,2),
    setor VARCHAR(50),
    id_evento INT,
    num_passaporte_torcedor VARCHAR(50),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (num_passaporte_torcedor) REFERENCES Torcedores(num_passaporte_torcedor)
);
Tabela Modalidades
sql
Copiar código
CREATE TABLE Modalidades (
    id_modalidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    tipo VARCHAR(50),
    sexo VARCHAR(10),
    id_esporte INT,
    FOREIGN KEY (id_esporte) REFERENCES Esportes(id_esporte)
);
Tabela Torcedores
sql
Copiar código
CREATE TABLE Torcedores (
    num_passaporte_torcedor VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(100),
    num_cartao VARCHAR(20),
    endereco VARCHAR(100),
    pais VARCHAR(50)
);
Índices e Views
Índices
sql
Copiar código
CREATE INDEX idx_ingressos_setor_preco ON Ingressos(setor, preco);
CREATE INDEX idx_esportes_nome ON Esportes(nome);
Views
sql
Copiar código
CREATE VIEW IngressosMaisVendidos AS
SELECT local, COUNT(id_ingresso) AS tot_ingressos
FROM Eventos AS e
JOIN Ingressos AS i ON e.id_evento = i.id_evento
GROUP BY local
ORDER BY tot_ingressos DESC;

CREATE VIEW AtletasPorNacionalidade AS
SELECT COUNT(num_passaporte_atleta) AS total_atletas, nacionalidade
FROM Atletas
GROUP BY nacionalidade;
Consultas SQL
a) Seleção de Ingressos com Detalhes de Evento e Torcedor, Ordenados por Preço
sql
Copiar código
SELECT
    Ingressos.id_ingresso,
    Ingressos.num_assento,
    Ingressos.preco,
    Ingressos.setor,
    Eventos.local AS local_evento,
    Eventos.data AS data_evento,
    Torcedores.nome AS nome_torcedor,
    Torcedores.pais AS pais_torcedor
FROM
    Ingressos
JOIN
    Eventos ON Ingressos.id_evento = Eventos.id_evento
JOIN
    Torcedores ON Ingressos.num_passaporte_torcedor = Torcedores.num_passaporte_torcedor
ORDER BY
    Ingressos.preco DESC;
b) Seleção de Ingressos com Detalhes de Evento e Torcedor, Filtrados por Preço e Ordenados por Preço
sql
Copiar código
SELECT
    Ingressos.id_ingresso,
    Ingressos.num_assento,
    Ingressos.preco,
    Ingressos.setor,
    Eventos.local AS local_evento,
    Eventos.data AS data_evento,
    Torcedores.nome AS nome_torcedor,
    Torcedores.pais AS pais_torcedor
FROM
    Ingressos
JOIN
    Eventos ON Ingressos.id_evento = Eventos.id_evento
JOIN
    Torcedores ON Ingressos.num_passaporte_torcedor = Torcedores.num_passaporte_torcedor
WHERE
    Ingressos.preco > 100.00
ORDER BY
    Ingressos.preco DESC;
c) Seleção de Atletas com Detalhes de Comitê Olímpico Nacional e Internacional, Filtrados por Nome com LIKE
sql
Copiar código
SELECT
    Atletas.nome AS nome_atleta,
    Atletas.nacionalidade,
    Atletas.altura,
    Atletas.peso,
    ComiteOlimpicoNacional.nome AS nome_con,
    ComiteOlimpicoInternacional.id_coi
FROM
    Atletas
JOIN
    ComiteOlimpicoNacional ON Atletas.id_con = ComiteOlimpicoNacional.id_con
JOIN
    ComiteOlimpicoInternacional ON ComiteOlimpicoNacional.id_coi = ComiteOlimpicoInternacional.id_coi
WHERE
    Atletas.nome LIKE 'Maria%'
ORDER BY
    Atletas.nome;
d) Seleção de Eventos com Detalhes de Estádio e Modalidades, Filtrados por Localidade e Validade do Estádio
sql
Copiar código
SELECT
    Eventos.id_evento,
    Eventos.local,
    Eventos.data,
    Estadios.nome AS nome_estadio,
    Estadios.local AS local_estadio,
    Modalidades.nome AS nome_modalidade,
    Modalidades.tipo AS tipo_modalidade
FROM
    Eventos
LEFT JOIN
    Estadios ON Eventos.id_estadio = Estadios.id_estadio
JOIN
    Modalidades ON Eventos.id_modalidade = Modalidades.id_modalidade
WHERE
    Eventos.local IN ('Rio de Janeiro', 'Brasília')
    AND Estadios.id_estadio IS NOT NULL
ORDER BY
    Eventos.data;
e) Seleção da Altura Média dos Atletas por Nacionalidade, Ordenados por Altura Média
sql
Copiar código
SELECT
    Atletas.nacionalidade,
    AVG(Atletas.altura) AS altura_media
FROM
    Atletas
JOIN
    ComiteOlimpicoNacional ON Atletas.id_con = ComiteOlimpicoNacional.id_con
GROUP BY
    Atletas.nacionalidade
ORDER BY
    altura_media DESC;

Ferramentas Utilizadas
SGBD (Sistema de Gerenciamento de Banco de Dados): MySQL
Ferramenta de Modelagem: MySQL Workbench
Linguagem de Programação: SQL para scripts de criação e manipulação do banco de dados

Conclusão
Este projeto de banco de dados para um sistema de Olimpíadas proporciona uma base robusta e eficiente para a gestão de informações complexas e variadas relacionadas a eventos esportivos. A modelagem cuidadosa e a implementação das consultas e índices garantem a integridade dos dados e a performance nas operações de leitura e escrita.
