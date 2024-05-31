# DESAFIO STONE: AUTOMAÇÃO BACKEND

## Configurando o Ambiente

### VSCode Plugins
- Python
- Robot Framework Language Server

### Python, Poetry
O projeto é compatível com a versão 3.8 ou superior do Python e suas dependências e a criação de ambiente virtual isolado é feito pelo Poetry. E utiliza o Appium 2 como client entre o script e o dispositivo utilizado:

- Python: https://www.python.org/downloads/
- Poetry: https://python-poetry.org/docs/#installing-with-the-official-installer

Após a instalação, basta executar o comando abaixo na raiz do projeto, para que as dependências sejam instaladas e um ambiente virtual seja criado.

```
poetry install
```

### Plugin Robot Framework Language Server
Para que este plugin funcione corretamente, é necessário configurar o caminho do interpretador Python criado pelo Poetry. Para isso, execute o comando abaixo:

```
poetry run where python
```

Esse comando irá listar todos os ".exe" do Python existente em sua máquina. Copie o caminho do ".exe" localizado em "\AppData\Local\pypoetry\Cache\virtualenvs\".

Vá até as configurações do plugin Robot Framework Language Server, na aba "Workspace", cole o caminho copiado no campo "Robot > Language-server: Python"

Com isso, o Robot Framework Language Server passará a ter acesso as bibliotecas instaladas no ambiente virtual do Poetry

### Execução

Em outro terminal, execute o comando abaixo para iniciar a execução dos testes, para executar todas as suites de testes:

``` bash
robot -d log .
```

## Estrutura do Projeto

```
STONE_DESAFIO_QA_BACKEND/
├───.vscode
├───resources
│   ├───actions
│   ├───constants
│   ├───libs
│   ├───services
│   └───utils
└───tests       
```

- **resources/**: Este diretório é destinado ao armazenamento de todos os recursos necessários para a execução dos testes.
   - **actions/**: Contém as ações relacionadas aos prefixos do Gherkin
   - **constants/**: Diretório que contém arquivos com variáveis constantes usadas em diferentes partes do projeto.
   - **libs/**: Diretório que contém as Custom Libraries construídas para o projeto
   - **services/**: Aqui são mantidos os arquivos de HTTP Objects, que representam as execuções e validações dos endpoints incluídos nos testes.
   - **utils/**: Neste diretório são armazenados os arquivos de utilitários, que contêm funções auxiliares escritos em Robot Framework ou Python.

- **tests/**: Este diretório contém os arquivos das suites de testes, onde estão definidos os casos de teste e a estrutura dos testes a serem executados.


## Start : Casos de Teste
Os casos de testes do App Start se encontram na raíz do projeto no arquivo 'Start_Scenarios.pdf'