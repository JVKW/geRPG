import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var campaignManager: CampaignManager
    var campaign: Campaign
    @State var character: Character

    var body: some View {
        VStack {
            Text("Detalhes de \(character.name)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            TextEditor(text: $character.story)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(height: 150)
                .overlay(Text("História").foregroundColor(.gray).padding(8), alignment: .topLeading)

            TextEditor(text: $character.appearance)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(height: 100)
                .overlay(Text("Aparência").foregroundColor(.gray).padding(8), alignment: .topLeading)

            TextEditor(text: $character.goals)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .frame(height: 100)
                .overlay(Text("Objetivos").foregroundColor(.gray).padding(8), alignment: .topLeading)

            Button("Salvar") {
                saveCharacter()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

            Spacer()
        }
        .padding()
        .navigationTitle(character.name)
        .background(Color(.systemGray6)) // Cor de fundo da tela
        .cornerRadius(10)
    }

    private func saveCharacter() {
        if let index = campaignManager.campaigns.firstIndex(where: { $0.id == campaign.id }) {
            if let characterIndex = campaignManager.campaigns[index].importantCharacters.firstIndex(where: { $0.id == character.id }) {
                campaignManager.campaigns[index].importantCharacters[characterIndex] = character
                campaignManager.saveCampaigns()
            }
        }
    }
}
