//
//  GamesResponse.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gamesResponse = try? JSONDecoder().decode(GamesResponse.self, from: jsonData)

import Foundation

// MARK: - GamesResponse
struct GamesResponse: Codable {
    let count: Int
    let next: String
    let results: [Game]
    let description: String

    enum CodingKeys: String, CodingKey {
        case count, next, results
        case description
    }
}

// MARK: - Result
struct Game: Codable {
    let id: Int
    let name, released: String
    let backgroundImage: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
