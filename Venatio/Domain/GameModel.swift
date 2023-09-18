//
//  GameModel.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

struct GameModel: Equatable, Identifiable {
    let id: Int
    let name, released, image: String
    let rating: Double
}
