//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation
import Alamofire

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    
    var session: URLSession?
    
    func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
        //let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")
        AF.request("http://dev.rapptrlabs.com/Tests/scripts/chat_log.php").responseDecodable(of: Messages.self) { response in
            debugPrint(response)
            guard let messages = response.value as? Messages else {
                errorHandler("Error whlle decoding the message")
                return
            }
            completion(messages.messages)
        }
    }
}
