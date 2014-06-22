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

  func testImportSubwayDatas()
  {
    let testBundle  = NSBundle(forClass: self.dynamicType)
    let path        = testBundle.pathForResource("all", ofType:"plist")
      
    let dict: NSDictionary? = NSDictionary(contentsOfFile:path)

    XCTAssertTrue(dict)
    
    let datas = dict!
    let keys  = datas.allKeys
    
    XCTAssertEqual(datas.allKeys.count, 2, "We should have 2 keys")
    
    let stops: Array<Dictionary<String, AnyObject>>? = datas["stops"] as Array<Dictionary<String, AnyObject>>?
    
    XCTAssertTrue(stops, "We should have stops in the datas")
  }
}
