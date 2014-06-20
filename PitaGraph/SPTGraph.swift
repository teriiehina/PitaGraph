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
  
  // return true if there is an egde between x and y
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
  
  // Will first verify that 
  //
  //  - there isn't already an edge between the two vertices between adding one
  //  - the two vertices are in the graph
  
  func addEdge(x: SPTVertice, y:SPTVertice)
  {
    if self.adjacent(x, y: y)   { return }
    if !self.containsVertice(x) { return }
    if !self.containsVertice(y) { return }
    
    let edge = SPTEdge(start: x, end: y)
    self.edges.append(edge)
  }
  
  // this is certainly not optimal but for the moment being
  // we are seeking robustness more than efficiency
  func containsVertice(x: SPTVertice) -> Bool
  {
    return self.vertices.filter({$0 == x}).count > 0
  }
  
}
