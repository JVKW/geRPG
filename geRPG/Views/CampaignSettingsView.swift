import SwiftUI

struct CampaignSettingsView: View {
    @ObservedObject var campaignManager: CampaignManager
    var campaign: Campaign
    @State private var description: String
    @State private var importantCharacters: [Character]
    @State private var newCharacterName: String = ""

    init(campaign: Campaign, campaignManager: CampaignManager) {
        self.campaign = campaign
        self.campaignManager = campaignManager
        _description = State(initialValue: campaign.description)
        _importantCharacters = State(initialValue: campaign.importantCharacters)
    }

    var body: some View {
        VStack {
            Text("Configurações de Campanha")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            TextEditor(text: $description)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(height: 150)
                .border(Color.gray.opacity(0.5), width: 1)

            Section(header: Text("Personagens Importantes")
                .font(.headline)
                .foregroundColor(.primary)) {
                List(importantCharacters) { character in
                    NavigationLink(destination: CharacterDetailView(campaignManager: campaignManager, campaign: campaign, character: character)) {
                        Text(character.name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    }
                }
                .listStyle(PlainListStyle())

                HStack {
                    TextField("Nome do Personagem", text: $newCharacterName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                    Button("Adicionar") {
                        addCharacter()
                    }
                    .disabled(newCharacterName.isEmpty)
                    .padding()
                    .background(newCharacterName.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }

            Button("Salvar") {
                saveCampaign()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
        .padding()
        .navigationTitle(campaign.name)
        .background(Color(.systemGray6)) // Cor de fundo da tela
        .cornerRadius(10)
    }

    private func addCharacter() {
        if !newCharacterName.isEmpty {
            let newCharacter = Character(name: newCharacterName)
            importantCharacters.append(newCharacter)
            newCharacterName = ""
        }
    }

    private func saveCampaign() {
        if let index = campaignManager.campaigns.firstIndex(where: { $0.id == campaign.id }) {
            campaignManager.campaigns[index].description = description
            campaignManager.campaigns[index].importantCharacters = importantCharacters
            campaignManager.saveCampaigns()
        }
    }
}
