//
//  DetailPresenter.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol DetailPresenter: class {
    
    var interactor: DetailInteractor? { get set }
    var router: DetailRouter? { get set }
    var view: DetailView? { get set }
}
