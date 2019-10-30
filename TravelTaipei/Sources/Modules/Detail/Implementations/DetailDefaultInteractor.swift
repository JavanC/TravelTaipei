//
//  DetailDefaultInteractor.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

class DetailDefaultInteractor {
    
    weak var presenter: DetailPresenter?
    
    var touristSite: TouristSite?
    var imageIndex: Int?
}

extension DetailDefaultInteractor: DetailInteractor {
    
}
