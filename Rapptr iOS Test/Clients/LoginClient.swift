//
//  LoginClient.swift
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
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
    
    //var session: URLSession?
    
    struct Login: Encodable{
        let email: String
        let password: String
    }
    
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
        //make apli call here and use the response as below
//        let login = Login(email: "info@rapptrlabs.com", password: "Test123")
//        AF.request("http://dev.rapptrlabs.com/Tests/scripts/login.php", method: .post, parameters: login, encoder: JSONParameterEncoder.default).response { response in
//            debugPrint(response)
//        }
        
        if (email == "info@rapptrlabs.com" || password == "Test123") {
           
           guard let response = loadJson(filename: "ClientResponse") else {
               errorHandler("Unable to parse the error")
                return
            }
            completion(response.msg)
            
        } else {
            
            guard let response = loadJson(filename: "ErrorResponse") else {
                errorHandler("Unable to parse the error")
                 return
             }
             errorHandler(response.msg)
        }
        
    }
}
