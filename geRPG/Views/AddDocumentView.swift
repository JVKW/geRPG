import SwiftUI

struct AddDocumentView: View {
    @ObservedObject var campaignManager: CampaignManager
    var campaign: Campaign
    @State private var documentTitle: String = ""
    @State private var documentContent: String = ""
    @State private var selectedImage: Data? = nil
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Título do Documento", text: $documentTitle)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                    TextEditor(text: $documentContent)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .frame(height: 150)

                    Button("Selecionar Imagem") {
                        isImagePickerPresented.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                    if let selectedImageData = selectedImage, let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                            .padding(.top)
                    }

                    Button("Salvar Documento") {
                        let newDocument = Document(title: documentTitle, content: documentContent, imageData: selectedImage)
                        if let index = campaignManager.campaigns.firstIndex(where: { $0.id == campaign.id }) {
                            campaignManager.campaigns[index].documents.append(newDocument)
                            campaignManager.saveCampaigns()
                        }
                    }
                    .disabled(documentTitle.isEmpty && documentContent.isEmpty)
                    .padding()
                    .background(documentTitle.isEmpty && documentContent.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
            }
            .navigationTitle("Novo Documento")
            .navigationBarItems(leading: Button("Cancelar") {
                // Implementar lógica de cancelamento
            })
            .background(Color(.systemGray6)) // Cor de fundo da tela
            .cornerRadius(10)
            .imagePicker(isPresented: $isImagePickerPresented, imageData: $selectedImage)
        }
    }
}

// Extensão para facilitar o uso do ImagePicker
extension View {
    func imagePicker(isPresented: Binding<Bool>, imageData: Binding<Data?>) -> some View {
        self.background(
            ImagePicker(isPresented: isPresented, imageData: imageData)
        )
    }
}
