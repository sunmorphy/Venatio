//
//  BaseResponse.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation

enum DataState<T> {
    case idle
    case loading
    case success(T)
    case error(message: String)
}
