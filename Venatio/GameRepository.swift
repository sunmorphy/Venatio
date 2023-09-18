//
//  GameRepository.swift
//  Venatio
//
//  Created by user236913 on 9/19/23.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
    func getGames(result: @escaping (Result<[GameModel], Error>) -> Void)
    func getDetailGame(id: String, result: @escaping (Result<GameDetailModel, Error>) -> Void)
    func getFavoriteGames(result: @escaping (Result<[GameModel], Error>) -> Void)
    func addFavoriteGame(game: GameModel, result: @escaping (Result<Int, Error>) -> Void)
    func removeFavoriteGame(id: Int, result: @escaping (Result<Int, Error>) -> Void)
}

final class GameRepository: NSObject {
    typealias GameInstance = (RemoteDataSource, LocalDataSource) -> GameRepository
    private var subscriptions: Set<AnyCancellable> = []
    
    fileprivate let remote: RemoteDataSource
    fileprivate let local: LocalDataSource
    
    private init(remote: RemoteDataSource, local: LocalDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: GameInstance = { remote, local in
        return GameRepository(remote: remote, local: local)
    }
}

extension GameRepository: GameRepositoryProtocol {
    func getGames(result: @escaping (Result<[GameModel], Error>) -> Void) {
        self.remote.getGames()
            .sink {[weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .failure(let error):
                    result(.failure(error))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard self != nil else { return }
                result(.success(GameMapper.mapGameResponsesToDomains(input: value.results)))
            }
            .store(in: &subscriptions)
    }
    
    func getDetailGame(id: String, result: @escaping (Result<GameDetailModel, Error>) -> Void) {
        self.remote.getGameDetail(id: id)
            .sink {[weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .failure(let error):
                    result(.failure(error))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard self != nil else { return }
                result(.success(GameDetailMapper.mapGameDetailResponseToDomain(input: value)))
            }
            .store(in: &subscriptions)
    }
    
    func getFavoriteGames(result: @escaping (Result<[GameModel], Error>) -> Void) {
        self.local.getFavoriteGames(completion: { games in
            result(.success(GameMapper.mapGameEntitiesToDomains(input: games)))
        })
    }
    
    func addFavoriteGame(game: GameModel, result: @escaping (Result<Int, Error>) -> Void) {
        self.local.addFavoriteGame(game.id, game.name, game.released, game.image, game.rating, completion: {
            result(.success(game.id))
        })
    }
    
    func removeFavoriteGame(id: Int, result: @escaping (Result<Int, Error>) -> Void) {
        self.local.removeFavoriteGame(id, completion: {
            result(.success(id))
        })
    }
}
