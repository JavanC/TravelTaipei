//
//  MainPresenter.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol MainPresenter: class {
    
    var router: MainRouter? { get set }
    var interactor: MainInteractor? { get set }
    var view: MainView? { get set }
    
    var touristSiteCount: Int { get }
    func touristSite(at index: Int) -> TouristSite?
    func loadNextTouristSites(count: Int)
    func didSelect(_ touristSite: TouristSite, imageIndex: Int)
}
