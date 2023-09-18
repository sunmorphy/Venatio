//
//  FavoriteViewModel.swift
//  Venatio
//
//  Created by user236913 on 9/17/23.
//

import Foundation

final class FavoriteViewModel: ObservableObject {
    @Published var dataState: DataState<[GameModel]> = .idle
    
    private let favoriteUseCase: FavoriteUseCase
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func fetchFavoriteGames() {
        self.dataState = .loading
        favoriteUseCase.getFavoriteGames(completion: { result in
            switch result {
            case .success(let games):
                self.dataState = .success(games)
            case .failure(let error):
                self.dataState = .error(message: error.localizedDescription)
            }
        })
    }
}
