//
//  CacheTests.swift
//  CacheTests
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import XCTest
@testable import Cache

final class CacheTests: XCTestCase {
    private var cache: Cache<Int, String>!
    
    
    override func setUp() {
        super.setUp()
        cache = .fromDisk(file: "cacheTest") ?? .init(entryLifetime: 1)
    }
    
    override func tearDown() {
        super.tearDown()
        cache = nil
    }

    func test_insert() {
        cache[0] = "test"
        XCTAssertEqual(cache[0], "test")
        let delayExpectation = XCTestExpectation()
        delayExpectation.isInverted = true
        wait(for: [delayExpectation], timeout: 1)
        XCTAssertEqual(cache[0], nil)
    }
}
