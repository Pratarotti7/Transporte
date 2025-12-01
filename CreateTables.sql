-- ===============================
-- Tabela Marca Modelo
-- ===============================
CREATE TABLE marcamodelo (
    id_marca_modelo INT IDENTITY(1,1) PRIMARY KEY,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL
);

-- ===============================
-- Tabela VEICULO
-- ===============================
CREATE TABLE veiculo (
    id_veiculo INT IDENTITY(1,1) PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    id_marca_modelo INT NOT NULL,

    FOREIGN KEY (id_marca_modelo) REFERENCES marcamodelo(id_marca_modelo)
);

-- ===============================
-- Tabela TRANSPORTADORA
-- ===============================
CREATE TABLE transportadora (
    id_transportadora INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    endereco VARCHAR(50),
    email VARCHAR(40)
);


-- ===============================
-- Tabela MOTORISTA
-- ===============================
CREATE TABLE motorista (
    id_motorista INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    endereco VARCHAR(50),
    telefone VARCHAR(15) NOT NULL,
    cnh VARCHAR(15) NOT NULL,
    categoria VARCHAR(2),
    vencimento_cnh DATE,

    id_transportadora INT NOT NULL,
    id_veiculo INT NOT NULL,

    FOREIGN KEY (id_transportadora) REFERENCES transportadora(id_transportadora),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);


-- ===============================
-- Tabela EQUIPAMENTO
-- ===============================
CREATE TABLE equipamento (
    id_equpamento INT IDENTITY(1,1) PRIMARY KEY,
	id_motorista INT NOT NULL,
	id_veiculo INT NOT NULL,
	id_transportadora INT NOT NULL,

    FOREIGN KEY (id_motorista) REFERENCES motorista(id_motorista),
	FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
	FOREIGN KEY (id_transportadora) REFERENCES transportadora(id_transportadora)
    
);

