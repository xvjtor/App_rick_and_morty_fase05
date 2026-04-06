# Rick and Morty App
Aplicativo desenvolvido em Flutter para a fase 5 do curso de desenvolvimento mobile da Growdev. Rick and Morty App tem como foco o consumo de API, boas práticas de arquitetura, performance e experiência de usuário.


## Sobre o aplicativo
Este projeto tem como objetivo explorar conceitos modernos de desenvolvimento mobile utilizando Flutter, incluindo:
  Consumo de API REST  
  Gerenciamento de estado  
  Componentização de widgets  
  UI responsiva (Grid / List)  
  Carregamento paginado (infinite scroll)  
  Geração dinâmica de cores  
  Animações entre telas  
  Filtragem de lista (barra de pesquisa)  
  Injeção de dependência  

## Funcionalidades
  Busca de personagens  
  Listagem com paginação infinita  
  Alternância entre GridView e ListView  
  Cores dinâmicas baseadas na imagem do personagem  
  Carregamento otimizado com cache de imagens  
  Indicador de loading ao chegar no final da lista  


## Estrutura do Projeto
```bash
lib
├── core
│   ├── app_colors.dart
│   ├── app_constants.dart
│   └── app_dependencies.dart
├── models
│   ├── character_model.dart
│   └── character_response_model.dart
├── pages
│   ├── detail_page.dart
│   └── home_page.dart
├── services
│   └── rick_and_morty_api_sevice.dart
├── store
│   ├── home_store.dart
│   └── home_store.g.dart
├── widgets
│   ├── adapted_box_details_widget.dart
│   ├── gridview_card_widget.dart
│   ├── gridview_characters_widget.dart
│   ├── listview_card_widget.dart
│   ├── listview_characters_widget.dart
│   └── search_widget.dart
└── main.dart
```
