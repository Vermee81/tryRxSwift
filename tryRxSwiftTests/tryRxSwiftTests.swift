//
//  tryRxSwiftTests.swift
//  tryRxSwiftTests
//
//  Created by Hiroo Kusaba on 2019/05/06.
//  Copyright © 2019年 Hiroo Kusaba. All rights reserved.
//

import RxTest
@testable import tryRxSwift
import XCTest

class tryRxSwiftTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDebounce() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let observable = scheduler.createHotObservable([
            Recorded.next(1, "R"),
            Recorded.next(2, "Rx"),
            Recorded.next(4, "RxS"),
            Recorded.next(5, "RxSw"),
            Recorded.next(6, "RxSwi"),
            Recorded.next(7, "RxSwift")
        ])
        
        _ = observable
            .debounce(1, scheduler: scheduler)
            .subscribe(onNext: { print("onNext: ", $0) })
        scheduler.start()
    }
}
