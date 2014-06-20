//
//  PitaGraphTests.swift
//  PitaGraphTests
//
//  Created by teriiehina on 20/06/2014.
//  Copyright (c) 2014 teriiehina. All rights reserved.
//

import XCTest

import PitaGraph

class PitaGraphTests: XCTestCase
{
  override func setUp()
  {
    super.setUp()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  func testGraphOrder()
  {
    var graph = SPTGraph()
    
    XCTAssertEqual(graph.order() , 0 , "The graph should be empty")
    
    graph.addVertice(SPTVertice(name: "test"))
    
    XCTAssertEqual(graph.order() , 1 , "The graph should have one vertice")
  }
  
//  func testPerformanceExample()
//  {
//    // This is an example of a performance test case.
//    self.measureBlock() {
//      // Put the code you want to measure the time of here.
//    }
//  }
  
}
