//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by Brady Miller on 4/7/21.
//

import XCTest
@testable import CodingChallenge

class ShiftsViewModelTests: XCTestCase {
    
    var sut: ShiftsViewModel!
    var networkingManager: MockNetworkingManager!
    

    override func setUpWithError() throws {
        networkingManager = MockNetworkingManager()
        sut = ShiftsViewModel(networkingManager: networkingManager)
    }

    override func tearDownWithError() throws {
        sut = nil
        networkingManager = nil
    }

    func testShouldFetchShiftsWhenInitialized() throws {
        XCTAssertTrue(networkingManager.flag)
    }

}

class MockNetworkingManager: NetworkingProtocol {
    var flag = false
    func request(router: Router, completion: @escaping (Result<ShiftsData, NetworkingError>) -> ()) {
        flag = true
    }
}
