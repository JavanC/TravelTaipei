//
//  MainPresenterTests.swift
//  TravelTaipeiTests
//
//  Created by Javan on 2019/10/28.
//  Copyright © 2019 Javan. All rights reserved.
//

import XCTest
@testable import TravelTaipei

class MainPresenterTests: XCTestCase {
    
    // MARK: - Mock
    class MockInteractor: MainInteractor {
        var presenter: MainPresenter?
        var observable: Observable<[TouristSite]>!
        func loadTouristSites(from startIndex: Int, to endIndex: Int) -> Observable<[TouristSite]> {
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
    
    class MockRouter: MainRouter {
        var presenter: MainPresenter?
        var touristSite: TouristSite?
        var imageIndex: Int?
        
        func showDetail(for touristSite: TouristSite, imageIndex: Int) {
            self.touristSite = touristSite
            self.imageIndex = imageIndex
        }
    }
    
    class MockView: MainView {
        var presenter: MainPresenter?
        var insertTouristSitesPromise: XCTestExpectation?
        var showErrorPromise: XCTestExpectation?
        var showLoadingPromise: XCTestExpectation?
        var hideLoadingPromise: XCTestExpectation?
        
        func displayTouristSites(insertRowsAt indexPaths: [IndexPath]) {
            self.insertTouristSitesPromise?.fulfill()
        }
        
        func display(error: Error) {
            self.showErrorPromise?.fulfill()
        }
        
        func displayLoading() {
            self.showLoadingPromise?.fulfill()
        }
        
        func hideLoading() {
            self.hideLoadingPromise?.fulfill()
        }
    }
    
    // MARK: - Setup
    var presenter: MainDefaultPresneter!
    var mockInteractor = MockInteractor()
    var mockRouter = MockRouter()
    var mockView = MockView()
    
    override func setUp() {
        super.setUp()
        self.presenter = MainDefaultPresneter()
        self.presenter.interactor = mockInteractor
        self.presenter.router = mockRouter
        self.presenter.view = mockView
    }

    override func tearDown() {
        self.presenter = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testTouristSiteCountIs10() {
        let promise = expectation(description: "Should insert tourist sites")
        self.mockView.insertTouristSitesPromise = promise
        self.mockInteractor.observable = TouristSitesObserverble.successful(count: 10)
        self.presenter.loadNextTouristSites(count: 10)
        wait(for: [promise], timeout: 1)
        XCTAssertEqual(presenter.touristSiteCount, 10)
    }

    func testTouristSiteAtIndexIsInjected() {
        let promise = expectation(description: "Should insert tourist sites")
        self.mockView.insertTouristSitesPromise = promise
        self.mockInteractor.observable = TouristSitesObserverble.successful(count: 10)
        self.presenter.loadNextTouristSites(count: 10)
        wait(for: [promise], timeout: 1)
        let touristSite = presenter.touristSite(at: 0)
        let fakeTouristSite = TouristSitesObserverble.touristSites(count: 1).first
        XCTAssertEqual(touristSite?.stitle, fakeTouristSite?.stitle)
        XCTAssertEqual(touristSite?.xbody, fakeTouristSite?.xbody)
        XCTAssertEqual(touristSite?.file, fakeTouristSite?.file)
    }
    
    func testLoadTouristSitesSuccessfulShouldInsert() {
        let promise = expectation(description: "Should insert tourist sites")
        self.mockView.insertTouristSitesPromise = promise
        self.mockInteractor.observable = TouristSitesObserverble.successful(count: 1)
        self.presenter.loadNextTouristSites(count: 1)
        wait(for: [promise], timeout: 1)
    }
    
    func testLoadTouristSitesSuccessfulShouldShowLoading() {
        let promise = expectation(description: "Should show loading")
        self.mockView.showLoadingPromise = promise
        self.mockInteractor.observable = TouristSitesObserverble.successful(count: 1)
        self.presenter.loadNextTouristSites(count: 1)
        wait(for: [promise], timeout: 1)
    }
    
    func testLoadTouristSitesErrorShouldShowError() {
        let promise = expectation(description: "Should show error")
        self.mockView.showErrorPromise = promise
        self.mockInteractor.observable = TouristSitesObserverble.error
        self.presenter.loadNextTouristSites(count: 1)
        wait(for: [promise], timeout: 1)
    }
    
    func testLoadTouristSitesCompletedShouldHideLoading() {
        let promise = expectation(description: "Should hide loading")
        self.mockView.hideLoadingPromise = promise
        self.mockInteractor.observable = TouristSitesObserverble.successful(count: 1)
        self.presenter.loadNextTouristSites(count: 1)
        wait(for: [promise], timeout: 1)
    }
    
    func testSelectTouristSite() {
        let fakeTouristSite = TouristSite(stitle: "a", xbody: "aa", file: "aaa")
        self.presenter.didSelect(fakeTouristSite, imageIndex: 1)
        XCTAssertEqual(mockRouter.touristSite?.stitle, fakeTouristSite.stitle)
        XCTAssertEqual(mockRouter.imageIndex, 1)
    }
}
