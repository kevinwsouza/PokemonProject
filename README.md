
# Pokemon App

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

Código fonte do aplicativo responsável pelo gerenciamento de cartões GreenCard e informações cadastrais. Dentre algumas das funcionalidades disponíveis, estão:
- Visualização dos pokemons em lista com nome e foto na Home
- Tela de detalhes do respectivo pokemon selecionado na Home com id, habilidades, tipo, altura e peso
- navegação entre as telas para voltar e escolher novos pokemons

## Detalhes técnicos do projeto
- Desenvolvido em [Dart e Flutter](https://flutter.dev/)
- Utiliza [CLEAN Arquitecture](docs/adr/0001-clean-architecture.md) para organização do código.
- Injeção de dependências e gerencimento de rotas com [Flutter Modular](https://pub.dev/packages/flutter_modular)
- Gerenciamento de estado com [Mobx](https://pub.dev/packages/mobx)
- Conexão HTTP com [Dio](https://pub.dev/packages/dio)
- captura de imagens utilizando o image network do flutter

## Configuração do ambiente
A **Dart VM** e o **Flutter SDK** precisam estar devidamente instalados, de preferência em sua versão *stable*. Utilize o comando `flutter doctor` para verificar se o ambiente Flutter está devidamente configurado.

Após isso, o comando `flutter pub get` faz a instalação das dependências no projeto e `flutter run` inicia a execução em um dispositivo. Mas antes de rodar o projeto, é necessario conferir as configuraçoes de ambiente seguintes.

## Desenvolvimento e Função
O aplicativo foi desenvolvido para teste e aplicação de vaga para Desenvolvedor Flutter.Jr. o aplicativo consiste em consumir a API externa de pokemons (https://pokeapi.co/api/v2/pokemon) e fazer uma listagem dos pokemons mostrando seu nome e sua imagem em uma HomeScreen e também ter a opção de clicar em cada pokemon desejável e apresentar uma tela de detalhes com id, nome, foto, habilidades, tipos, peso e altura.

## Descrição dos requisitos

    Tela inicial:
    - Exiba uma lista de Pokémon, mostrando o nome e a imagem de cada um.
    - Ao tocar em um Pokémon da lista, o aplicativo deve navegar para a tela de detalhes do Pokémon.

    Tela de detalhes do Pokémon:
    - Exiba informações detalhadas sobre o Pokémon selecionado, como nome, número, altura, peso, tipos, habilidades, etc.
    - Inclua também a imagem do Pokémon em tamanho maior.
    - Forneça um botão ou ícone para voltar à tela inicial.
