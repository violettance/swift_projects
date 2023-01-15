// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let registerData = try? newJSONDecoder().decode(RegisterData.self, from: jsonData)

import Foundation

// MARK: - RegisterData
struct RegisterData: Codable {
    let user: [UserR]
}

// MARK: - UserR
struct UserR: Codable {
    let durum: Bool
    let mesaj: String
    let kullaniciID: String

    enum CodingKeys: String, CodingKey {
        case durum, mesaj
        case kullaniciID = "kullaniciId"
    }
}
