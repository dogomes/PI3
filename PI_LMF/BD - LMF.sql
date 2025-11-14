DROP TABLE #Nomes;

-- Cria uma tabela temporária (SQL Server usa #)
CREATE TABLE #Nomes (
    id INT IDENTITY(1,1) PRIMARY KEY, -- IDENTITY é o equivalente a AUTO_INCREMENT no SQL Server
    nome_completo VARCHAR(150) NOT NULL
);

-- Insere os nomes solicitados
INSERT INTO #Nomes (nome_completo) VALUES
('Mariana Borges Curvêlo'),
('Pedro Valadares Junior');

-- Consulta e lista os nomes em ordem alfabética (ASC - Ascendente)
SELECT nome_completo
FROM #Nomes
ORDER BY nome_completo ASC;

-- Script DDL para o Banco de Dados Lógico
-- Dialeto: MySQL

-- -----------------------------------------------------
-- Tabela `Imovel`
-- -----------------------------------------------------
CREATE TABLE Imovel (
    cod_imovel INT NOT NULL,
    proprietario VARCHAR(100) NOT NULL,
    endereco_completo VARCHAR(255) NOT NULL,
    possivel_avaria VARCHAR(255),
    PRIMARY KEY (cod_imovel)
);

-- -----------------------------------------------------
-- Tabela `Avaria`
-- -----------------------------------------------------
CREATE TABLE Avaria (
    id_Avaria INT NOT NULL,
    cod_imovel INT NOT NULL, 
    locador VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    avaria TEXT NOT NULL,
    PRIMARY KEY (id_Avaria)
);

-- -----------------------------------------------------
-- Tabela `Locador`
-- -----------------------------------------------------
CREATE TABLE Locador (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone_contato VARCHAR(20),
    cod_imovel INT,   
    PRIMARY KEY (cpf)
);

-- -----------------------------------------------------
-- Tabela `Locatario`
-- -------------------------------------s----------------
CREATE TABLE Locatario (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cod_imovel INT,
    PRIMARY KEY (cpf)
);

-- -----------------------------------------------------
-- Tabela `Tipo_Estrutural`
-- -----------------------------------------------------
CREATE TABLE Tipo_Estrutural (
    Codigo INT NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    fk_Avaria_cod_imovel INT NOT NULL, 
    PRIMARY KEY (Codigo),
    FOREIGN KEY (fk_Avaria_cod_imovel)
        REFERENCES Avaria (id_Avaria)
);

-- -----------------------------------------------------
-- Tabela `Tipo_N_Estrutural`
-- -----------------------------------------------------
CREATE TABLE Tipo_N_Estrutural (
    Codigo INT NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    fk_Avaria_cod_imovel INT NOT NULL,
    PRIMARY KEY (Codigo),
    FOREIGN KEY (fk_Avaria_cod_imovel)
        REFERENCES Avaria (id_Avaria) 
);

-- -----------------------------------------------------
-- Tabela de Associação: `Imovel_Locador_Tem` (Imovel <-> Locador)
-- -----------------------------------------------------
CREATE TABLE Imovel_Locador_Tem (
    Cod INT NOT NULL,
    fk_Imovel_cod_imovel INT NOT NULL,
    fk_Locador_cpf VARCHAR(11) NOT NULL,
    PRIMARY KEY (fk_Imovel_cod_imovel, fk_Locador_cpf),
    FOREIGN KEY (fk_Imovel_cod_imovel)
        REFERENCES Imovel (cod_imovel),
    FOREIGN KEY (fk_Locador_cpf)
        REFERENCES Locador (cpf)
);

-- -----------------------------------------------------
-- Tabela de Associação: `Imovel_Locatario_Tem` (Imovel <-> Locatario)
-- -----------------------------------------------------
CREATE TABLE Imovel_Locatario_Tem (
    Cod INT NOT NULL,
    fk_Imovel_cod_imovel INT NOT NULL,
    fk_Locatario_cpf VARCHAR(11) NOT NULL,
    PRIMARY KEY (fk_Imovel_cod_imovel, fk_Locatario_cpf),
    FOREIGN KEY (fk_Imovel_cod_imovel)
        REFERENCES Imovel (cod_imovel),
    FOREIGN KEY (fk_Locatario_cpf)
        REFERENCES Locatario (cpf)
);

-- -----------------------------------------------------
-- Tabela de Associação: `E_Assoc_3_Relata_Re` (Locador <-> Avaria)
-- -----------------------------------------------------
CREATE TABLE E_Assoc_3_Relata_Re (
    fk_Locador_cpf VARCHAR(11) NOT NULL,
    fk_Avaria_cod_imovel INT NOT NULL,
    PRIMARY KEY (fk_Locador_cpf, fk_Avaria_cod_imovel),
    FOREIGN KEY (fk_Locador_cpf)
        REFERENCES Locador (cpf),
    FOREIGN KEY (fk_Avaria_cod_imovel)
        REFERENCES Avaria (id_Avaria)
);

-- -----------------------------------------------------
-- Tabela de Associação: `Possui` (Imovel <-> Avaria)
-- -----------------------------------------------------
CREATE TABLE Possui (
    fk_Avaria_cod_imovel INT NOT NULL,
    fk_Imovel_cod_imovel INT NOT NULL,
    PRIMARY KEY (fk_Avaria_cod_imovel, fk_Imovel_cod_imovel),
    FOREIGN KEY (fk_Avaria_cod_imovel)
        REFERENCES Avaria (id_Avaria),
    FOREIGN KEY (fk_Imovel_cod_imovel)
        REFERENCES Imovel (cod_imovel)
);

-- -----------------------------------------------------
-- Tabela de Associação: `Relata_Repara` (Locatario <-> Avaria)
-- -----------------------------------------------------
CREATE TABLE Relata_Repara (
    fk_Locatario_cpf VARCHAR(11) NOT NULL,
    fk_Avaria_cod_imovel INT NOT NULL,
    PRIMARY KEY (fk_Locatario_cpf, fk_Avaria_cod_imovel),
    FOREIGN KEY (fk_Locatario_cpf)
        REFERENCES Locatario (cpf),
    FOREIGN KEY (fk_Avaria_cod_imovel)
        REFERENCES Avaria (id_Avaria)
);