//
//  TouristSiteDetailView.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import UIKit

class TouristSiteDetailView: XibView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    private var imageUrlList: [String]?
    
    func configure(touristSite: TouristSite?, imageIndex: Int) {
        // Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize.height = collectionView.bounds.height
        layout.itemSize.width = collectionView.bounds.width
        self.collectionView.collectionViewLayout = layout
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        let nib = UINib(nibName: "TouristImageCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "imgCell")
        
        // Tourist info
        self.titleLabel.text = touristSite?.stitle
        self.descriptionLabel.text = touristSite?.xbody
        self.imageUrlList = touristSite?.imageUrlList
        
        // Page Control
        let indexPath = IndexPath(row: imageIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        self.pageControl.currentPage = imageIndex
    }
}

extension TouristSiteDetailView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = imageUrlList?.count ?? 0
        self.pageControl.numberOfPages = count
        self.pageControl.isHidden = !(count > 1)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath) as! TouristImageCollectionViewCell
        cell.configure(imageUrl: imageUrlList?[indexPath.row])
        return cell
    }
}

extension TouristSiteDetailView: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.pageControl?.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
