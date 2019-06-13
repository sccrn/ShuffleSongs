//
//  Music.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

///Our type of Response, we're just using the results that's why we don't need
///implement the resultCount
struct Response: Codable {
    let results: [Music]
}

///Same thing in here, the only things that we're using for our project are these
///values for our response.
struct Music: Codable {
    let id: Int
    let artworkUrl: String?
    let trackName: String?
    let artistId: Int?
    let artistName: String?
}
