//
//  DateTests.swift
//  TinySwift
//
//  Created by Piotr Sochalewski on 27.09.2016.
//  Copyright © 2016 Piotr Sochalewski. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {
    
    let date = Date(timeIntervalSinceReferenceDate: 10_000_000) // April 26th, 2001, Thursday
    let calendar = Calendar.current
    
    func testFirstOfMonth() {
        guard let firstOfMonth = date.firstOfMonth else { XCTFail("firstOfMonth should not return nil"); return }

        let components = calendar.dateComponents([.day, .month, .year], from: firstOfMonth)
        XCTAssert(components.day! == 1 && components.month! == 4 && components.year! == 2001, "firstOfMonth should return April 1st, 2001")
    }
    
    func testFirstOfYear() {
        guard let firstOfYear = date.firstOfYear else { XCTFail("firstOfYear should not return nil"); return }
        
        let components = calendar.dateComponents([.day, .month, .year], from: firstOfYear)
        XCTAssert(components.day! == 1 && components.month! == 1 && components.year! == 2001, "firstOfYear should return January 1st, 2001")
    }
    
    func testLastOfMonth() {
        guard let lastOfMonth = date.lastOfMonth else { XCTFail("lastOfMonth should not return nil"); return }
        
        let components = calendar.dateComponents([.day, .month, .year], from: lastOfMonth)
        XCTAssert(components.day! == 30 && components.month! == 4 && components.year! == 2001, "lastOfMonth should return April 31st, 2001")
    }
    
    func testLastOfYear() {
        guard let lastOfYear = date.lastOfYear else { XCTFail("lastOfYear should not return nil"); return }
        
        let components = calendar.dateComponents([.day, .month, .year], from: lastOfYear)
        XCTAssert(components.day! == 31 && components.month! == 12 && components.year! == 2001, "lastOfYear should return December 31st, 2001")
    }
    
    func testNextDay() {
        guard let nextDay = date.nextDay else { XCTFail("tomorrow should not return nil"); return }
        
        let components = calendar.dateComponents([.day, .month, .year], from: nextDay)
        XCTAssert(components.day! == 27 && components.month! == 4 && components.year! == 2001, "nextDay should return April 27th, 2001")
    }
    
    func testPreviousDay() {
        guard let previousDay = date.previousDay else { XCTFail("yesterday should not return nil"); return }
        
        let components = calendar.dateComponents([.day, .month, .year], from: previousDay)
        XCTAssert(components.day! == 25 && components.month! == 4 && components.year! == 2001, "previousDay should return April 25th, 2001")
    }
    
    func testWeekday() {
        XCTAssert(date.weekday == 5, "weekday should return Thursday")
    }
}
