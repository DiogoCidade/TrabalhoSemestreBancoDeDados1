/*CRIACAO BANCO DE DADOS*/
CREATE DATABASE mecanica;
USE mecanica;

/*CRIACAO TABELAS*/
CREATE TABLE cidade(
	id_cidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCidade VARCHAR(50),
    estado VARCHAR(2)
);

CREATE TABLE endereco(
	id_enderecoCEP BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(50),
    numero INT,
    bairro VARCHAR(50),
    id_cidade INT NOT NULL, CONSTRAINT id_cidade FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

CREATE TABLE lojaFornecedor(
	id_fornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFornecedor VARCHAR(50),
    id_endereco BIGINT NOT NULL, CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id_enderecoCEP)
);

CREATE TABLE fabricanteProduto(
	id_fabricanteProduto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFabricanteProduto VARCHAR(50)
);

CREATE TABLE produto_peca(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricaoProduto VARCHAR(50),
    id_fabricante INT NOT NULL, CONSTRAINT id_fabricante FOREIGN KEY (id_fabricante) REFERENCES fabricanteProduto(id_fabricanteProduto),
    valorUnidade DECIMAL(10,2),
    id_fornecedor INT NOT NULL, CONSTRAINT id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES lojaFornecedor(id_fornecedor),
    quantidadeEstoque INT
);

CREATE TABLE fabricanteCarro(
	id_fabricanteCarro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFabricanteCarro VARCHAR(50)
);

CREATE TABLE tipoVeiculo(
	id_tipoVeiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricaoTipo VARCHAR(50)
);

CREATE TABLE veiculo(
	id_veiculoPlaca VARCHAR(7) NOT NULL PRIMARY KEY,
    modelo VARCHAR(50),
	ano INT,
	id_fabricante INT NOT NULL, CONSTRAINT id_fabricante FOREIGN KEY (id_fabricante) REFERENCES fabricanteCarro(id_fabricanteCarro),
    corPredominante VARCHAR(50),
	id_tipoVeiculo INT NOT NULL, CONSTRAINT id_tipoVeiculo FOREIGN KEY (id_tipoVeiculo) REFERENCES tipoVeiculo(id_tipoVeiculo)
);

CREATE TABLE funcao(
	id_funcao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricaoFuncao VARCHAR(50)
);

CREATE TABLE pessoa(
	id_pessoaCPF VARCHAR(11) NOT NULL PRIMARY KEY,
    nomePessoa VARCHAR(50),
    id_funcao INT NOT NULL, CONSTRAINT id_funcao FOREIGN KEY (id_funcao) REFERENCES funcao(id_funcao),
    contato VARCHAR(11),
    id_endereco BIGINT NOT NULL, CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id_enderecoCEP)
);

CREATE TABLE servico(
	id_servico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricaoServico VARCHAR(50)
);

CREATE TABLE notaFiscal(
	id_notaFiscal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_nf DATE,
    id_servico INT NOT NULL, CONSTRAINT id_servico FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    id_funcionario VARCHAR(11) NOT NULL, CONSTRAINT id_funcionario FOREIGN KEY (id_funcionario) REFERENCES pessoa(id_pessoaCPF),
    valorServico INT,
    id_pecaProduto INT NOT NULL, CONSTRAINT id_pecaProduto FOREIGN KEY (id_pecaProduto) REFERENCES produto_peca(id_produto),
    quantidadeProduto INT,
    id_cliente VARCHAR(11) NOT NULL, CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES pessoa(id_pessoaCPF),
    id_veiculo VARCHAR(7) NOT NULL, CONSTRAINT id_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    valorTotal DECIMAL(10,2)
);

/*PEQUENO ALTER TABLE*/
ALTER TABLE veiculo ADD COLUMN id_dono VARCHAR(11) NOT NULL;
ALTER TABLE veiculo ADD CONSTRAINT id_dono FOREIGN KEY (id_dono) REFERENCES pessoa(id_pessoaCPF);

/*CADASTRO DE DADOS PADRAO*/
INSERT INTO cidade VALUES (0,'Erechim','RS');
INSERT INTO cidade VALUES (0,'Passo Fundo','RS');
INSERT INTO cidade VALUES (0,'Chapeco','SC');
SELECT * FROM cidade;

INSERT INTO endereco VALUES (99700392,'Valentim Zambonatto', 181, 'Centro', 1);
INSERT INTO endereco VALUES (99700076,'Aratiba', 84, 'Centro', 1);
INSERT INTO endereco VALUES (99701764,'Pernambuco', 1700, 'Linho', 1);
SELECT * FROM endereco;

INSERT INTO funcao VALUES (0,'Cliente');
INSERT INTO funcao VALUES (0,'Mecanico');
INSERT INTO funcao VALUES (0,'Pintor');
INSERT INTO funcao VALUES (0,'Limpador');
INSERT INTO funcao VALUES (0,'Gerente');
INSERT INTO funcao VALUES (0,'Atendente');
SELECT * FROM funcao;

INSERT INTO servico VALUES (0,'Pintura');
INSERT INTO servico VALUES (0,'TrocaVelas');
INSERT INTO servico VALUES (0,'TrocaInjetores');
INSERT INTO servico VALUES (0,'TrocaCarburador');
INSERT INTO servico VALUES (0,'TrocaOleo');
INSERT INTO servico VALUES (0,'TrocaSuspensao');
INSERT INTO servico VALUES (0,'Retifica');
SELECT * FROM servico;

INSERT INTO fabricanteProduto VALUES (0,'Bosch');
INSERT INTO fabricanteProduto VALUES (0,'Eibach');
INSERT INTO fabricanteProduto VALUES (0,'Webber');
INSERT INTO fabricanteProduto VALUES (0,'Mobil1');
INSERT INTO fabricanteProduto VALUES (0,'Petrobras');
INSERT INTO fabricanteProduto VALUES (0,'Lazzudur');
SELECT * FROM fabricanteProduto;

INSERT INTO lojaFornecedor VALUES (0,'Soccol Barbieri', 1);
INSERT INTO lojaFornecedor VALUES (0,'AutoEsporte', 2);
INSERT INTO lojaFornecedor VALUES (0,'IMParts', 3);
SELECT * FROM lojaFornecedor;

INSERT INTO produto_peca VALUES (0,'Tinta', 6, 150.00, 1, 50);
INSERT INTO produto_peca VALUES (0,'Vela', 1, 90.00, 3, 100);
INSERT INTO produto_peca VALUES (0,'Injetor', 1, 190.00, 3, 100);
INSERT INTO produto_peca VALUES (0,'Carburador', 3, 1000.00, 2, 10);
INSERT INTO produto_peca VALUES (0,'Oleo', 4, 100.00, 2, 50);
INSERT INTO produto_peca VALUES (0,'Suspensao', 2, 1800.00, 1, 10);
SELECT * FROM produto_peca;

INSERT INTO tipoVeiculo VALUES (0,'Carro');
INSERT INTO tipoVeiculo VALUES (0,'Caminhonete');
INSERT INTO tipoVeiculo VALUES (0,'Van');
INSERT INTO tipoVeiculo VALUES (0,'Moto');
SELECT * FROM tipoVeiculo;

INSERT INTO fabricanteCarro VALUES (0,'Chevrolet');
INSERT INTO fabricanteCarro VALUES (0,'Volkswagen');
INSERT INTO fabricanteCarro VALUES (0,'FIAT');
INSERT INTO fabricanteCarro VALUES (0,'Ford');
INSERT INTO fabricanteCarro VALUES (0,'Toyota');
INSERT INTO fabricanteCarro VALUES (0,'Peugeot');
INSERT INTO fabricanteCarro VALUES (0,'RAM');
SELECT * FROM fabricanteCarro;

/*//////////////////CADASTRO DE FUNCIONARIO//////////////////*/

INSERT INTO endereco VALUES (99704080,'Sergipe', 1080, 'Bela Vista', 1);
INSERT INTO pessoa VALUES  ('45681235019', 'Marcio', 2, 54935421978, 99704080);

INSERT INTO endereco VALUES (99700290,'Santa Catarina', 70, 'Centro', 1);
INSERT INTO pessoa VALUES  ('75964156034', 'Fernando', 5, 54999567312, 99700290);

INSERT INTO endereco VALUES (99704500,'Guaporé', 310, 'Centro', 1);
INSERT INTO pessoa VALUES ('32569841077', 'Leonardo', 3, 54991234567, 99704500);

INSERT INTO endereco VALUES (99705010,'Anchieta', 150, 'Fátima', 1);
INSERT INTO pessoa VALUES ('88912345001', 'Marina', 6, 54999887766, 99705010);

/*//////////////////CADASTRO DE CLIENTE//////////////////*/

INSERT INTO endereco VALUES (99700070,'Gaurama', 444, 'Centro', 1);
INSERT INTO pessoa VALUES  ('75348919006', 'Roger', 1, 54997534591, 99700070);
INSERT INTO veiculo VALUES ('IPG2256', 'Uno', 2015, 3, 'Branco', 1, 75348919006);

INSERT INTO endereco VALUES (99707020,'Santamento do Livrantana', 999, 'Centro', 1);
INSERT INTO pessoa VALUES ('10293847066', 'Carlos', 1, 54998456871, 99707020);
INSERT INTO veiculo VALUES ('IPN4987', 'Golf', 2013, 2, 'Prata', 1, '10293847066');

INSERT INTO endereco VALUES (99706630,'Floriano Peixoto', 233, 'Centro', 1);
INSERT INTO pessoa VALUES ('98744561036', 'Isabela', 1, 5496878451, 99706630);
INSERT INTO veiculo VALUES ('IRT3549', 'RAM', 2020, 7, 'Preto', 2, '98744561036');

INSERT INTO endereco VALUES (99700010,'Aratiba', 880, 'Jardim', 1);
INSERT INTO pessoa VALUES ('05801128026', 'Ricardo', 1, 54999909192, 99700010);
INSERT INTO veiculo VALUES ('ACF1969', 'Opala', 2018, 1, 'Preto', 1, '05801128026');

INSERT INTO endereco VALUES (99706660,'Nonoai', 44, 'Centro', 1);
INSERT INTO pessoa VALUES ('98756159045', 'Rochele', 1, 54997441522, 99706660);
INSERT INTO veiculo VALUES ('JGM5105', '208', 2019, 6, 'Vermelho', 1, '98756159045');

SELECT * FROM pessoa;
SELECT * FROM veiculo;
SELECT * FROM endereco;

/*//////////////////EXECUCAO DE UM SERVICO//////////////////*/
INSERT INTO notaFiscal VALUES (0,'2025-11-23', 2,'45681235019', 100.00, 2, 4,'75348919006','IPG2256', 450.00);
INSERT INTO notaFiscal VALUES (0,'2025-11-25', 2, '45681235019', 120.00, 2, 4, '10293847066', 'IPN4987', 480.00);
INSERT INTO notaFiscal VALUES (0,'2025-12-01', 1, '32569841077', 2500.00, 1, 4, '98744561036', 'IRT3549', 3100.00);
INSERT INTO notaFiscal VALUES (0,'2025-11-27', 5, '32569841077', 80.00, 5, 4, '05801128026', 'ACF1969', 480.00);
INSERT INTO notaFiscal VALUES (0,'2025-11-28', 6, '88912345001', 300.00, 6, 1, '98756159045', 'JGM5105', 2100.00);
SELECT * FROM notaFiscal;

/*//////////////////10 UPDATE//////////////////*/
DELETE FROM notaFiscal WHERE id_notaFiscal = 2; -- NOTA REPETIDA
UPDATE veiculo SET ano = '1979' WHERE modelo = 'Opala';
UPDATE veiculo SET modelo = 'Gol' WHERE id_dono = '10293847066';
UPDATE fabricanteCarro SET nomeFabricanteCarro = "Dodge" WHERE id_fabricanteCarro = 7;
UPDATE endereco SET rua = 'Guapore' WHERE bairro = 'Fátima';
UPDATE endereco SET bairro = 'Fatima' WHERE rua = 'Guapore';
UPDATE endereco SET id_cidade = 2 WHERE rua = 'Nonoai';
UPDATE endereco SET id_cidade = 2 WHERE rua = 'Guapore';
UPDATE endereco SET id_cidade = 3 WHERE rua = 'Santa Catarina';
UPDATE endereco SET id_cidade = 2 WHERE rua = 'Nonoai';
UPDATE fabricanteProduto SET nomeFabricanteProduto = "PPG" WHERE id_fabricanteProduto = 6;
UPDATE lojafornecedor SET id_endereco = 99700392 WHERE id_endereco = 1;
UPDATE lojafornecedor SET id_endereco = 99700076 WHERE id_endereco = 2;
UPDATE lojafornecedor SET id_endereco = 99701764 WHERE id_endereco = 3;
/*//////////////////UPDATEs PRA CORRIGIR UPDATES ERRADOS//////////////////*/
UPDATE endereco SET bairro = 'Dorneles' WHERE rua = 'Guaporé';
UPDATE endereco SET rua = 'Anchieta' WHERE bairro = 'Dorneles';

/*//////////////////10 SELECT (LIKE, BETWEEN, IN, ORDER BY)//////////////////*/
SELECT id_notaFiscal, valorServico FROM notaFiscal WHERE valorServico BETWEEN 100 AND 300;
SELECT nomePessoa, id_funcao FROM pessoa WHERE id_funcao IN (2, 3);
SELECT nomePessoa FROM pessoa WHERE nomePessoa LIKE 'R%';
SELECT nomePessoa FROM pessoa ORDER BY nomePessoa ASC;
SELECT nomePessoa FROM pessoa ORDER BY nomePessoa DESC;
SELECT id_veiculoPlaca, modelo FROM veiculo WHERE corPredominante = 'Preto';
SELECT rua FROM endereco WHERE id_enderecoCEP LIKE '99700%';
SELECT rua FROM endereco WHERE id_enderecoCEP LIKE '99704%';

/*//////////////////GROUP BY//////////////////*/
SELECT servico.descricaoServico, SUM(notafiscal.valorTotal) 
FROM notaFiscal 
INNER JOIN servico 
ON notafiscal.id_servico = servico.id_servico
GROUP BY servico.descricaoServico
ORDER BY SUM(notafiscal.valorTotal);

SELECT cidade.nomeCidade, COUNT(endereco.id_enderecoCEP) 
FROM cidade 
INNER JOIN endereco 
ON cidade.id_cidade = endereco.id_cidade
GROUP BY cidade.nomeCidade;

SELECT estado, COUNT(nomeCidade) 
FROM cidade
GROUP BY estado;

SELECT fabricantecarro.nomeFabricanteCarro, SUM(notafiscal.valorServico) 
FROM veiculo 
INNER JOIN fabricantecarro 
ON veiculo.id_fabricante = fabricantecarro.id_fabricanteCarro
INNER JOIN notafiscal
ON veiculo.id_veiculoPlaca = notafiscal.id_veiculo
GROUP BY fabricantecarro.nomeFabricanteCarro
ORDER BY notafiscal.valorServico;

SELECT lojafornecedor.nomeFornecedor, SUM(produto_peca.valorUnidade) 
FROM lojafornecedor 
INNER JOIN produto_peca 
ON lojafornecedor.id_fornecedor = produto_peca.id_fornecedor
GROUP BY lojafornecedor.nomeFornecedor
ORDER BY SUM(produto_peca.valorUnidade);

SELECT funcao.descricaoFuncao, COUNT(pessoa.id_pessoaCPF)
FROM funcao
INNER JOIN pessoa
ON funcao.id_funcao = pessoa.id_funcao
GROUP BY funcao.descricaoFuncao;

/*//////////////////INNER E LEFT JOIN//////////////////*/
/*//////////////////CLIENTES//////////////////*/
SELECT pessoa.nomePessoa, funcao.descricaoFuncao 
FROM pessoa 
INNER JOIN funcao 
ON pessoa.id_funcao = funcao.id_funcao 
WHERE funcao.descricaoFuncao = 'Cliente';

/*//////////////////FUNCIONARIOS//////////////////*/
SELECT pessoa.nomePessoa, funcao.descricaoFuncao 
FROM pessoa 
INNER JOIN funcao 
ON pessoa.id_funcao = funcao.id_funcao 
WHERE funcao.descricaoFuncao 
NOT LIKE 'Cliente';

/*//////////////////VEICULOS//////////////////*/
SELECT veiculo.id_veiculoPlaca, veiculo.modelo, veiculo.ano, 
fabricantecarro.nomeFabricanteCarro, pessoa.nomePessoa 
FROM veiculo 
INNER JOIN fabricantecarro 
ON veiculo.id_fabricante = fabricantecarro.id_fabricanteCarro 
INNER JOIN pessoa 
ON veiculo.id_dono = pessoa.id_pessoaCPF;

SELECT veiculo.id_veiculoPlaca, veiculo.modelo, veiculo.ano, 
pessoa.nomePessoa, funcao.descricaoFuncao 
FROM pessoa 
LEFT JOIN veiculo 
ON veiculo.id_dono = pessoa.id_pessoaCPF 
INNER JOIN funcao 
ON pessoa.id_funcao = funcao.id_funcao 
ORDER BY funcao.descricaoFuncao ASC;

/*//////////////////PRODUTOS//////////////////*/
SELECT fabricanteproduto.nomeFabricanteProduto, produto_peca.descricaoProduto, 
produto_peca.valorUnidade, lojafornecedor.nomeFornecedor 
FROM fabricanteproduto 
INNER JOIN produto_peca 
ON fabricanteproduto.id_fabricanteProduto = produto_peca.id_fabricante 
INNER JOIN lojafornecedor 
ON produto_peca.id_fornecedor = lojafornecedor.id_fornecedor;

/*//////////////////NOTA FISCAL FINAL//////////////////*/
SELECT notafiscal.id_notaFiscal, notafiscal.data_nf, servico.descricaoServico,
pessoaFuncionario.nomePessoa AS funcionario, notafiscal.valorServico, fabricanteproduto.nomeFabricanteProduto, 
produto_peca.descricaoProduto, notafiscal.quantidadeProduto, pessoaCliente.nomePessoa AS cliente,
fabricantecarro.nomeFabricanteCarro, veiculo.modelo, veiculo.ano, notafiscal.valorTotal
FROM notafiscal
INNER JOIN servico
ON notafiscal.id_servico = servico.id_servico
INNER JOIN pessoa pessoaFuncionario
ON notafiscal.id_funcionario = pessoaFuncionario.id_pessoaCPF
INNER JOIN pessoa pessoaCliente
ON notafiscal.id_cliente = pessoaCliente.id_pessoaCPF
INNER JOIN produto_peca
ON notafiscal.id_pecaProduto = produto_peca.id_produto
INNER JOIN fabricanteproduto
ON produto_peca.id_fabricante = fabricanteproduto.id_fabricanteProduto
INNER JOIN veiculo
ON notafiscal.id_veiculo = veiculo.id_veiculoPlaca
INNER JOIN fabricantecarro
ON veiculo.id_fabricante = fabricantecarro.id_fabricanteCarro
ORDER BY notafiscal.data_nf;