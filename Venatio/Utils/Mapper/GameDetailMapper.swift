//
//  GameMapper.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

final class GameDetailMapper {
    static func mapGenreResponsesToDomains(
        input genreResponses: [Developer]
    ) -> [GenreModel] {
        return genreResponses.map { genre in
            GenreModel(id: genre.id, name: genre.name)
        }
    }
    
    static func mapGameDetailResponseToDomain(
        input gameDetailResponses: GameDetaiResponse
    ) -> GameDetailModel {
        return GameDetailModel(id: gameDetailResponses.id, name: gameDetailResponses.nameOriginal, released: gameDetailResponses.released, image: gameDetailResponses.backgroundImage, description: gameDetailResponses.descriptionRaw, rating: gameDetailResponses.rating, genres: mapGenreResponsesToDomains(input: gameDetailResponses.genres))
    }
}
