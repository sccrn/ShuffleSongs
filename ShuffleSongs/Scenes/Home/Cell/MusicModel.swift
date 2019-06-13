//
//  MusicModel.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

class MusicModel {
    var id: Int
    var imageUrl: String
    var musicName: String
    var bandName: String
    var image: UIImage?
    
    init(music: Music) {
        self.id = music.id
        self.bandName = music.artistName ?? ""
        self.imageUrl = music.artworkUrl ?? ""
        self.musicName = music.trackName ?? ""
        self.image = loadImage(urlString: music.artworkUrl)
    }
    ///Usually I use SWDImage, but we can use the Swift's Data(contentsOf) 
    func loadImage(urlString: String?) -> UIImage? {
        do {
            guard let url = URL(string: urlString ?? "") else { return nil }
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        }
        catch { return nil }
    }
}
