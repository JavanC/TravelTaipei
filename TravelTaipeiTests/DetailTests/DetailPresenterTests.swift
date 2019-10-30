//
//  DetailPresenterTests.swift
//  TravelTaipeiTests
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import XCTest
@testable import TravelTaipei

class DetailPresenterTests: XCTestCase {

    // MARK: - Mock
    class MockView: DetailView {
        var presenter: DetailPresenter?
        var shouldShowDetail = false
        func setup(with touristSite: TouristSite, imageIndex: Int) {
            self.shouldShowDetail = true
        }
    }
    
    // MARK: - Setup
    var presenter: DetailDefaultPresenter!
    var mockInteractor = DetailDefaultInteractor()
    var mockView = MockView()
    
    override func setUp() {
        super.setUp()
        self.presenter = DetailDefaultPresenter()
        self.presenter.interactor = mockInteractor
        self.presenter.view = mockView
    }

    override func tearDown() {
        self.presenter = nil
        super.tearDown()
    }

    func testReloadShouldShowDetail() {
        self.mockInteractor.touristSite = TouristSite(stitle: "a", xbody: "b", file: "c")
        self.mockInteractor.imageIndex = 1
        self.presenter.reload()
        XCTAssertEqual(mockView.shouldShowDetail, true)
    }
}
