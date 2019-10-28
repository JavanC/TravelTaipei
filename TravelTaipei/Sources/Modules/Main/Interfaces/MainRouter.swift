//
//  MainRouter.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol MainRouter: class {
    
    var presenter: MainPresenter? { get set }
    
    func showDetail(for: TouristSite, imageIndex: Int)
}
