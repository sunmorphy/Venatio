//
//  DetailViewModel.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var dataState = DataState<GameDetaiResponse>.Idle
    
    private var subscriptions: Set<AnyCancellable> = []
    var networkService: NetworkServiceProtocol
    
    init (networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func fetchGameDetail(id: String) {
        self.dataState = .Loading
        networkService.getGameDetail(id: id)
            .sink {[weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.dataState = .Error(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.dataState = .Success(value)
            }
            .store(in: &subscriptions)
    }
}
