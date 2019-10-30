//
//  DetailDefaultView.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DetailDefaultView: UIViewController {
    
    var presenter: DetailPresenter?
    var scrollView: UIScrollView!
    var detailView: TouristSiteDetailView!
    private var imageUrlList: [String]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureScrollView()
        self.presenter?.reload()
    }
    
    // MARK: - Configure
    func configureView() {
        self.view.backgroundColor = .white
    }
    
    func configureScrollView() {
        self.scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        self.scrollView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
        
        self.detailView = TouristSiteDetailView()
        self.scrollView.addSubview(detailView)
        self.detailView.snp.makeConstraints { maker in
            maker.edges.equalTo(scrollView)
            maker.width.equalTo(view)
        }
    }
}

extension DetailDefaultView: DetailView {
    
    func setup(with touristSite: TouristSite, imageIndex: Int) {
        self.title = touristSite.stitle
        self.detailView.configure(touristSite: touristSite, imageIndex: imageIndex)
    }
}
