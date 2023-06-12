# Arquitetura

( Em Desenvolvimento )

# Objetivo

Desenvolver um aplicativo Web de Delivery Ususando o Flutter Web.

# Regras iniciais, limite e Análise

- Todo o projeto respeita as regras de Lint escritas no pacote analysis_options.
- Projeto divido em Camadas.

# Entidades

(Será criado pelos alunos da Masterclass Intermediário 1)

# Casos de Uso

(Será criado pelos alunos da Masterclass Intermediário 1)


# Design Patterns

- Repository Pattern: Para acesso a API externa.
- Service Pattern: Para isolar trechos de códigos com outras responsabilidades.
- Dependency Injection: Resolver dependências das classes.
- Store: Guardar e mudar estados.
- State pattern: Padrão que auxilia no gerenciamento estados.
- Adapter: Converter um objeto em outro.
- Result: Trabalhar com retorno Múltiplo.


# Package externos (Comum)

- dio: Cliente HTTP.
- flutter_modular: trabalha com Injeção de Dependências e Rotas dinâmicas em cada Módulo do projeto.
- mobx: trabalha com Gestão de estado
- flutter_dotenv: Carregar configuração em tempo de execução a partir de um arquivo .env
- loading_animation_widget: Plugin de Carregando animação
- awesome_snackbar_content: Permite elevar sua experiência com o SnackBar.
- validatorless: Validações de formulários 
- flutter_mobx: pacote de widgets para o consumo da nossa lógica de negócio na UI do Flutter.
- brasil_fields: Pacote com padrões e formatos brasileiros
