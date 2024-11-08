# 🐉 Gerenciador de Campanhas de RPG (geRPG)

**Plataforma**: iOS  
**Frameworks**: SwiftUI, Core Data  
**Arquitetura**: MVVM  

## 🎯 Visão Geral

O **Gerenciador de Campanhas de RPG (geRPG)** é um aplicativo para iOS projetado para auxiliar jogadores e mestres de RPG na organização de suas campanhas. Com recursos de armazenamento offline, o app permite gerenciar personagens, campanhas e suas histórias de forma prática e intuitiva.

## 🚀 Funcionalidades

### ✅ Implementadas

- **Criação de Campanhas**: Criação de campanhas individualmente, com informações básicas para cada uma.
- **Gestão de Personagens**: Adição de personagens com dados básicos, incluindo uma descrição da história de cada personagem.

### 🔄 Em Desenvolvimento e Planejamento

- **Gestão Avançada de Campanhas**: Opções adicionais para categorização e classificação das campanhas.
- **📝 Sistema de Anotações**: Adição de anotações e documentos associados a cada campanha.
- **🧰 Ferramentas de Jogo**:
  - **🎲 Rolagem de Dados**: Sistema para rolagem de dados integrado.
  - **🔠 Geradores de Nomes**: Ferramenta para criação de nomes de personagens e NPCs.
- **🎨 Elementos Visuais**:
  - **🗺️ Gráficos e Mapas**: Criação de gráficos personalizados e mapas de campanha com o Core Graphics.
  - **✨ Animações**: Integração com Core Animation para transições e efeitos visuais.

## 🛠️ Tecnologias Utilizadas

- **SwiftUI**: Para construção da interface de usuário (UI).
- **Core Data**: Persistência de dados offline, para armazenar campanhas, personagens e anotações.

## 🧩 Arquitetura

O projeto segue a arquitetura **MVVM**:

- **Model**: Estrutura de dados do app integrada ao Core Data.
- **View**: Interface de usuário, com telas para gerenciar campanhas e personagens.
- **ViewModel**: Lógica de negócio e manipulação de dados, promovendo interação entre a UI e o Core Data.

## 📂 Estrutura de Diretórios

- **`views/`**: Views do SwiftUI para interface de usuário.
  - **`AddCampaignView.swift`**: Tela para adicionar campanhas.
  - **`CharacterDetailView.swift`**: Tela de edição de personagens.
  - **`ContentView.swift`**: Tela principal de visualização de campanhas.
- **`models/`**: Modelos de dados das campanhas, personagens, etc., integrados ao Core Data.
- **`viewModels/`**: Lógica de negócio, conectando dados e interface.
  - **`CampaignManager.swift`**: Gerencia operações de campanha.
- **`Extensions/`**: Extensões adicionais, como `ImagePicker.swift`.

## 👥 Contribuição e Desenvolvimento

### 🛠️ Requisitos

- Xcode 13+
- iOS 15+

### Como Contribuir

1. 🍴 Faça um fork deste repositório.
2. 🌱 Crie uma nova branch (`git checkout -b feature/nova-funcionalidade`).
3. 💾 Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`).
4. 🚀 Dê push para a branch (`git push origin feature/nova-funcionalidade`).
5. 🔁 Abra um Pull Request.

---

## 📜 Licença

Este projeto é licenciado sob a [MIT License](LICENSE).

## 🔗 Links Úteis

- [Repositório Oficial do GitHub](https://github.com/JVKW/geRPG_project)
