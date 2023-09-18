//
//  DetailViewModel.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var dataState = DataState<GameDetailModel>.idle
    @Published var isGameFavorited: Bool = false
    
    private let detailUseCase: DetailUseCase
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func fetchGameDetail(id: String) {
        self.dataState = .loading
        detailUseCase.getDetailGame(id: id, completion: { result in
            switch result {
            case .success(let game):
                self.dataState = .success(game)
            case .failure(let error):
                self.dataState = .error(message: error.localizedDescription)
            }
        })
    }
    
    func fetchFavoriteGames(id: String) {
        self.dataState = .loading
        detailUseCase.getFavoriteGames(completion: { result in
            switch result {
            case .success(let games):
                DispatchQueue.main.async {
                    self.isGameFavorited = games.contains(where: { $0.id.description == id })
                    self.fetchGameDetail(id: id)
                }
            case .failure(let error):
                self.dataState = .error(message: error.localizedDescription)
            }
        })
    }
    
    func addFavoriteGame(game: GameModel) {
        self.dataState = .loading
        detailUseCase.addFavoriteGame(game: game, completion: { result in
            switch result {
            case .success(_):
                self.fetchFavoriteGames(id: game.id.description)
            case .failure(let error):
                self.dataState = .error(message: error.localizedDescription)
            }
        })
    }
    
    func removeFavoriteGame(id: Int) {
        self.dataState = .loading
        detailUseCase.removeFavoriteGame(id: id, completion: { result in
            switch result {
            case .success(_):
                self.fetchFavoriteGames(id: id.description)
            case .failure(let error):
                self.dataState = .error(message: error.localizedDescription)
            }
        })
    }
}
