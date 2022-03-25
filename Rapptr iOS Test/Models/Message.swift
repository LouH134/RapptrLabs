//
//  Message.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

// MARK: - Message
struct Messages: Codable {
    let messages: [Message]

    enum CodingKeys: String, CodingKey {
        case messages = "data"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDatum { response in
//     if let message = response.result.value {
//       ...
//     }
//   }

// MARK: - Datum
struct Message: Codable {
    let userID: String
    let name: String
    let avatarURL: String
    let message: String

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name = "name"
        case avatarURL = "avatar_url"
        case message = "message"
    }
}
