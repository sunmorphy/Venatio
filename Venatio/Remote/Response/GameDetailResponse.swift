//
//  GameDetailResponse.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameDetaiResponse = try? JSONDecoder().decode(GameDetaiResponse.self, from: jsonData)

import Foundation

// MARK: - GameDetaiResponse
struct GameDetaiResponse: Codable {
    let id: Int
    let slug, name, nameOriginal, description: String
    let released: String
    let backgroundImage, backgroundImageAdditional: String
    let rating: Double
    let genres: [Developer]
    let descriptionRaw: String

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description
        case released
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case rating
        case genres
        case descriptionRaw = "description_raw"
    }
}

// MARK: - Developer
struct Developer: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
