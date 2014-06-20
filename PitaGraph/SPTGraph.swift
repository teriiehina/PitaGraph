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
  var oriented: Bool
  
  init()
  {
    self.vertices = SPTVertice[]()
    self.edges    = SPTEdge[]()
    self.oriented = false
  }
  
  func adjacent(x: SPTVertice, y: SPTVertice) -> Bool
  {
    for edge in self.edges
    {
      if (edge.startVertice != x) {continue}
      if (edge.endVertice != y)   {continue}
      
      return true
    }
    
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
    return self.edges.count
  }
  
  func addVertice(x: SPTVertice)
  {
    self.vertices.append(x)
  }
  
  func addEdge(x: SPTVertice, y:SPTVertice)
  {
    let edge = SPTEdge(start: x, end: y)
    self.edges.append(edge)
  }
}
