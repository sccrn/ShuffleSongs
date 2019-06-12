//
//  SSError.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

enum SSError: Error {
    case apiError
    case invalidResponse
    case noData
    case decodeError
    case unknown
}
