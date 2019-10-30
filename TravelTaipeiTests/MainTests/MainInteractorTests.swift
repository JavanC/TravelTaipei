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

    // MARK: - Mock
    class FakeApiServices: ApiServices {
        var observable: Observable<[TouristSite]>!
        func touristSites(from: Int, to: Int) -> Observable<[TouristSite]> {
            return observable
        }
    }
    
    struct TouristSitesObserverble {
        static let error: Observable<[TouristSite]> = Observable.error(RxCocoaURLError.unknown)
        static func successful(count: Int) -> Observable<[TouristSite]> {
            return  Observable.create { observer in
                observer.onNext(touristSites(count: count))
                observer.onCompleted()
                return Disposables.create()
            }
        }
        static func touristSites(count: Int) -> [TouristSite] {
            return Array(repeating: TouristSite(stitle: "a", xbody: "aa", file: "aaa"), count: count)
        }
    }
    
    // MARK: - Setup
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

    // MARK: - Tests
    func testLoadTouristSitesSeccessful() {
        let disposeBag = DisposeBag()
        self.fakeApiServices.observable = TouristSitesObserverble.successful(count: 10)
        self.interactor.loadTouristSites(from: 0, to: 9).subscribe(onNext: { touristSites in
            XCTAssertEqual(touristSites.count, 10)
        }, onError: { error in
            XCTFail("should be case success instead failure")
        }).disposed(by: disposeBag)
    }

    func testLoadTouristSitesError() {
        let disposeBag = DisposeBag()
        self.fakeApiServices.observable = TouristSitesObserverble.error
        self.interactor.loadTouristSites(from: 0, to: 9).subscribe(onNext: { touristSites in
            XCTFail("should be case failure instead success")
        }, onError: { error in
            XCTAssertEqual(error.localizedDescription, RxCocoaURLError.unknown.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
