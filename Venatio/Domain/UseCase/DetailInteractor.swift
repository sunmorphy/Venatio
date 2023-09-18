//
//  DetailInteractor.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

protocol DetailUseCase {
    func getDetailGame(id: String, completion: @escaping (Result<GameDetailModel, Error>) -> Void)
    func getFavoriteGames(completion: @escaping (Result<[GameModel], Error>) -> Void)
    func addFavoriteGame(game: GameModel, completion: @escaping (Result<Int, Error>) -> Void)
    func removeFavoriteGame(id: Int, completion: @escaping (Result<Int, Error>) -> Void)
}

class DetailInteractor: DetailUseCase {
    private let repository: GameRepositoryProtocol
    
    required init(
        repository: GameRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    func getDetailGame(id: String, completion: @escaping (Result<GameDetailModel, Error>) -> Void) {
        repository.getDetailGame(id: id, result: { result in
            completion(result)
        })
    }
    
    func getFavoriteGames(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        repository.getFavoriteGames(result: { result in
            completion(result)
        })
    }
    
    func addFavoriteGame(game: GameModel, completion: @escaping (Result<Int, Error>) -> Void) {
        repository.addFavoriteGame(game: game, result: { result in
            completion(result)
        })
    }
    
    func removeFavoriteGame(id: Int, completion: @escaping (Result<Int, Error>) -> Void) {
        repository.removeFavoriteGame(id: id, result: { result in
            completion(result)
        })
    }
}
