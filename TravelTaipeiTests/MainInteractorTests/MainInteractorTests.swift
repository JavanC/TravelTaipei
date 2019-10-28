//
//  MainInteractorTests.swift
//  TravelTaipeiTests
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import XCTest
@testable import TravelTaipei

class MainInteractorTests: XCTestCase {

    class FakeApiServices: ApiServices {
        var observable: Observable<[TouristSite]>!
        func touristSites(from: Int, to: Int) -> Observable<[TouristSite]> {
            return observable
        }
    }
    
    struct TouristSitesObserverble {
        static let errorObserverble: Observable<[TouristSite]> = Observable.error(RxCocoaURLError.unknown)
        static let successfulObserverble: Observable<[TouristSite]> = Observable.create { observer in
            observer.onNext(touristSites)
            return Disposables.create()
        }
        static let touristSites = Array(repeating: TouristSite(stitle: "a", xbody: "aa", file: "aaa"), count: 10)
    }
    
    var interactor: MainDefaultInteractor!
    var fakeApiServices = FakeApiServices()
    
    override func setUp() {
        super.setUp()
        self.interactor = MainDefaultInteractor(apiServices: fakeApiServices)
    }

    override func tearDown() {
        self.interactor = nil
        super.tearDown()
    }

    func testLoadWithSeccessReturnTouristSites() {
        let disposeBag = DisposeBag()
        self.fakeApiServices.observable = TouristSitesObserverble.successfulObserverble
        self.interactor.touristSites(from: 0, to: 9).subscribe(onNext: { touristSites in
            XCTAssertEqual(touristSites.count, TouristSitesObserverble.touristSites.count)
        }, onError: { error in
            XCTFail("should be case success instead failure")
        }).disposed(by: disposeBag)
    }

    func testLoadWithErrorReturnError() {
        let disposeBag = DisposeBag()
        self.fakeApiServices.observable = TouristSitesObserverble.errorObserverble
        self.interactor.touristSites(from: 0, to: 9).subscribe(onNext: { touristSites in
            XCTFail("should be case failure instead success")
        }, onError: { error in
            XCTAssertEqual(error.localizedDescription, RxCocoaURLError.unknown.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
