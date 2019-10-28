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
        self.view?.displayLoading()
        self.interactor?.touristSites(from: 0, to: 9)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { touristSites in
                self.view?.hideLoading()
                self.view?.display(touristSites: touristSites)
            }, onError: { error in
                self.view?.hideLoading()
                self.view?.display(error: error)
            }).disposed(by: disposeBag)
    }
    
    func touristSites(from startIndex: Int, to endIndex: Int) {
        self.interactor?.touristSites(from: startIndex, to: endIndex)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { touristSites in
            self.view?.display(touristSites: touristSites)
        }, onError: { error in
            self.view?.display(error: error)
        }).disposed(by: disposeBag)
    }
}
