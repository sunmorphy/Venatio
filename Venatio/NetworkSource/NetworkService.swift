//
//  NetworkService.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation
import Combine
import Alamofire

protocol NetworkServiceProtocol {
    func getGames() -> AnyPublisher<GamesResponse, AFError>
    func getGameDetail(id: String) -> AnyPublisher<GameDetaiResponse, AFError>
}

class NetworkService {
    static let shared: NetworkServiceProtocol = NetworkService()
    let baseUrl = "https://api.rawg.io/api"
    let parameters = [
        "key": "ad1fb0551f7f4f1c86eb1809add7b35a"
    ]
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private init() {}
}

extension NetworkService: NetworkServiceProtocol {
    func getGames() -> AnyPublisher<GamesResponse, AFError> {
        return AF.request(URL(string: "\(baseUrl)/games")!, method: .get, parameters: parameters, headers: headers)
            .validate()
            .publishDecodable(type: GamesResponse.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getGameDetail(id: String) -> AnyPublisher<GameDetaiResponse, AFError> {
        AF.request(URL(string: "\(baseUrl)/games/\(id)")!, method: .get, parameters: parameters, headers: headers)
            .validate()
            .publishDecodable(type: GameDetaiResponse.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

