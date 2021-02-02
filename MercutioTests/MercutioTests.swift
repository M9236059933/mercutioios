//
//  MercutioTests.swift
//  MercutioTests
//
//  Created by Mac on 25.10.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import XCTest
@testable import Mercutio
@testable import Alamofire

class MercutioTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testAPI() {
        let exp = expectation(description: "Alamofire")
        AF.request(postUrl)
            .response { response in
                XCTAssertNil(response.error, "Whoops, error \(response.error!.localizedDescription)")
                XCTAssertNotNil(response, "No response")
                XCTAssertEqual(response.response?.statusCode ?? 0, 200, "Status code not 200")
                exp.fulfill()
            }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
