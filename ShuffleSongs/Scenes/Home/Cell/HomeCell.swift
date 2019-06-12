//
//  HomeCell.swift
//  ShuffleSongs
//
//  Created by Guarana on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var bandName: UILabel!
    
    func configure(musicModel: MusicModel) {
        bandName.text = musicModel.bandName
        musicName.text = musicModel.musicName
        bandImage.load(url: URL(string: musicModel.imageUrl))
        self.addBottomBorder()
    }
}
