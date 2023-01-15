// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stUserRegister = try? newJSONDecoder().decode(StUserRegister.self, from: jsonData)

import Foundation

// MARK: - StUserRegister
struct StUserRegister: Codable {
    let userR: [UserR]
}

// MARK: - User
struct UserR: Codable {
    let durum: Bool
    let mesaj: String
}
