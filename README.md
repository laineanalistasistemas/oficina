# Oficina Mecânica - Sistema de Banco de Dados

## Descrição
Este projeto apresenta o esquema lógico e físico de um banco de dados para gestão de uma oficina mecânica. O objetivo é organizar informações de clientes, veículos, serviços, ordens de serviço e funcionários, facilitando o controle operacional e administrativo.

## Estrutura do Banco de Dados
O banco de dados foi modelado para atender as principais necessidades de uma oficina:
- Cadastro de clientes e veículos
- Registro de serviços oferecidos
- Controle de ordens de serviço e itens
- Gestão de funcionários e alocação nas ordens

As principais tabelas são:
- **Cliente**
- **Veiculo**
- **Servico**
- **OrdemServico**
- **ItemOrdemServico**
- **Funcionario**
- **OrdemFuncionario**

O script profissional está em `schema_oficina_profissional.sql`.

## Como Executar o Script SQL
1. Instale um SGBD compatível (MySQL/MariaDB).
2. Importe o arquivo `schema_oficina_profissional.sql` usando seu cliente SQL ou linha de comando:
	 ```bash
	 mysql -u usuario -p < schema_oficina_profissional.sql
	 ```
3. O banco estará pronto para uso.

## Exemplos de Consultas
- Listar todos os clientes:
	```sql
	SELECT * FROM Cliente;
	```
- Consultar ordens de serviço abertas:
	```sql
	SELECT * FROM OrdemServico WHERE status = 'Aberta';
	```
- Ver serviços realizados por um funcionário:
	```sql
	SELECT f.nome, os.id, s.descricao
	FROM Funcionario f
	JOIN OrdemFuncionario of ON f.id = of.id_funcionario
	JOIN OrdemServico os ON of.id_ordem_servico = os.id
	JOIN ItemOrdemServico ios ON os.id = ios.id_ordem_servico
	JOIN Servico s ON ios.id_servico = s.id;
	```

## Autor
- Laine Analista de Sistemas

## Contato
- Email: seuemail@dominio.com
- LinkedIn: [Seu Perfil](https://www.linkedin.com)