-- =====================================================
-- Script de Criação do Banco de Dados: Oficina Mecânica
-- Autor: laineanalistasistemas
-- Data: 30/09/2025
-- Descrição: Esquema lógico profissional para oficina
-- =====================================================

-- ===================== Tabela Cliente =====================
CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    CONSTRAINT uq_cliente_email UNIQUE (email)
);

-- ===================== Tabela Veiculo =====================
CREATE TABLE Veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT CHECK (ano >= 1900 AND ano <= YEAR(CURDATE())),
    id_cliente INT NOT NULL,
    CONSTRAINT uq_veiculo_placa UNIQUE (placa),
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ===================== Tabela Servico =====================
CREATE TABLE Servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0)
);

-- ===================== Tabela OrdemServico =====================
CREATE TABLE OrdemServico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    id_veiculo INT NOT NULL,
    id_cliente INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Aberta',
    CONSTRAINT fk_ordem_veiculo FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ordem_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ===================== Tabela ItemOrdemServico =====================
CREATE TABLE ItemOrdemServico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem_servico INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario >= 0),
    CONSTRAINT fk_item_ordem FOREIGN KEY (id_ordem_servico) REFERENCES OrdemServico(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_item_servico FOREIGN KEY (id_servico) REFERENCES Servico(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ===================== Tabela Funcionario =====================
CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    funcao VARCHAR(50) NOT NULL
);

-- ===================== Tabela OrdemFuncionario =====================
CREATE TABLE OrdemFuncionario (
    id_ordem_servico INT NOT NULL,
    id_funcionario INT NOT NULL,
    PRIMARY KEY (id_ordem_servico, id_funcionario),
    CONSTRAINT fk_ordem_funcionario_ordem FOREIGN KEY (id_ordem_servico) REFERENCES OrdemServico(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ordem_funcionario_func FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ===================== Índices Extras =====================
CREATE INDEX idx_cliente_nome ON Cliente(nome);
CREATE INDEX idx_veiculo_modelo ON Veiculo(modelo);
CREATE INDEX idx_ordem_data ON OrdemServico(data);
