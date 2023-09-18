//
//  NetworkService.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol {
    func getGames() -> AnyPublisher<GamesResponse, AFError>
    func getGameDetail(id: String) -> AnyPublisher<GameDetaiResponse, AFError>
}

class RemoteDataSource {
    static let shared: RemoteDataSource = RemoteDataSource()
    let baseUrl = "https://api.rawg.io/api"
    let parameters = [
        "key": apiKey
    ]
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private init() {}
}

extension RemoteDataSource: RemoteDataSourceProtocol {
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

