//
//  MainDefaultPresenter.swift
//  
//
//  Created by Javan on 2019/10/25.
//

import Foundation

class MainDefaultPresneter {
    
    var router: MainRouter?
    var interactor: MainInteractor?
    weak var view: MainView?
}

extension MainDefaultPresneter: MainPresenter {
    
}
