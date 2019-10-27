//
//  MainDefaultInteractor.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

class MainDefaultInteractor {
    
    weak var presenter: MainPresenter?
    let apiServices: ApiServices
    
    init(apiServices: ApiServices) {
        self.apiServices = apiServices
    }
}

extension MainDefaultInteractor: MainInteractor {
    
    func touristSites(from startIndex: Int, to endIndex: Int) -> Observable<[TouristSite]> {
        return self.apiServices.touristSites(from: startIndex, to: endIndex)
    }
}
