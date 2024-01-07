-- Inserções para a tabela Usuario
INSERT INTO Usuario (nome_usuario, email, atividade)
VALUES ('AnaClara', 'AnaClara@example.com', 'S');

INSERT INTO Usuario (nome_usuario, email, atividade)
VALUES ('Virginia', 'Virginia@example.com', 'N');

INSERT INTO Usuario (nome_usuario, email, atividade)
VALUES ('JoaoPedro', 'JoaoPedro@example.com', 'S');

INSERT INTO Usuario (nome_usuario, email, atividade)
VALUES ('MariaAntonieta', 'MariaAntonieta@example.com', 'S');

INSERT INTO Usuario (nome_usuario, email, atividade)
VALUES ('Maethe', 'Maethe@example.com', 'N');


-- Inserções para a tabela Site
INSERT INTO Site (url, nome, dono)
VALUES ('http://inclusiotech.com', 'InclusioTech', 'Madalena');

INSERT INTO Site (url, nome, dono)
VALUES ('http://digitalforall.com', 'DigitalForAll', 'Wanderson');

INSERT INTO Site (url, nome, dono)
VALUES ('http://connect4everyone.com', 'Connect4Everyone', 'Jessica');

INSERT INTO Site (url, nome, dono)
VALUES ('http://acesstech.com', 'AcessTech', 'Cristina');

INSERT INTO Site (url, nome, dono)
VALUES ('http://empowerdigital.com', 'EmpowerDigital', 'Fabricio');


-- Inserções para a tabela User_Site
INSERT INTO User_Site (site, usuario, nota, comentario)
VALUES ('http://inclusiotech.com', 'AnaClara', 4.5, 'Ótimo site!');

INSERT INTO User_Site (site, usuario, nota, comentario)
VALUES ('http://digitalforall.com', 'Virginia', 3.2, 'Site mediano.');

INSERT INTO User_Site (site, usuario, nota, comentario)
VALUES ('http://connect4everyone.com', 'JoaoPedro', 4.8, 'Recomendo, muito bom!');

INSERT INTO User_Site (site, usuario, nota, comentario)
VALUES ('http://acesstech.com', 'MariaAntonieta', 2.5, 'Precisa melhorar.');

INSERT INTO User_Site (site, usuario, nota, comentario)
VALUES ('http://empowerdigital.com', 'Maethe', 5.0, 'Perfeito!');


-- Inserções para a tabela Cliente
INSERT INTO Cliente (email, tipo, nome, cnpj, cpf, genero)
VALUES ('karen@example.com', 'PF', 'Karen', NULL, '12345678910', 'M');

INSERT INTO Cliente (email, tipo, nome, cnpj, cpf, genero)
VALUES ('roberta@example.com', 'PJ', 'Roberta', '12345678000123', NULL, 'F');

INSERT INTO Cliente (email, tipo, nome, cnpj, cpf, genero)
VALUES ('vinicius@example.com', 'PF', 'Vinicius', NULL, '98765432110', 'M');

INSERT INTO Cliente (email, tipo, nome, cnpj, cpf, genero)
VALUES ('olivia@example.com', 'PJ', 'Olivia', '98765432000110', NULL, 'F');

INSERT INTO Cliente (email, tipo, nome, cnpj, cpf, genero)
VALUES ('pedropaulo@example.com', 'PF', 'Pedro Paulo', NULL, '11122233344', 'M');


-- Inserções para a tabela Telefones
INSERT INTO Telefones (cliente, telefone)
VALUES ('karen@example.com', '(11)9876-5432');

INSERT INTO Telefones (cliente, telefone)
VALUES ('roberta@example.com', '(22)1234-5678');

INSERT INTO Telefones (cliente, telefone)
VALUES ('vinicius@example.com', '(33)5555-5555');

INSERT INTO Telefones (cliente, telefone)
VALUES ('olivia@example.com', '(44)9999-8888');

INSERT INTO Telefones (cliente, telefone)
VALUES ('pedropaulo@example.com', '(55)7777-2222');


-- Inserções para a tabela Servico
INSERT INTO Servico (serv_cod, site, cliente, tipo, inicio, custo, preco, duracao)
VALUES (1, 'http://inclusiotech.com', 'karen@example.com', 'AVAL', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 100.00, 150.00, 10);

INSERT INTO Servico (serv_cod, site, cliente, tipo, inicio, custo, preco, duracao)
VALUES (2, 'http://digitalforall.com', 'roberta@example.com', 'ADAPT', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 200.00, 300.00, 20);

INSERT INTO Servico (serv_cod, site, cliente, tipo, inicio, custo, preco, duracao)
VALUES (3, 'http://connect4everyone.com', 'vinicius@example.com', 'AVAL', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 150.00, 200.00, 15);

INSERT INTO Servico (serv_cod, site, cliente, tipo, inicio, custo, preco, duracao)
VALUES (4, 'http://acesstech.com', 'olivia@example.com', 'ADAPT', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 250.00, 400.00, 30);

INSERT INTO Servico (serv_cod, site, cliente, tipo, inicio, custo, preco, duracao)
VALUES (5, 'http://empowerdigital.com', 'pedropaulo@example.com', 'AVAL', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 180.00, 250.00, 12);


-- Inserções para a tabela Adaptacao
INSERT INTO Adaptacao (servico)
VALUES (2);

INSERT INTO Adaptacao (servico)
VALUES (4);

INSERT INTO Adaptacao (servico)
VALUES (5);

INSERT INTO Adaptacao (servico)
VALUES (1);

INSERT INTO Adaptacao (servico)
VALUES (3);


-- Inserções para a tabela Avaliacao
INSERT INTO Avaliacao (servico)
VALUES (1);

INSERT INTO Avaliacao (servico)
VALUES (3);

INSERT INTO Avaliacao (servico)
VALUES (5);

INSERT INTO Avaliacao (servico)
VALUES (2);

INSERT INTO Avaliacao (servico)
VALUES (4);


-- Inserções para a tabela Desenvolvedor
INSERT INTO Desenvolvedor (cpf, nome, endereco, salario)
VALUES ('11122233344', 'Weverton', 'Rua A1, 123', 5000.00);

INSERT INTO Desenvolvedor (cpf, nome, endereco, salario)
VALUES ('22233344455', 'Mayke', 'Rua B1, 456', 6000.00);

INSERT INTO Desenvolvedor (cpf, nome, endereco, salario)
VALUES ('33344455566', 'Murillo', 'Rua C1, 789', 5500.00);

INSERT INTO Desenvolvedor (cpf, nome, endereco, salario)
VALUES ('44455566677', 'Gustavo', 'Rua D1, 012', 4800.00);

INSERT INTO Desenvolvedor (cpf, nome, endereco, salario)
VALUES ('55566677788', 'Piquerez', 'Rua E1, 345', 5200.00);


-- Inserções para a tabela Consultor
INSERT INTO Consultor (cpf, nome, endereco, salario)
VALUES ('22222233344', 'Gabriel', 'Rua A2, 123', 7000.00);

INSERT INTO Consultor (cpf, nome, endereco, salario)
VALUES ('33333344455', 'Rafael', 'Rua B2, 456', 8000.00);

INSERT INTO Consultor (cpf, nome, endereco, salario)
VALUES ('44444455566', 'Raphale', 'Rua C2, 789', 7500.00);

INSERT INTO Consultor (cpf, nome, endereco, salario)
VALUES ('55555566677', 'Eduardo', 'Rua D2, 012', 6800.00);

INSERT INTO Consultor (cpf, nome, endereco, salario)
VALUES ('66666677788', 'Arthur', 'Rua E2, 345', 7200.00);


-- Inserções para a tabela Testador
INSERT INTO Testador (cpf, nome, endereco)
VALUES ('11122244444', 'Rony', 'Rua A3, 123');

INSERT INTO Testador (cpf, nome, endereco)
VALUES ('22233355555', 'Endrick', 'Rua B3, 456');

INSERT INTO Testador (cpf, nome, endereco)
VALUES ('33344466666', 'Navarro', 'Rua C3, 789');

INSERT INTO Testador (cpf, nome, endereco)
VALUES ('44455577777', 'Vanderlan', 'Rua D3, 012');

INSERT INTO Testador (cpf, nome, endereco)
VALUES ('55566688888', 'Luan', 'Rua E3, 345');


-- Inserções para a tabela Pessoa_Func
INSERT INTO Pessoa_Func (pessoa_cpf, funcao)
VALUES ('11122233344', 'TE');

INSERT INTO Pessoa_Func (pessoa_cpf, funcao)
VALUES ('22233344455', 'DE');

INSERT INTO Pessoa_Func (pessoa_cpf, funcao)
VALUES ('33344455566', 'CO');

INSERT INTO Pessoa_Func (pessoa_cpf, funcao)
VALUES ('44455566677', 'DC');

INSERT INTO Pessoa_Func (pessoa_cpf, funcao)
VALUES ('55566677788', 'TE');


-- Inserções para a tabela Contribuicao
INSERT INTO Contribuicao (id, avaliacao, consultor, testador, data, gratificacao, nota, comentario)
VALUES (1, 1, '22222233344', '11122244444', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 100.00, 4.5, 'Ótimo trabalho!');

INSERT INTO Contribuicao (id, avaliacao, consultor, testador, data, gratificacao, nota, comentario)
VALUES (2, 2, '33333344455', '22233355555', TO_DATE('2023-06-11', 'YYYY-MM-DD'), 150.00, 3.2, 'Trabalho satisfatório.');

INSERT INTO Contribuicao (id, avaliacao, consultor, testador, data, gratificacao, nota, comentario)
VALUES (3, 3, '44444455566', '33344466666', TO_DATE('2023-06-12', 'YYYY-MM-DD'), 120.00, 4.8, 'Excelente colaboração!');

INSERT INTO Contribuicao (id, avaliacao, consultor, testador, data, gratificacao, nota, comentario)
VALUES (4, 4, '55555566677', '44455577777', TO_DATE('2023-06-13', 'YYYY-MM-DD'), 80.00, 2.5, 'Algumas falhas encontradas.');

INSERT INTO Contribuicao (id, avaliacao, consultor, testador, data, gratificacao, nota, comentario)
VALUES (5, 5, '66666677788', '55566688888', TO_DATE('2023-06-14', 'YYYY-MM-DD'), 200.00, 5.0, 'Trabalho impecável!');

-- Inserções para a tabela Problema
INSERT INTO Problema (contribuicao, tipo)
VALUES (1, 'Interfaces complexas e confusas');

INSERT INTO Problema (contribuicao, tipo)
VALUES (2, 'Falta de conteudo acessivel');

INSERT INTO Problema (contribuicao, tipo)
VALUES (3, 'Pouca enfase na interacao e participacao');

INSERT INTO Problema (contribuicao, tipo)
VALUES (4, 'Ausencia de opcoes de personalizacao');

INSERT INTO Problema (contribuicao, tipo)
VALUES (5, 'Falta de descricao adequada em videos');

-- Inserções para a tabela Mudança
INSERT INTO Mudanca (adaptacao, data, desenvolvedor, descricao)
VALUES (1, TO_DATE('2023-05-14', 'YYYY-MM-DD'), '11122233344', 'Adicao de design responsivo e acessivel');

INSERT INTO Mudanca (adaptacao, data, desenvolvedor, descricao)
VALUES (2, TO_DATE('2023-05-13', 'YYYY-MM-DD'), '22233344455', 'Recursos de recursos de audio e video acessiveis');

INSERT INTO Mudanca (adaptacao, data, desenvolvedor, descricao)
VALUES (3, TO_DATE('2023-05-12', 'YYYY-MM-DD'), '33344455566', 'Alteracao de controles de navegacao claros e intuitivos');

INSERT INTO Mudanca (adaptacao, data, desenvolvedor, descricao)
VALUES (4, TO_DATE('2023-05-11', 'YYYY-MM-DD'), '44455566677', 'Adicao de formularios acessiveis');

INSERT INTO Mudanca (adaptacao, data, desenvolvedor, descricao)
VALUES (5, TO_DATE('2023-05-10', 'YYYY-MM-DD'), '55566677788', 'Alteracao nos testes de usabilidade com pessoas com deficiencia');