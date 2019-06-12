//
//  Array.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-12.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

extension Array {
    /// Picks n random elements
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}
