-- Arquivo de Configuração Inicial e Carga de Dados - Art-tech
-- Data: 18/05/2026

-- 1. Criação das Tabelas (Se não existirem)
CREATE TABLE IF NOT EXISTS fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_plataforma VARCHAR(50) DEFAULT 'Online'
);

CREATE TABLE IF NOT EXISTS insumos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    caracteristica_cor VARCHAR(50),
    preco_total_pago DECIMAL(10,2) NOT NULL,
    quantidade_comprada DECIMAL(10,2) NOT NULL,
    unidade_medida VARCHAR(20) NOT NULL,
    fornecedor_id INTEGER REFERENCES fornecedores(id),
    data_compra DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS ativos_ferramentas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_pago DECIMAL(10,2) NOT NULL,
    fornecedor_id INTEGER REFERENCES fornecedores(id),
    data_compra DATE DEFAULT CURRENT_DATE
);
