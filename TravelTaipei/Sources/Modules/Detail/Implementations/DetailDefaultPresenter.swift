//
//  DetailDefaultPresenter.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

class DetailDefaultPresenter {
    
    var interactor: DetailInteractor?
    var router: DetailRouter?
    weak var view: DetailView?
    
    let touristSite: TouristSite
    let imageIndex: Int
    
    init(touristSite: TouristSite, imageIndex: Int) {
        self.touristSite = touristSite
        self.imageIndex = imageIndex
    }
}

extension DetailDefaultPresenter: DetailPresenter {
    
    func reload() {
        self.view?.setup(with: touristSite, imageIndex: imageIndex)
    }
}
