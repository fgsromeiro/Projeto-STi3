<h1 align="center" style="font-weight: bold;">Projeto STi3 📱</h1>

<p align="center">
 <a href="#demo">Demonstração</a> • 
 <a href="#tech">Tecnologias</a> • 
 <a href="#start">Iniciando</a> • 
 <a href="#structure">Estrutura</a> 
</p>

<p align="center">
    <b>Este projeto é parte do desafio apresentado pela equipe do STi3 para o processo seletivo da vaga Desenvolvedor Flutter.</b>
</p>

<h2 id="demo">📱Demontração</h2>

<p align="center">
    <a href="https://firebasestorage.googleapis.com/v0/b/projeto-sti3-97c08.appspot.com/o/demonstracao.mp4?alt=media&token=e067e56d-40ac-4f1d-ae8a-821ec30d1f0e" target="_blank">
  <button style="background-color: blue; color: white; border: 2px solid black; padding: 10px 20px; cursor: pointer;">
    Ver demontração
  </button>
</a>

</p>

<h2 id="tech">💻 Tecnologias</h2>

- Flutter 3.24.3
- Dart 3.5.3
- Hive

<h2 id="start">🎖️ Iniciando</h2>

Para começar o projeto, certifique-se de ter o Dart e o Flutter configurados em sua máquina local.

1. **Navega para o projeto**:
    ```bash
    cd <project name>
    ```
2. **Limpe o cache**:
    ```bash
    flutter clean
    ```
3. **Instale as dependências**:
    ```bash
    flutter pub get
    ```
4. **Inicie o projeto**:
    ```bash
    f5 (Modo Debug)
    ```


<h2 id="structure">📂 Estrutura </h2>

```
src/
 ├── lib/
 │   ├── shared/
 │   │      ├── di/
 │   │      │      └── dependency_assembly.dart
 │   │      │
 │   │      ├── domain/
 │   │      │      ├── exceptions.dart
 │   │      │      ├── http_client.dart
 │   │      │      └── network_info_impl.dart
 │   │      │  
 │   │      ├── extensions/
 │   │      │      ├── parser_extension_datetime.dart
 │   │      │      ├── parser_extension_double.dart
 │   │      │      ├── parser_extension_integer.dart
 │   │      │      └── parser_extension_string.dart
 │   │      │
 │   │      ├── hive/
 │   │      │      ├── generator/
 │   │      │      └── hive_service_impl.dart
 │   │      │
 │   │      └── interface/
 │   │          ├── base_exception.dart
 │   │          ├── hive_service.dart
 │   │          ├── http_adapter.dart
 │   │          └── network_info.dart 
 │   │    
 │   ├── ini/
 │   │      └── app.dart
 │   │   
 │   ├── modules/
 │   │      ├── home/presentation/pages/
 │   │      │                     └── home_screen.dart
 │   │      ├── order/
 │   │      │       ├── Data/
 │   │      │       ├── Domain/
 │   │      │       └── Presentation/
 │   │      └── report/
 │   │              ├── Data/
 │   │              ├── Domain/
 │   │              └── Presentation/
 │   │       
 │   ├── ui/
 │   │      ├── app_scaffold.dart
 │   │      ├── app_table.dart
 │   │      └── dialogs
 │   │
 │   └── utils/
 │          ├── constants.dart
 │          ├── styles.dart
 │          └── utils.dart
 │       
 │          
 └── main.dart
```