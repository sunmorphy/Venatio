//
//  Contants.swift
//  Venatio
//
//  Created by user236913 on 9/18/23.
//

import Foundation

var apiKey: String {
    get {
        guard let filePath = Bundle.main.path(forResource: "Rawg-info", ofType: "plist") else {
          fatalError("Couldn't find file 'Rawg-info.plist'.")
        }
        
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'Rawg-info.plist'.")
        }
        
        return value
      }
}

let entityName = "GameFavorite"
