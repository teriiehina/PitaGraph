//
//  SPTGraph.swift
//  PitaGraph
//
//  Created by teriiehina on 20/06/2014.
//  Copyright (c) 2014 teriiehina. All rights reserved.
//

import UIKit

class SPTGraph: NSObject
{
  var vertices: SPTVertice[]
  var edges:    SPTEdge[]
  
  init()
  {
    self.vertices = SPTVertice[]()
    self.edges    = SPTEdge[]()
  }
  
  func adjacent(x: SPTVertice, y: SPTVertice) -> Bool
  {
    return false
  }
  
  func neighbors(x: SPTVertice) -> SPTVertice[]
  {
    return SPTVertice[]()
  }
  
  func order() -> Int
  {
    return 0
  }
  
  func size() -> Int
  {
    return 0
  }
  
  func addVertice(x: SPTVertice)
  {
    
  }
  
  func addEdge(x: SPTVertice, y:SPTVertice)
  {
    
  }
}
