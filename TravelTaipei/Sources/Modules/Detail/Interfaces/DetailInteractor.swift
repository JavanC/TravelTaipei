//
//  DetailInteractor.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol DetailInteractor: class {
    
    var presenter: DetailPresenter? { get set }
    
    var touristSite: TouristSite? { get set }
    var imageIndex: Int? { get set }
}
