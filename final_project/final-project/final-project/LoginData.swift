// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginData = try? newJSONDecoder().decode(LoginData.self, from: jsonData)

import Foundation

// MARK: - LoginData
struct LoginData: Codable {
    let user: [User]
}

// MARK: - User
struct User: Codable {
    let durum: Bool
    let mesaj: String
    let bilgiler: Bilgiler? // ? for nullable
}

// MARK: - Bilgiler
struct Bilgiler: Codable {
    let userID, userName, userSurname, userEmail: String
    let userPhone, face, faceID: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case userName, userSurname, userEmail, userPhone, face, faceID
    }
}
