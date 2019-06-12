//
//  Array.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-12.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

extension Array {
    /// Picks 'number' random elements
    func randomPick(number: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - number - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(number))
    }
}
