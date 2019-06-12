//
//  MusicModel.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation

class MusicModel {
    var imageUrl: String
    var musicName: String
    var bandName: String
    
    init(music: Music) {
        self.bandName = music.artistName ?? ""
        self.imageUrl = music.artworkUrl ?? ""
        self.musicName = music.trackName ?? ""
    }
}
