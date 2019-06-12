//
//  Music.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

struct Response: Codable {
    let results: [Music]
}

struct Music: Codable {
    let artworkUrl: String?
    let trackName: String?
    let artistId: Int?
    let artistName: String?
}
