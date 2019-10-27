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
    var disposeBag = DisposeBag()
}

extension MainDefaultPresneter: MainPresenter {
    
    func viewDidLoad() {
        // View Loading
        self.interactor?.touristSites()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { touristSites in
            self.view?.display(touristSites: touristSites)
        }, onError: { error in
            // View show error
            print(error)
        }).disposed(by: disposeBag)
    }
}
