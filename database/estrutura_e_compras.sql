===========================================================
Projeto : Arte-Tech Data Management
Arquivo : estrutura_e_compras.sql
Autor   : Vania dos Santos
Data    : Julho/2026

Descrição:
Script responsável pela criação da estrutura inicial do
banco de dados da Arte-Tech e pelo registro das primeiras
compras de matéria-prima.

Objetivo:
Centralizar o controle de fornecedores, insumos,
ativos/ferramentas e produção das bolsas artesanais.

Tecnologias:
- PostgreSQL
- SQL

/*==========================================================
  CRIAÇÃO DAS TABELAS
==========================================================*/
/*----------------------------------------------------------
Tabela: fornecedores

Responsável por armazenar os fornecedores utilizados
pela Arte-Tech para aquisição de matérias-primas e
ferramentas.

Fornecedores cadastrados
- Mercado Livre
- Shopee
- Fabricantes
----------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_plataforma VARCHAR(50) DEFAULT 'Online'
);

/*----------------------------------------------------------
Tabela: insumos

Armazena todas as matérias-primas utilizadas na
produção das bolsas.

Exemplos:

- Fios
- Ferragens
- Alças
- Fechos
- Etiquetas

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

/*----------------------------------------------------------
Tabela: ativos_ferramentas

Controla os bens permanentes utilizados na produção.

Exemplos:

- Tesoura
- Alicate
- Agulhas
- Base de corte
----------------------------------------------------------*/
CREATE TABLE IF NOT EXISTS ativos_ferramentas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco_pago DECIMAL(10,2) NOT NULL,
    fornecedor_id INTEGER REFERENCES fornecedores(id),
    data_compra DATE DEFAULT CURRENT_DATE
);


/*----------------------------------------------------------
Tabela: producao_bolsas

Registra todas as bolsas produzidas,
permitindo futuramente calcular
custos, produtividade e lucro.

----------------------------------------------------------*/
-- 2. Carga de Dados Reais (Notas Fiscais de 18/05/2026)
/*==========================================================
INSERÇÃO DOS DADOS INICIAIS
==========================================================*/

-- Cadastra o fornecedor principal caso ainda não exista
INSERT INTO fornecedores (id, nome, tipo_plataforma) 
VALUES (1, 'Mercado Livre', 'Online / Full')
ON CONFLICT (id) DO NOTHING;

-- Insere o Kit de Ferramentas Real (Ativo fixo)
INSERT INTO ativos_ferramentas (nome, preco_pago, fornecedor_id, data_compra)
VALUES ('Kit Agulha Crochê Bordado Tesoura Fita - 53 Itens', 37.90, 1, '2026-05-18');

-- Insere a matéria-prima exata das Notas Fiscais
INSERT INTO insumos (nome, caracteristica_cor, preco_total_pago, quantidade_comprada, unity_medida, fornecedor_id, data_compra) VALUES
('Barbante Número 4 Amazonia', 'Branco - 08', 22.95, 1.00, 'unidades', 1, '2026-05-18'),
('Kit 10 Fechos Mosquetão Cadeado', 'Gold', 15.75, 10.00, 'unidades', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 1', 18.05, 100.00, 'metros', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 2', 18.05, 100.00, 'metros', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 3', 18.05, 100.00, 'metros', 1, '2026-05-18'),

/*----------------------------------------------------------
Primeiras compras registradas

Fornecedor:
Shopee

Data:
24/07/2026
----------------------------------------------------------*/
INSERT INTO insumos
(nome, caracteristica_cor, preco_total_pago, quantidade_comprada, unidade_medida, fornecedor_id)
VALUES
('Fio de Malha', 'Bordô', 9.26, 1, 'rolo', 2),
('Fio de Malha', 'Preto', 9.26, 1, 'rolo', 2),
('Fio de Malha', 'Roxo', 9.26, 1, 'rolo', 2),
('Fio de Malha', 'Marrom', 9.27, 1, 'rolo', 2),
('Fio Bella Trama', 'Vermelho', 17.99, 1, 'rolo', 2),
('Meia Argola', 'Dourada 20 mm', 9.40, 10, 'unidade', 2),
('Meia Argola', 'Prata 20 mm', 9.40, 10, 'unidade', 2);