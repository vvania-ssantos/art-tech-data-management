INSERT INTO fornecedores (id, nome, tipo_plataforma) 
VALUES (1, 'Mercado Livre', 'Online / Full')
ON CONFLICT (id) DO NOTHING;