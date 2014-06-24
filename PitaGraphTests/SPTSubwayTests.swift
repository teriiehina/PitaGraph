//
//  SPTSubwayTests.swift
//  PitaGraph
//
//  Created by teriiehina on 22/06/2014.
//  Copyright (c) 2014 teriiehina. All rights reserved.
//


import XCTest

import PitaGraph

class SPTSubwayTests: XCTestCase
{

  var graph: SPTGraph?
  
  override func setUp()
  {
    super.setUp()
    
    let testBundle  = NSBundle(forClass: self.dynamicType)
    let path        = testBundle.pathForResource("all", ofType:"plist")
    
    let dict: NSDictionary? = NSDictionary(contentsOfFile:path)
    let datas = dict!
    
    self.graph     = SPTGraph()
    
    let stops     = datas["stops"]    as Array<Dictionary<String , String>>
    let segments  = datas["segments"] as Array<Dictionary<String , String>>
    
    for stop in stops
    {
      self.graph!.addVertice(SPTVertice(name: stop["name"]! , identifier: stop["stop_id"]!))
    }
    
    for segment in segments
    {
      let start = self.graph!.getVertice(segment["start"]!)
      let end   = self.graph!.getVertice(segment["stop"]!)
      
      self.graph!.addEdge(start!, y: end!)
    }
  }
  
  func testImportSubwayDatas()
  {
    XCTAssertTrue(self.graph, "We should have a non-nil graph")

    XCTAssertEqual(self.graph!.order(), 381, "We should have 381 stops")
    XCTAssertEqual(self.graph!.size() , 722, "We should have 722 segments")
  }
  
  func testLaFourche()
  {
    XCTAssertTrue(self.graph, "We should have a non-nil graph")
    
    let laFourche = self.graph!.getVertice("355")
    
    XCTAssertTrue(laFourche, "'La Fourche' should exist")
    XCTAssertEqual(laFourche!.name, "La Fourche" , "We should have retrieved 'La Fourche'")
    
    XCTAssertEqual(self.graph!.neighbors(laFourche!).count, 3, "'La Fourche' should have three neighbors")
  }
}
