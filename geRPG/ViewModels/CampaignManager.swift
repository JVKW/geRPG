import Foundation

class CampaignManager: ObservableObject {
    @Published var campaigns: [Campaign] = []
    
    private let fileName = "campaigns.json"

    init() {
        loadCampaigns()
    }

    func saveCampaigns() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(campaigns) {
            if let url = getDocumentsDirectory()?.appendingPathComponent(fileName) {
                try? data.write(to: url)
            }
        }
    }

    func loadCampaigns() {
        let decoder = JSONDecoder()
        if let url = getDocumentsDirectory()?.appendingPathComponent(fileName) {
            if let data = try? Data(contentsOf: url) {
                if let loadedCampaigns = try? decoder.decode([Campaign].self, from: data) {
                    campaigns = loadedCampaigns
                }
            }
        }
    }

    private func getDocumentsDirectory() -> URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
