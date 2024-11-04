import Foundation

struct Document: Codable, Identifiable {
    var id = UUID()
    var title: String
    var content: String
    var imageData: Data?
}

struct Campaign: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String = ""
    var importantCharacters: [Character] = []
    var sessionNotes: String = ""
    var documents: [Document] = []
}

struct Character: Codable, Identifiable {
    var id = UUID()
    var name: String
    var story: String = ""
    var appearance: String = ""
    var goals: String = ""
}
