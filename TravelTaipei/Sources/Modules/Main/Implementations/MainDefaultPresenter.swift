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
        self.touristSites(from: 0, to: 3)
    }
    
    func touristSites(from startIndex: Int, to endIndex: Int) {
        // View Loading
        self.interactor?.touristSites(from: startIndex, to: endIndex)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { touristSites in
            self.view?.display(touristSites: touristSites)
        }, onError: { error in
            // View show error
            print(error)
        }).disposed(by: disposeBag)
    }
}
