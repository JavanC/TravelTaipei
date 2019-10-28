//
//  MainInteractor.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol MainInteractor: class {
    
    var presenter: MainPresenter? { get set }

    func loadTouristSites(from startIndex: Int, to endIndex: Int) -> Observable<[TouristSite]>
}
