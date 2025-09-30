-- Esquema lógico para oficina
CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE OrdemServico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    id_veiculo INT,
    id_cliente INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE ItemOrdemServico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem_servico INT,
    id_servico INT,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_ordem_servico) REFERENCES OrdemServico(id),
    FOREIGN KEY (id_servico) REFERENCES Servico(id)
);

CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    funcao VARCHAR(50)
);

CREATE TABLE OrdemFuncionario (
    id_ordem_servico INT,
    id_funcionario INT,
    PRIMARY KEY (id_ordem_servico, id_funcionario),
    FOREIGN KEY (id_ordem_servico) REFERENCES OrdemServico(id),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id)
);
