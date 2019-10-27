//
//  MainView.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol MainView: class {
    
    var presenter: MainPresenter? { get set }
    
    func display(touristSites: [TouristSite])
}
