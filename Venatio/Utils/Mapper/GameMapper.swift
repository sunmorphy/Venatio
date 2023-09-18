//
//  GameDetailMapper.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

final class GameMapper {
    static func mapGameResponsesToDomains(
        input gameResponses: [Game]
    ) -> [GameModel] {
        return gameResponses.map { result in
            return GameModel(id: result.id, name: result.name, released: result.released, image: result.backgroundImage, rating: result.rating)
        }
    }
    
    static func mapGameEntitiesToDomains(
        input gameEntities: [Game]
    ) -> [GameModel] {
        return gameEntities.map { result in
            return GameModel(id: result.id, name: result.name, released: result.released, image: result.backgroundImage, rating: result.rating)
        }
    }
    
    static func mapDomainToGameEntity(
        input game: GameModel
    ) -> Game {
        return Game(id: game.id, name: game.name, released: game.released, backgroundImage: game.image, rating: game.rating)
    }
}
