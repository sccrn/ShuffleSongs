//
//  HomeCell.swift
//  ShuffleSongs
//
//  Created by Samanta Coutinho on 2019-06-11.
//  Copyright © 2019 shuffleSongs. All rights reserved.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var bandName: UILabel!
    
    ///We're passing our model to set up our cell.
    func configure(musicModel: MusicModel) {
        bandName.text = musicModel.bandName 
        musicName.text = musicModel.musicName
        bandImage.image = musicModel.image
        bandImage.layer.cornerRadius = 16.0
        bandImage.clipsToBounds = true
        self.addBottomBorder()
    }
}
