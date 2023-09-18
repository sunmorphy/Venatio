//
//  DetailViewModel.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var dataState = DataState<GameDetaiResponse>.idle
    @Published var isGameFavorited: Bool = false
    
    private var subscriptions: Set<AnyCancellable> = []
    var networkService: NetworkServiceProtocol
    var gameProvider: GameProvider
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared, gameProvider: GameProvider = GameProvider.shared) {
        self.networkService = networkService
        self.gameProvider = gameProvider
    }
    
    func fetchGameDetail(id: String) {
        self.dataState = .loading
        networkService.getGameDetail(id: id)
            .sink {[weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.dataState = .error(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.dataState = .success(value)
            }
            .store(in: &subscriptions)
    }
    
    func fetchFavoriteGames(id: String) {
        self.dataState = .loading
        gameProvider.getFavoriteGames(completion: { result in
            DispatchQueue.main.async {
                self.isGameFavorited = result.contains(where: { $0.id.description == id })
                self.fetchGameDetail(id: id)
            }
        })
    }
    
    func addFavoriteGame(game: Result) {
        self.dataState = .loading
        gameProvider.addFavoriteGame(game.id, game.name, game.released, game.backgroundImage, game.rating, completion: {
            self.fetchFavoriteGames(id: game.id.description)
        })
    }
    
    func removeFavoriteGame(id: Int) {
        self.dataState = .loading
        gameProvider.removeFavoriteGame(id, completion: {
            DispatchQueue.main.async {
                self.fetchFavoriteGames(id: id.description)
            }
        })
    }
}
