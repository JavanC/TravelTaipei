//
//  TouristSiteTableViewCell.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/27.
//  Copyright © 2019 Javan. All rights reserved.
//

import UIKit

protocol TouristSiteTableViewCellDelegate {
    func select(cellIndex: Int, imageIndex: Int)
}

class TouristSiteTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: TouristSiteTableViewCellDelegate?
    private var cellIndex: Int?
    private var imageUrlList: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize.height = 150
        layout.itemSize.width = 200
        self.collectionView.collectionViewLayout = layout
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        let nib = UINib(nibName: "TouristImageCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "imgCell")
    }
    
    func configure(touristSite: TouristSite?, indexPath: IndexPath) {
        self.title.text = touristSite?.stitle
        self.discription.text = touristSite?.xbody
        self.imageUrlList = touristSite?.imageUrlList
        self.cellIndex = indexPath.row
    }
}

extension TouristSiteTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrlList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath) as! TouristImageCollectionViewCell
        cell.configure(imageUrl: imageUrlList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cellIndex = cellIndex {
            self.delegate?.select(cellIndex: cellIndex, imageIndex: indexPath.row)
        }
    }
}
