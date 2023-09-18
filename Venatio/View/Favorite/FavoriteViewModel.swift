//
//  FavoriteViewModel.swift
//  Venatio
//
//  Created by user236913 on 9/17/23.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    @Published var dataState: DataState<[Result]> = .idle
    
    var gameProvider: GameProvider
    
    init(gameProvider: GameProvider = GameProvider.shared) {
        self.gameProvider = gameProvider
    }
    
    func fetchFavoriteGames() {
        self.dataState = .loading
        gameProvider.getFavoriteGames(completion: { result in
            DispatchQueue.main.async {
                self.dataState = .success(result)
            }
        })
    }
}
