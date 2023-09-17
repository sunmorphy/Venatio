//
//  BaseResponse.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import Foundation

enum DataState<T> {
    case Idle
    case Loading
    case Success(T)
    case Error(message: String)
}
