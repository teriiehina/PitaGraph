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

  func testCountSubwayDatas()
  {
    let testBundle  = NSBundle(forClass: self.dynamicType)
    let path        = testBundle.pathForResource("all", ofType:"plist")
      
    let dict: NSDictionary? = NSDictionary(contentsOfFile:path)

    XCTAssertTrue(dict)
    
    let datas = dict!
    XCTAssertEqual(datas.allKeys.count, 2, "We should have stops and segments")
    
    let stops = datas["stops"] as NSArray
    XCTAssertEqual(stops.count , 381 , "We should have 381 stops")
    
    let segments = datas["segments"] as NSArray
    XCTAssertEqual(segments.count , 722 , "We should have 722 segments")
  }
  
  func testImportSubwayDatas()
  {
    let testBundle  = NSBundle(forClass: self.dynamicType)
    let path        = testBundle.pathForResource("all", ofType:"plist")
    
    let dict: NSDictionary? = NSDictionary(contentsOfFile:path)
    let datas = dict!
    
    var graph     = SPTGraph()

    let stops     = datas["stops"] as Array<Dictionary<String , String>>
    let segments  = datas["segments"] as Array<Dictionary<String , String>>
    
    
    for stop in stops
    {
      graph.addVertice(SPTVertice(name: stop["name"]! , identifier: stop["stop_id"]!))
    }
    
    XCTAssertEqual(graph.order(), 381, "We should have 381 stops")
    
    for segment in segments
    {
      let start = graph.getVertice(segment["start"]!)
      let end   = graph.getVertice(segment["stop"]!)
      
      XCTAssertTrue(start , "We should have a start")
      XCTAssertTrue(end   , "We should have a end")

      XCTAssertTrue(graph.addEdge(start!, y: end!) , "We should be able to add an edge from \(start!.name) to \(end!.name)")
    }

    XCTAssertEqual(graph.size(), 722, "We should have 722 segments")
    
    let laFourche = graph.getVertice("355")
    
    XCTAssertTrue(laFourche, "'La Fourche' should exist")
    XCTAssertEqual(laFourche!.name, "La Fourche" , "We should have retrieved 'La Fourche'")
    
    XCTAssertEqual(graph.neighbors(laFourche!).count, 3, "'La Fourche' should have three neighbors")
    
  }
}
