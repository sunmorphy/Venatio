//
//  HomeViewModel.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var dataState: DataState<[GameModel]> = .idle

    private let homeUseCase: HomeUseCase
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func fetchGames() {
        self.dataState = .loading
        homeUseCase.getGames(completion: { result in
            switch result {
            case .success(let games):
                self.dataState = .success(games)
            case .failure(let error):
                self.dataState = .error(message: error.localizedDescription)
            }
        })
    }
}
