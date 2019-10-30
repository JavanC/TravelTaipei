//
//  DetailModule.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit

class DetailModule {
    
    func buildDefault(with touristSite: TouristSite) -> UIViewController {
        let view = DetailDefaultView()
        let interactor = DetailDefaultInteractor()
        let presenter = DetailDefaultPresenter(touristSite: touristSite)
        let router = DetailDefaultRouter()

        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.presenter = presenter
        router.viewController = view
        
        return view
    }
}