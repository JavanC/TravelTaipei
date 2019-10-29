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
    
    private var touristSites: [TouristSite] = []
    private var disposeBag = DisposeBag()
}

extension MainDefaultPresneter: MainPresenter {
    
    var touristSiteCount: Int {
        return touristSites.count
    }
    
    func touristSite(at index: Int) -> TouristSite? {
        return touristSites[index]
    }
    
    func loadNextTouristSites(count: Int) {
        if touristSiteCount == 0 {
            self.view?.displayLoading()
        }
        
        let startIndex = touristSiteCount
        let endIndex = startIndex + count - 1
        self.interactor?.loadTouristSites(from: startIndex, to: endIndex)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { touristSites in
                // Setup IndexPaths
                let initialIndex = self.touristSiteCount
                var indexPaths: [IndexPath] = []
                for index in 0..<touristSites.count {
                    let indexPath = IndexPath(item: initialIndex + index, section: 0)
                    indexPaths.append(indexPath)
                }
                // Add new tourist sites
                self.touristSites += touristSites
                self.view?.displayTouristSites(insertRowsAt: indexPaths)
            }, onError: { error in
                self.view?.display(error: error)
            }, onCompleted: {
                self.view?.hideLoading()
            }).disposed(by: disposeBag)
    }
    
    func didSelect(_ touristSite: TouristSite, imageIndex: Int) {
        self.router?.showDetail(for: touristSite, imageIndex: imageIndex)
    }
}
