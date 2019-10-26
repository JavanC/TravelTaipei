//
//  MainModule.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit

class MainModule {
    
    func buildDefault() -> UIViewController {
        let view = MainDefaultView()
        let interactor = MainDefaultInteractor(apiServices: App.shared.apiServices)
        let presenter = MainDefaultPresneter()
        let router = MainDefaultRouter()
        
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
