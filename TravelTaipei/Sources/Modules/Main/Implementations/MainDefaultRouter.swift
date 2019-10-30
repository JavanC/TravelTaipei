//
//  MainDefaultRouter.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit

class MainDefaultRouter {
    
    weak var presenter: MainPresenter?
    weak var viewController: UIViewController?
}

extension MainDefaultRouter: MainRouter {
    
    func showDetail(for touristSite: TouristSite, imageIndex: Int) {
        let viewController = DetailModule().buildDefault(with: touristSite)
        self.viewController?.show(viewController, sender: nil)
    }
}
