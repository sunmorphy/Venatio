//
//  GameDetailModel.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

struct GameDetailModel: Equatable, Identifiable {
    let id: Int
    let name, released, image, description: String
    let rating: Double
    let genres: [GenreModel]
}

struct GenreModel: Equatable, Identifiable {
    let id: Int
    let name: String
}
