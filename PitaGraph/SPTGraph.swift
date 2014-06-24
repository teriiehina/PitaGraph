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
  var vertices: Dictionary<String , SPTVertice>
  var edges:    SPTEdge[]
  var oriented: Bool
  
  
  
  /// the default graph is empty and non-oriented
  
  init()
  {
    self.vertices = Dictionary<String , SPTVertice>()
    self.edges    = SPTEdge[]()
    self.oriented = false
  }
  
  
  
  /// Return true if there is an egde between x and y
  
  func adjacent(x: SPTVertice, y: SPTVertice) -> Bool
  {
    for edge in self.edges
    {
      if (edge.startVertice != x && edge.startVertice != y) {continue}
      if (edge.endVertice   != y && edge.endVertice   != x) {continue}
      
      return true
    }
    
    return false
  }
  
  
  
  // Return all vertices y such as
  //
  //  - there is an edge from x to y or 
  //  - there is an edge from y to x.
  
  func neighbors(x: SPTVertice) -> SPTVertice[]
  {
    var xNeighbors = SPTVertice[]()
    
    for edge in self.edges
    {
      if (edge.startVertice != x && edge.endVertice != x) {continue}
      
      if (edge.startVertice == x)
      {
        xNeighbors.append(edge.endVertice)
      }
      else
      {
        xNeighbors.append(edge.startVertice)
      }
    }
    
    return xNeighbors
  }
  
  
  
  /// return the order of a graph, |V|, i.e. the number of vertices
  
  func order() -> Int
  {
    return self.vertices.count
  }
  
  
  
  /// return the graph's size, |E|, i.e. the number of edges
  
  func size() -> Int
  {
    return self.edges.count
  }
  
  
  /// Add the given vertice to the graph
  
  func addVertice(x: SPTVertice)
  {
    self.vertices[x.identifier] = x
  }
  
  
  /// Add an edge between the two given vertices.
  ///
  /// Will first verify that
  ///
  ///  - there isn't already an edge between the two vertices between adding one
  ///  - the two vertices are in the graph
  
  func addEdge(x: SPTVertice, y:SPTVertice)
  {
    if self.adjacent(x, y: y)   { return }
    if !self.containsVertice(x) { return }
    if !self.containsVertice(y) { return }
    
    let edge = SPTEdge(start: x, end: y)
    self.edges.append(edge)
  }
  
  
  /// Return true if the graph contains the given vertice
  ///
  /// this is certainly not optimal but for the moment being
  /// we are seeking robustness more than efficiency
  
  func containsVertice(x: SPTVertice) -> Bool
  {
    for v in self.vertices.values
    {
      if v == x
      {
        return true
      }
    }
    return false
  }
  
}
