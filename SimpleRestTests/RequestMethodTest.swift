//
//  RequestMethodTest.swift
//  SimpleRestTests
//
//  Created by extdev on 08.07.2021.
//

import XCTest
@testable import SimpleRest

class RequestMethodTest: XCTestCase {
  
  func testRequestMethodParseCorrectly() throws{
    
    XCTAssertEqual("GET", RequestMethod.GET.toString())
    XCTAssertEqual("POST", RequestMethod.POST.toString())
  }
}
