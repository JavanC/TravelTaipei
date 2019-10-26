//
//  MainDefaultPresenter.swift
//  
//
//  Created by Javan on 2019/10/25.
//

import Foundation
import RxSwift

class MainDefaultPresneter {
    
    var router: MainRouter?
    var interactor: MainInteractor?
    weak var view: MainView?
    var disposeBag = DisposeBag()
}

extension MainDefaultPresneter: MainPresenter {
    
    func viewDidLoad() {
        // View Loading
        self.interactor?.touristSites().subscribe(onNext: { touristSites in
            
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
}
