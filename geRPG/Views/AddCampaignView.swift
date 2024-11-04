import SwiftUI

struct AddCampaignView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var campaignManager: CampaignManager
    @State private var newCampaignName: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nome da Campanha", text: $newCampaignName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                    Button("Adicionar") {
                        if !newCampaignName.isEmpty {
                            let newCampaign = Campaign(name: newCampaignName)
                            campaignManager.campaigns.append(newCampaign)
                            campaignManager.saveCampaigns()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .disabled(newCampaignName.isEmpty)
                    .padding()
                    .background(newCampaignName.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
            }
            .navigationTitle("Nova Campanha")
            .navigationBarItems(leading: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            })
            .background(Color(.systemGray6)) // Cor de fundo da tela
            .cornerRadius(10)
        }
    }
}
