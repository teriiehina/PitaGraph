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
  
  // the order of a graph is |V| (the number of vertices)
  func order() -> Int
  {
    return self.vertices.count
  }
  
  // A graph's size is |E|, the number of edges
  func size() -> Int
  {
    return 0
  }
  
  func addVertice(x: SPTVertice)
  {
    self.vertices.append(x)
  }
  
  func addEdge(x: SPTVertice, y:SPTVertice)
  {
    
  }
}
