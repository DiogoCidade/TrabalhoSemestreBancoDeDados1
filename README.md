# 🛠 Banco de Dados – Sistema para Mecânica Automotiva

Projeto acadêmico desenvolvido com foco em modelagem e implementação de banco de dados relacional, simulando o funcionamento de uma mecânica automotiva.

O sistema foi construído inteiramente em SQL, contemplando desde a criação do banco até consultas complexas para geração de relatórios.

---

## 🎯 Objetivo

Aplicar conceitos de:

- Modelagem de banco de dados
- Relacionamentos entre entidades
- Chaves primárias e estrangeiras
- Integridade referencial
- Manipulação de dados (INSERT, UPDATE, DELETE)
- Consultas avançadas com JOIN e GROUP BY

---

## 🗂 Estrutura do Banco

O banco `mecanica` contém as seguintes entidades principais:

- Cidade
- Endereço
- Pessoa (clientes e funcionários)
- Função
- Veículo
- Fabricante de Carro
- Fabricante de Produto
- Produto/Peça
- Fornecedor
- Serviço
- Nota Fiscal

O modelo simula:

- Cadastro de clientes e funcionários
- Registro de veículos
- Controle de peças e fornecedores
- Execução de serviços
- Emissão de nota fiscal
- Relatórios financeiros

---

## 🛠 Tecnologias Utilizadas

- MySQL
- SQL
- Modelagem Relacional

---

## 📊 Funcionalidades Implementadas

### ✔ Criação da Estrutura
- CREATE DATABASE
- CREATE TABLE
- FOREIGN KEY
- ALTER TABLE

### ✔ Manipulação de Dados
- INSERT
- UPDATE
- DELETE

### ✔ Consultas
- SELECT
- LIKE
- BETWEEN
- IN
- ORDER BY
- GROUP BY
- INNER JOIN
- LEFT JOIN

### ✔ Relatório Final
Consulta completa de Nota Fiscal contendo:

- Serviço executado
- Funcionário responsável
- Cliente
- Veículo
- Produto utilizado
- Fabricante
- Valor do serviço
- Valor total

---

## ▶ Como Executar

1. Abrir o MySQL Workbench (ou outro gerenciador SQL).
2. Executar o script completo.
3. O banco `mecanica` será criado automaticamente.
4. As tabelas e dados padrão serão inseridos.
5. Executar as consultas para visualizar relatórios.

---

## 📚 Contexto Acadêmico

Projeto desenvolvido como atividade prática para consolidar conhecimentos em banco de dados relacional, aplicando estruturação completa de um sistema com múltiplos relacionamentos e consultas avançadas.
