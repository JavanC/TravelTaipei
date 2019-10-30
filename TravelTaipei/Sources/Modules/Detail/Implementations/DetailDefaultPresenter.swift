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
    
    init(touristSite: TouristSite) {
        self.touristSite = touristSite
    }
}

extension DetailDefaultPresenter: DetailPresenter {
    
}
