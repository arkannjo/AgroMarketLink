# Título do Projeto: AgroMarketLink

## Descrição:
AgroMarketLink é uma aplicação móvel dedicada a conectar pequenos produtores rurais diretamente a compradores locais, como mercados, restaurantes e processadores. Esta plataforma visa simplificar o processo de venda e compra, diminuir o tempo entre a colheita e a venda, e potencialmente obter preços melhores para os produtores ao eliminar intermediários.

## Funcionalidades Principais:

- **Perfil do Produtor:** Os produtores podem criar perfis detalhados, indicando os tipos de produtos que cultivam, quantidades disponíveis, métodos de cultivo (orgânico, convencional), localização, fotos dos produtos e outros detalhes relevantes.

- **Perfil de Comprador:** Restaurante, Pessoa Física, Mercado em geral.

- **Lista de Produtos:** Os produtores podem listar seus produtos individualmente, atualizando a disponibilidade em tempo real, definindo preços e fornecendo uma breve descrição do produto.

- **Sistema de Pedidos:** Os compradores podem navegar pelos produtos disponíveis e fazer pedidos diretamente no aplicativo. Ao fazer um pedido, o produtor é notificado e pode aceitar ou recusar com base na disponibilidade e outros critérios.

- **Avaliações e Comentários:** Após a conclusão de uma venda, compradores e produtores podem avaliar uns aos outros. Isso incentiva práticas comerciais justas e fornece uma referência para futuras transações.

- **Notificações:** Notificações push para informar os produtores sobre novos pedidos, mensagens ou alterações de status nos pedidos existentes.

- **Chat Integrado:** Um chat direto entre produtor e comprador para discutir detalhes como entrega, pagamento e esclarecer qualquer dúvida. Se for implementado!

## Tecnologias Utilizadas:

- **Frontend:** Flutter (desenvolvimento multiplataforma para iOS e Android).
- **Banco de Dados:** A definir

### Desenvolvimento:
Codificação das funcionalidades e estruturação do banco de dados.

### Teste Beta:
Lançamento para um grupo seleto de produtores e compradores para coletar feedback e realizar ajustes.

## Impacto Esperado:

Com o AgroMarketLink, espera-se:
- Redução do tempo entre colheita e venda.
- Melhoria nos preços para os produtores ao reduzir intermediários.
- Fortalecimento dos negócios locais ao facilitar o acesso a produtos frescos e de qualidade.
- Construção de uma comunidade de confiança entre produtores e compradores através de avaliações e feedbacks.

## Requisitos Funcionais:

### Perfil do Produtor:
- Criação de perfis detalhados.
- Indicação dos produtos cultivados.
- Quantidades disponíveis.
- Métodos de cultivo (orgânico, convencional).
- Localização e detalhes de contato.
- Upload de fotos dos produtos.

### Perfil de Comprador:
- Opção de perfil: Restaurante, Pessoa Física ou Mercado em geral.
- Criação e edição de perfis com detalhes de contato.

### Lista de Produtos:
- Adição de produtos com descrição, preço e quantidade.
- Atualização em tempo real da disponibilidade.

### Sistema de Pedidos:
- Navegação e busca de produtos disponíveis.
- Realização de pedidos diretamente no aplicativo.
- Notificação para o produtor quando um novo pedido é feito.
- O produtor tem a opção de aceitar ou recusar o pedido.

### Avaliações e Comentários:
- Avaliação mútua entre produtor e comprador após a conclusão da venda.
- Espaço para comentários e feedback.

### Notificações:
- Notificações push sobre novos pedidos, mensagens ou alterações de status.

### Chat Integrado (caso seja implementado):
- Chat direto entre produtor e comprador.
- Discussão sobre detalhes como entrega e pagamento.

## Requisitos Não Funcionais:

### Desempenho:
- A aplicação deve ser rápida e responsiva em diferentes dispositivos móveis.

### Segurança:
- Dados dos usuários devem ser armazenados de forma segura.
- **As transações e chats devem ser criptografados.**

### Usabilidade:
- Interface amigável e intuitiva.
- Tutorial ou orientação para novos usuários.

### Compatibilidade:
- A aplicação deve ser compatível com as principais versões de iOS e Android.

### Disponibilidade:
- O sistema deve estar disponível 24/7, com manutenções programadas fora dos horários de pico.

### Escalabilidade:
- A aplicação deve ser capaz de suportar um número crescente de usuários e transações.

## Devs:
- Reinaldo Jose Damacena
- Victor Tavares Moreira
- Igor Brito dos Santos

## Diagrama do sistema: 

lib/
│
├── main.dart
│
├── config/                 # Configurações globais e constantes.
│
├── models/                 # Modelos de dados, como Produtor, Produto, etc.
│
├── services/               # Serviços para comunicação com APIs, bancos de dados, etc.
│   ├── api_service.dart
│   ├── database_service.dart
│   └── ...
│
├── screens/                # Telas/páginas da aplicação.
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   └── ...
│
├── widgets/                # Widgets reutilizáveis e componentes UI específicos.
│   ├── custom_button.dart
│   ├── responsive_layout.dart
│   └── ...
│
├── utils/                  # Funções utilitárias e lógicas de negócios.
│
├── themes/                 # Temas e estilos.
│   ├── app_colors.dart
│   ├── text_themes.dart
│   └── ...
│
├── routes/                 # Gerenciamento de rotas.
│
└── assets/                 # Imagens, fontes e outros ativos estáticos.
    ├── images/
    └── fonts/
