//
//  DetailInteractorTests.swift
//  TravelTaipeiTests
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import XCTest
@testable import TravelTaipei

class DetailInteractorTests: XCTestCase {

    // MARK: - Setup
    var interactor: DetailDefaultInteractor!
    var fakeTouristSite = TouristSite(stitle: "a", xbody: "b", file: "c")
    var fakeImageIndex = 1
    
    override func setUp() {
        super.setUp()
        let vc = DetailModule().buildDefault(with: fakeTouristSite, imageIndex: fakeImageIndex) as? DetailView
        guard let interactor = vc?.presenter?.interactor as? DetailDefaultInteractor else {
            XCTFail("interactor non existing")
            return
        }
        self.interactor = interactor
    }

    override func tearDown() {
        self.interactor = nil
        super.tearDown()
    }

    // MARK: - Tests
    func testInteractorReceiveTourstSiteFromRouter() {
        XCTAssertEqual(interactor.touristSite?.stitle, fakeTouristSite.stitle)
    }
    
    func testInteractorReceiveImageIndexFromRouter() {
        XCTAssertEqual(interactor.imageIndex, fakeImageIndex)
    }
}
