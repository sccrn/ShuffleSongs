//
//  SSError.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

enum SSError: Error {
    case apiError
    case invalidResponse
    case noData
    case decodeError
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .apiError: return Constants.apiError
        case .invalidResponse: return Constants.invalidResponse
        case .noData: return Constants.noData
        case .decodeError: return Constants.decodeError
        case .unknown: return Constants.unknown
        }
    }
}
