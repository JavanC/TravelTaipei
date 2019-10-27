//
//  TouristSiteTableViewCell.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/27.
//  Copyright © 2019 Javan. All rights reserved.
//

import UIKit

class TouristSiteTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var discription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(touristSit: TouristSite) {
        self.title.text = touristSit.stitle
        self.discription.text = touristSit.xbody
    }
}
