-- Insere a matéria-prima exata das Notas Fiscais
INSERT INTO insumos (nome, caracteristica_cor, preco_total_pago, quantidade_comprada, unity_medida, fornecedor_id, data_compra) VALUES
('Barbante Número 4 Amazonia', 'Branco - 08', 22.95, 1.00, 'unidades', 1, '2026-05-18'),
('Kit 10 Fechos Mosquetão Cadeado', 'Gold', 15.75, 10.00, 'unidades', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 1', 18.05, 100.00, 'metros', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 2', 18.05, 100.00, 'metros', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 3', 18.05, 100.00, 'metros', 1, '2026-05-18'),
('Fio Náutico Rr-04 100m', 'Fio 4', 18.05, 100.00, 'metros', 1, '2026-05-18');

-- Compra de Fios Náuticos 3mm e Cola Silicone para Tecidos
-- Data: 07/07/2026

INSERT INTO insumos 
(nome, caracteristica_cor, preco_total_pago, quantidade_comprada, unidade_medida, fornecedor_id, data_compra)
VALUES
('Fio Náutico 3mm 100m', 'Branco', 21.79, 100.00, 'metros', 1, '2026-07-07'),
('Fio Náutico 3mm 100m', 'Preto', 21.79, 100.00, 'metros', 1, '2026-07-07'),
('Fio Náutico 3mm 100m', 'Azul Royal', 21.79, 100.00, 'metros', 1, '2026-07-07'),
('Cola Silicone para Tecidos', 'Transparente', 19.99, 1.00, 'unidade', 1, '2026-07-07');