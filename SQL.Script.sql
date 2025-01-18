--Tabela 'projetos'

CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY
    ,nome NVARCHAR(255)
    ,descricao NVARCHAR(500)
    ,data_criacao DATETIME
);


INSERT INTO projetos (id_projeto, nome, descricao, data_criacao)
VALUES 
(1, 'Desenvolvimento de Sistema de E-commerce', 'Projeto para criar um sistema de e-commerce robusto com integração de pagamento e carrinho de compras.', '2025-01-12 17:53:09.043'),
(2, 'Aplicativo de Saúde', 'Aplicativo para acompanhamento de saúde, com recursos de monitoramento de atividades físicas e alimentação.', '2025-01-12 17:53:09.047'),
(3, 'Sistema de Gestão de Recursos Humanos', 'Sistema para gerenciar dados de funcionários, folha de pagamento, benefícios e absenteísmo.', '2025-01-12 17:53:09.047'),
(4, 'Plataforma de Ensino a Distância', 'Plataforma para cursos online, com vídeos, quizzes, e material de apoio interativo.', '2025-01-12 17:53:09.050'),
(5, 'Site Institucional', 'Desenvolvimento de um site institucional para uma empresa de médio porte, com informações sobre produtos e serviços.', '2025-01-12 17:53:09.050'),
(6, 'Sistema de Monitoramento de Tráfego', 'Sistema para monitorar o tráfego de uma cidade em tempo real, com previsão de congestionamentos e rotas alternativas.', '2025-01-12 17:53:09.050'),
(7, 'Aplicativo de Finanças Pessoais', 'Aplicativo para ajudar os usuários a controlar seus gastos, investimentos e orçamento mensal.', '2025-01-12 17:53:09.050'),
(8, 'Automatização de Processos de Vendas', 'Automatizar o processo de vendas em uma plataforma de e-commerce com integração de CRM e relatórios de vendas.', '2025-01-12 17:53:09.050'),
(9, 'Sistema de Reservas de Hotéis', 'Sistema de gerenciamento de reservas de hotéis, com funcionalidade de check-in/check-out e gestão de quartos.', '2025-01-12 17:53:09.050'),
(10, 'Aplicativo de Compras Coletivas', 'Aplicativo para facilitar compras em grupo, oferecendo descontos exclusivos para compras coletivas.', '2025-01-12 17:53:09.053'),
(11, 'Software de Análise de Dados', 'Software voltado para análise de grandes volumes de dados, com relatórios e dashboards interativos.', '2025-01-12 17:53:09.053'),
(12, 'Marketplace de Serviços', 'Plataforma de marketplace que conecta prestadores de serviços a clientes interessados, com integração de pagamento e avaliações.', '2025-01-12 17:53:09.053'),
(13, 'Sistema de Gestão de Inventário', 'Sistema para gerenciar o estoque de produtos de uma loja de varejo, com controle de entradas e saídas.', '2025-01-12 17:53:09.053'),
(14, 'Plataforma de Crowdfunding', 'Plataforma para arrecadação de fundos para projetos sociais, culturais ou empresariais.', '2025-01-12 17:53:09.053'),
(15, 'Aplicativo de Compartilhamento de Carros', 'Aplicativo para promover o compartilhamento de carros entre pessoas com trajetos semelhantes, buscando economia e redução de emissão de CO2.', '2025-01-12 17:53:09.053'),
(16, 'Sistema de Gestão de Projetos Internos', 'Sistema para gerenciamento de projetos internos em uma empresa, com tarefas, prazos e alocação de recursos.', '2025-01-12 17:53:09.053'),
(17, 'Plataforma de Leilões Online', 'Plataforma de leilões online para compra e venda de produtos usados, com lances e participação em tempo real.', '2025-01-12 17:53:09.053'),
(18, 'Aplicativo de Receitas Culinárias', 'Aplicativo com receitas culinárias compartilhadas por usuários, com funcionalidades de busca e organização de receitas favoritas.', '2025-01-12 17:53:09.053'),
(19, 'Sistema de Rastreamento de Pedidos', 'Sistema de rastreamento de pedidos em tempo real para uma loja de e-commerce, integrando com transportadoras e sistemas de logística.', '2025-01-12 17:53:09.053'),
(20, 'Sistema de Gestão de Clientes (CRM)', 'Sistema de CRM para empresas que precisam gerenciar a relação com seus clientes, com funcionalidades de histórico e acompanhamento de vendas.', '2025-01-12 17:53:09.053'),
(21, 'Desenvolvimento de Sistema de E-commerce', 'Projeto para criar um sistema de e-commerce robusto com integração de pagamento e carrinho de compras.', '2025-01-12 18:37:18.943'



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
(2, 'Pesquisa de mercado para aplicativo', 'Realizar uma pesquisa de mercado para entender as necessidades do público-alvo do aplicativo de saúde.', '2025-01-25', 'pendente', 4, 2),
(3, 'Desenvolver funcionalidade de folha de pagamento', 'Desenvolver a funcionalidade de processamento de folha de pagamento no sistema de RH.', '2025-02-05', 'em andamento', 3, 3),
(4, 'Criar a interface de usuário', 'Criar a interface de usuário para a plataforma de ensino a distância.', '2025-02-10', 'pendente', 5, 4),
(5, 'Desenvolver página de contato', 'Desenvolver a página de contato e formulário de contato no site institucional.', '2025-01-30', 'pendente', 3, 5),
(6, 'Integrar sistema de monitoramento de tráfego', 'Integrar sensores de tráfego na cidade para o sistema de monitoramento em tempo real.', '2025-02-15', 'pendente', 4, 6),
(7, 'Definir orçamento do projeto', 'Definir o orçamento para o desenvolvimento do aplicativo de finanças pessoais.', '2025-01-28', 'em andamento', 3, 7),
(8, 'Integrar API de CRM', 'Integrar a API do CRM para o processo de vendas automatizado na plataforma de e-commerce.', '2025-02-10', 'pendente', 5, 8),
(9, 'Configuração de reservas de quartos', 'Configurar o sistema de reservas de quartos para hotéis, com integração de pagamentos.', '2025-02-20', 'pendente', 4, 9),
(10, 'Desenvolver módulo de compras coletivas', 'Desenvolver o módulo para realizar compras coletivas com descontos para usuários.', '2025-02-10', 'pendente', 4, 10),
(11, 'Configurar painel de controle de dados', 'Configurar painel de controle para análise de dados de grandes volumes para o software de análise de dados.', '2025-02-28', 'pendente', 5, 11),
(12, 'Desenvolver sistema de avaliação de prestadores', 'Desenvolver sistema de avaliação de prestadores de serviços na plataforma de marketplace.', '2025-03-05', 'pendente', 3, 12),
(13, 'Atualizar estoque de produtos', 'Atualizar o estoque de produtos para refletir as novas entradas e saídas de produtos.', '2025-02-10', 'pendente', 2, 13),
(14, 'Revisar código do sistema de crowdfunding', 'Revisar código do sistema de crowdfunding para melhorar a segurança nas transações.', '2025-02-22', 'em andamento', 5, 14),
(15, 'Testar algoritmo de caronas', 'Testar o algoritmo de compartilhamento de carros no aplicativo de caronas.', '2025-03-01', 'pendente', 3, 15),
(16, 'Adicionar funcionalidade de cronograma de tarefas', 'Adicionar a funcionalidade de cronograma de tarefas no sistema de gestão de projetos internos.', '2025-03-10', 'em andamento', 4, 16),
(17, 'Desenvolver sistema de leilões em tempo real', 'Desenvolver a funcionalidade de leilões em tempo real para a plataforma de leilões online.', '2025-03-05', 'pendente', 5, 17),
(18, 'Criar página de receitas favoritas', 'Criar uma página para listar receitas favoritas no aplicativo de receitas culinárias.', '2025-03-15', 'pendente', 2, 18),
(19, 'Implementar rastreamento de pedidos', 'Implementar a funcionalidade de rastreamento de pedidos no sistema de rastreamento de pedidos.', '2025-03-20', 'em andamento', 4, 19),
(20, 'Adicionar funcionalidades de CRM', 'Adicionar funcionalidades de CRM no sistema de gestão de clientes.', '2025-03-10', 'pendente', 3, 20),
(21, 'Definir arquitetura do sistema', 'Definir a arquitetura para o sistema de e-commerce, incluindo banco de dados e tecnologias.', '2025-01-20', 'pendente', 5, 1),
(22, 'Pesquisa de mercado para aplicativo', 'Realizar uma pesquisa de mercado para entender as necessidades do público-alvo do aplicativo de saúde.', '2025-01-25', 'pendente', 4, 2),
(23, 'Desenvolver funcionalidade de folha de pagamento', 'Desenvolver a funcionalidade de processamento de folha de pagamento no sistema de RH.', '2025-02-05', 'em andamento', 3, 3);
