// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orderForm = try? newJSONDecoder().decode(OrderForm.self, from: jsonData)

import Foundation

// MARK: - OrderForm
struct OrderForm: Codable {
    let order: [Order]
}

// MARK: - Order
struct Order: Codable {
    let durum: Bool
    let mesaj: String
}
