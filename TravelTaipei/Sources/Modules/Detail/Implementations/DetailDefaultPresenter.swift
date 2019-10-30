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
}

extension DetailDefaultPresenter: DetailPresenter {
    
    func reload() {
        if let touristSite = interactor?.touristSite, let imageIndex = interactor?.imageIndex {
            self.view?.setup(with: touristSite, imageIndex: imageIndex)
        }
    }
}
