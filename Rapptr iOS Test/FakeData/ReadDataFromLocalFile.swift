//
//  ReadDataFromLocalFile.swift
//  Rapptr iOS Test
//
//  Created by Louis Harris on 3/23/22.
//

import Foundation


func loadJson(filename fileName: String) -> Response? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Response.self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
