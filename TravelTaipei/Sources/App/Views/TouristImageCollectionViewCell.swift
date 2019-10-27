//
//  TouristImageCollectionViewCell.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/27.
//  Copyright © 2019 Javan. All rights reserved.
//

import UIKit
import Kingfisher

class TouristImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(imageUrl: String) {
        let url = URL(string: imageUrl)
        self.imageView.kf.setImage(with: url)
    }
}
