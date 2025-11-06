-- Script SQL - Banco de Dados de Problemas em Imóveis Alugados (Votorantim)
-- Autor: ChatGPT
-- Versão: Português - 2025

CREATE TABLE Bairros (
    id_bairro SERIAL PRIMARY KEY,
    nome_bairro VARCHAR(100) NOT NULL
);

CREATE TABLE Imoveis (
    id_imovel SERIAL PRIMARY KEY,
    tipo_imovel VARCHAR(50) NOT NULL,
    id_bairro INT NOT NULL,
    FOREIGN KEY (id_bairro) REFERENCES Bairros(id_bairro)
);

CREATE TABLE Tipos_de_Problemas (
    id_tipo_problema SERIAL PRIMARY KEY,
    descricao_tipo VARCHAR(100) NOT NULL
);

CREATE TABLE Causas (
    id_causa SERIAL PRIMARY KEY,
    descricao_causa VARCHAR(100) NOT NULL
);

CREATE TABLE Responsaveis (
    id_responsavel SERIAL PRIMARY KEY,
    descricao_responsavel VARCHAR(100) NOT NULL
);

CREATE TABLE Problemas (
    id_problema SERIAL PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_tipo_problema INT NOT NULL,
    id_causa INT NOT NULL,
    id_responsavel INT NOT NULL,
    gravidade VARCHAR(20),
    frequencia VARCHAR(20),
    descricao_detalhada TEXT,
    tempo_medio_solucao_dias INT,
    FOREIGN KEY (id_imovel) REFERENCES Imoveis(id_imovel),
    FOREIGN KEY (id_tipo_problema) REFERENCES Tipos_de_Problemas(id_tipo_problema),
    FOREIGN KEY (id_causa) REFERENCES Causas(id_causa),
    FOREIGN KEY (id_responsavel) REFERENCES Responsaveis(id_responsavel)
);

CREATE TABLE Reparos (
    id_reparo SERIAL PRIMARY KEY,
    id_problema INT NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    custo_estimado DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (id_problema) REFERENCES Problemas(id_problema)
);
