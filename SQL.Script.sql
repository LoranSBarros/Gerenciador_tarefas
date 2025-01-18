--Tabela 'projetos'

CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY
    ,nome NVARCHAR(255)
    ,descricao NVARCHAR(500)
    ,data_criacao DATETIME
);


INSERT INTO projetos (id_projeto, nome, descricao, data_criacao)
VALUES 
(1, 'Desenvolvimento de Sistema de E-commerce', 'Projeto para criar um sistema de e-commerce robusto com integra��o de pagamento e carrinho de compras.', '2025-01-12 17:53:09.043'),
(2, 'Aplicativo de Sa�de', 'Aplicativo para acompanhamento de sa�de, com recursos de monitoramento de atividades f�sicas e alimenta��o.', '2025-01-12 17:53:09.047'),
(3, 'Sistema de Gest�o de Recursos Humanos', 'Sistema para gerenciar dados de funcion�rios, folha de pagamento, benef�cios e absente�smo.', '2025-01-12 17:53:09.047'),
(4, 'Plataforma de Ensino a Dist�ncia', 'Plataforma para cursos online, com v�deos, quizzes, e material de apoio interativo.', '2025-01-12 17:53:09.050'),
(5, 'Site Institucional', 'Desenvolvimento de um site institucional para uma empresa de m�dio porte, com informa��es sobre produtos e servi�os.', '2025-01-12 17:53:09.050'),
(6, 'Sistema de Monitoramento de Tr�fego', 'Sistema para monitorar o tr�fego de uma cidade em tempo real, com previs�o de congestionamentos e rotas alternativas.', '2025-01-12 17:53:09.050'),
(7, 'Aplicativo de Finan�as Pessoais', 'Aplicativo para ajudar os usu�rios a controlar seus gastos, investimentos e or�amento mensal.', '2025-01-12 17:53:09.050'),
(8, 'Automatiza��o de Processos de Vendas', 'Automatizar o processo de vendas em uma plataforma de e-commerce com integra��o de CRM e relat�rios de vendas.', '2025-01-12 17:53:09.050'),
(9, 'Sistema de Reservas de Hot�is', 'Sistema de gerenciamento de reservas de hot�is, com funcionalidade de check-in/check-out e gest�o de quartos.', '2025-01-12 17:53:09.050'),
(10, 'Aplicativo de Compras Coletivas', 'Aplicativo para facilitar compras em grupo, oferecendo descontos exclusivos para compras coletivas.', '2025-01-12 17:53:09.053'),
(11, 'Software de An�lise de Dados', 'Software voltado para an�lise de grandes volumes de dados, com relat�rios e dashboards interativos.', '2025-01-12 17:53:09.053'),
(12, 'Marketplace de Servi�os', 'Plataforma de marketplace que conecta prestadores de servi�os a clientes interessados, com integra��o de pagamento e avalia��es.', '2025-01-12 17:53:09.053'),
(13, 'Sistema de Gest�o de Invent�rio', 'Sistema para gerenciar o estoque de produtos de uma loja de varejo, com controle de entradas e sa�das.', '2025-01-12 17:53:09.053'),
(14, 'Plataforma de Crowdfunding', 'Plataforma para arrecada��o de fundos para projetos sociais, culturais ou empresariais.', '2025-01-12 17:53:09.053'),
(15, 'Aplicativo de Compartilhamento de Carros', 'Aplicativo para promover o compartilhamento de carros entre pessoas com trajetos semelhantes, buscando economia e redu��o de emiss�o de CO2.', '2025-01-12 17:53:09.053'),
(16, 'Sistema de Gest�o de Projetos Internos', 'Sistema para gerenciamento de projetos internos em uma empresa, com tarefas, prazos e aloca��o de recursos.', '2025-01-12 17:53:09.053'),
(17, 'Plataforma de Leil�es Online', 'Plataforma de leil�es online para compra e venda de produtos usados, com lances e participa��o em tempo real.', '2025-01-12 17:53:09.053'),
(18, 'Aplicativo de Receitas Culin�rias', 'Aplicativo com receitas culin�rias compartilhadas por usu�rios, com funcionalidades de busca e organiza��o de receitas favoritas.', '2025-01-12 17:53:09.053'),
(19, 'Sistema de Rastreamento de Pedidos', 'Sistema de rastreamento de pedidos em tempo real para uma loja de e-commerce, integrando com transportadoras e sistemas de log�stica.', '2025-01-12 17:53:09.053'),
(20, 'Sistema de Gest�o de Clientes (CRM)', 'Sistema de CRM para empresas que precisam gerenciar a rela��o com seus clientes, com funcionalidades de hist�rico e acompanhamento de vendas.', '2025-01-12 17:53:09.053'),
(21, 'Desenvolvimento de Sistema de E-commerce', 'Projeto para criar um sistema de e-commerce robusto com integra��o de pagamento e carrinho de compras.', '2025-01-12 18:37:18.943'



--Tabela 'tarefas'
CREATE TABLE tarefas (
    id_tarefa INT PRIMARY KEY
    ,nome NVARCHAR(255)
    ,descricao NVARCHAR(500)
    ,data_vencimento DATETIME
    ,status NVARCHAR(20)
    ,id_projeto INT
    ,id_tarefa_mae INT
    FOREIGN KEY (id_projeto)
	REFERENCES Projetos(id_projeto)
);



INSERT INTO tarefas (id_tarefa, nome, descricao, data_vencimento, status, id_projeto, id_tarefa_mae)
VALUES
(1, 'Definir arquitetura do sistema', 'Definir a arquitetura para o sistema de e-commerce, incluindo banco de dados e tecnologias.', '2025-01-20', 'pendente', 5, 1),
(2, 'Pesquisa de mercado para aplicativo', 'Realizar uma pesquisa de mercado para entender as necessidades do p�blico-alvo do aplicativo de sa�de.', '2025-01-25', 'pendente', 4, 2),
(3, 'Desenvolver funcionalidade de folha de pagamento', 'Desenvolver a funcionalidade de processamento de folha de pagamento no sistema de RH.', '2025-02-05', 'em andamento', 3, 3),
(4, 'Criar a interface de usu�rio', 'Criar a interface de usu�rio para a plataforma de ensino a dist�ncia.', '2025-02-10', 'pendente', 5, 4),
(5, 'Desenvolver p�gina de contato', 'Desenvolver a p�gina de contato e formul�rio de contato no site institucional.', '2025-01-30', 'pendente', 3, 5),
(6, 'Integrar sistema de monitoramento de tr�fego', 'Integrar sensores de tr�fego na cidade para o sistema de monitoramento em tempo real.', '2025-02-15', 'pendente', 4, 6),
(7, 'Definir or�amento do projeto', 'Definir o or�amento para o desenvolvimento do aplicativo de finan�as pessoais.', '2025-01-28', 'em andamento', 3, 7),
(8, 'Integrar API de CRM', 'Integrar a API do CRM para o processo de vendas automatizado na plataforma de e-commerce.', '2025-02-10', 'pendente', 5, 8),
(9, 'Configura��o de reservas de quartos', 'Configurar o sistema de reservas de quartos para hot�is, com integra��o de pagamentos.', '2025-02-20', 'pendente', 4, 9),
(10, 'Desenvolver m�dulo de compras coletivas', 'Desenvolver o m�dulo para realizar compras coletivas com descontos para usu�rios.', '2025-02-10', 'pendente', 4, 10),
(11, 'Configurar painel de controle de dados', 'Configurar painel de controle para an�lise de dados de grandes volumes para o software de an�lise de dados.', '2025-02-28', 'pendente', 5, 11),
(12, 'Desenvolver sistema de avalia��o de prestadores', 'Desenvolver sistema de avalia��o de prestadores de servi�os na plataforma de marketplace.', '2025-03-05', 'pendente', 3, 12),
(13, 'Atualizar estoque de produtos', 'Atualizar o estoque de produtos para refletir as novas entradas e sa�das de produtos.', '2025-02-10', 'pendente', 2, 13),
(14, 'Revisar c�digo do sistema de crowdfunding', 'Revisar c�digo do sistema de crowdfunding para melhorar a seguran�a nas transa��es.', '2025-02-22', 'em andamento', 5, 14),
(15, 'Testar algoritmo de caronas', 'Testar o algoritmo de compartilhamento de carros no aplicativo de caronas.', '2025-03-01', 'pendente', 3, 15),
(16, 'Adicionar funcionalidade de cronograma de tarefas', 'Adicionar a funcionalidade de cronograma de tarefas no sistema de gest�o de projetos internos.', '2025-03-10', 'em andamento', 4, 16),
(17, 'Desenvolver sistema de leil�es em tempo real', 'Desenvolver a funcionalidade de leil�es em tempo real para a plataforma de leil�es online.', '2025-03-05', 'pendente', 5, 17),
(18, 'Criar p�gina de receitas favoritas', 'Criar uma p�gina para listar receitas favoritas no aplicativo de receitas culin�rias.', '2025-03-15', 'pendente', 2, 18),
(19, 'Implementar rastreamento de pedidos', 'Implementar a funcionalidade de rastreamento de pedidos no sistema de rastreamento de pedidos.', '2025-03-20', 'em andamento', 4, 19),
(20, 'Adicionar funcionalidades de CRM', 'Adicionar funcionalidades de CRM no sistema de gest�o de clientes.', '2025-03-10', 'pendente', 3, 20),
(21, 'Definir arquitetura do sistema', 'Definir a arquitetura para o sistema de e-commerce, incluindo banco de dados e tecnologias.', '2025-01-20', 'pendente', 5, 1),
(22, 'Pesquisa de mercado para aplicativo', 'Realizar uma pesquisa de mercado para entender as necessidades do p�blico-alvo do aplicativo de sa�de.', '2025-01-25', 'pendente', 4, 2),
(23, 'Desenvolver funcionalidade de folha de pagamento', 'Desenvolver a funcionalidade de processamento de folha de pagamento no sistema de RH.', '2025-02-05', 'em andamento', 3, 3);
