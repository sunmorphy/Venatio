//
//  HomeInteractor.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation

protocol HomeUseCase {
    func getGames(completion: @escaping (Result<[GameModel], Error>) -> Void)
}

class HomeInteractor: HomeUseCase {
    private let repository: GameRepositoryProtocol
    
    required init(
        repository: GameRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    func getGames(
        completion: @escaping (Result<[GameModel], Error>) -> Void
    ) {
        repository.getGames(result: { resut in
            completion(resut)
        })
    }
}
