import SwiftUI

struct ContentView: View {
    @StateObject private var campaignManager = CampaignManager()
    @State private var showAddCampaign = false

    // Definição das colunas para o LazyVGrid
    let columns = [
        GridItem(.flexible()), // Primeira coluna
        GridItem(.flexible())  // Segunda coluna
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(campaignManager.campaigns) { campaign in
                        NavigationLink(destination: CampaignSettingsView(campaign: campaign, campaignManager: campaignManager)) {
                            VStack {
                                // Exibição da imagem da campanha ou um ícone padrão
                                if let imageData = campaign.documents.first?.imageData, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100) // Ajuste a altura conforme necessário
                                        .cornerRadius(8)
                                } else {
                                    // Ícone de anotação
                                    Image(systemName: "book.closed.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100) // Ajuste a altura conforme necessário
                                        .foregroundColor(.gray)
                                        .padding()
                                }
                                Text(campaign.name)
                                    .font(.headline)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                                    .shadow(radius: 2) // Sombra para dar profundidade
                            }
                            .padding(.vertical, 5)
                            .background(Color(.systemGray6)) // Fundo da célula
                            .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Campanhas de RPG")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddCampaign.toggle()
                    }) {
                        Label("Adicionar Campanha", systemImage: "plus")
                            .font(.headline)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 2) // Sombra para dar destaque
                    }
                }
            }
            .sheet(isPresented: $showAddCampaign) {
                AddCampaignView(campaignManager: campaignManager)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
