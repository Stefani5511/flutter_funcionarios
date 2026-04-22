# flutter_funcionarios

# Funcionários

Exemplo de um app Flutter que carrega dados de um arquivo JSON local, exibindo uma lista de funcionários com foto, cargo e salário.
O projeto também utiliza paleta de cores personalizada e tema global.

---

## Tecnologias

* Flutter
* VS Code
* Android Studio

---

## Recursos Utilizados

* Tema: `ThemeData`
* Paleta de cores: `pallet.dart`
* Imagens: `Image.network()`
* Assincronicidade: `async / await`
* Leitura de JSON local: `rootBundle.loadString()`
* Conversão de dados: `json.decode()`
* Menu dropdown: `DropdownButton`
* Botões: `ElevatedButton`
* Navegação entre telas: `Navigator`

---

## Funcionalidades

* Tela Splash com botão "Entrar"
* Listagem de funcionários via JSON
* Exibição de imagem (avatar), nome, cargo e salário
* Seleção por dropdown
* Navegação entre funcionários (Anterior / Próximo)

---

## Como executar

1. Clone o repositório
2. Abra o projeto no VS Code
3. Abra o terminal (`Ctrl + "`)
4. Execute:

```bash
flutter pub get
flutter run
```

5. Escolha um emulador ou navegador

---

## Observação

O app inicia na tela Splash.
Clique em **Entrar** para acessar a lista de funcionários.

 

