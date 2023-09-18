//
//  FavoriteInteractor.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

protocol FavoriteUseCase {
    func getFavoriteGames(completion: @escaping (Result<[GameModel], Error>) -> Void)
}

class FavoriteInteractor: FavoriteUseCase {
    private let repository: GameRepositoryProtocol
    
    required init(
        repository: GameRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    func getFavoriteGames(completion: @escaping (Result<[GameModel], Error>) -> Void) {
        repository.getFavoriteGames(result: { result in
            completion(result)
        })
    }
}
