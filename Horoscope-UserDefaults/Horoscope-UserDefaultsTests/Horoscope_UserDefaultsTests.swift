//
//  Horoscope_UserDefaultsTests.swift
//  Horoscope-UserDefaultsTests
//
//  Created by Juan Ceballos on 1/13/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import XCTest
@testable import Horoscope_UserDefaults

struct CreatedHoroscope: Codable   {
    let sungsign: String
    let date: String
    let horoscope: String
}


class Horoscope_UserDefaultsTests: XCTestCase {
    //arrange
    func testFetchHoroscope() {
        let horoscope = "gemini"
        let exp = XCTestExpectation(description: "Correct Horoscope")
        let expectedSign = "Gemini"
        
        //act
        HoroscopeAPI.fetchHoroscope(horoscope: horoscope) { (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let horoscope):
                exp.fulfill()
                XCTAssertEqual(horoscope.sunsign, expectedSign, "expectedSign matches get request sign")
            }
        }
        wait(for: [exp], timeout: 5)
    }
    
}
