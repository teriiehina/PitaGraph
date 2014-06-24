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
    
    XCTAssertEqual(graph.order() , 0 , "The graph should be have no vertice")
    
    graph.addVertice(SPTVertice(name: "A" , identifier: ""))
    
    XCTAssertEqual(graph.order() , 1 , "The graph should have one vertice")
  }
  
  func testGraphSize()
  {
    var graph = SPTGraph()
    
    XCTAssertEqual(graph.size() , 0 , "The graph should have no edge")
    
    let a = SPTVertice(name: "A" , identifier: "")
    let b = SPTVertice(name: "B" , identifier: "")
    
    graph.addVertice(a)
    graph.addVertice(b)
    
    graph.addEdge(a, y: b)
    
    XCTAssertEqual(graph.size() , 1 , "The graph should have one edge")
  }
  
  func testVerticesAdjacency()
  {
    var graph = SPTGraph()
    
    let a = SPTVertice(name: "A" , identifier: "")
    let b = SPTVertice(name: "B" , identifier: "")
    let c = SPTVertice(name: "C" , identifier: "")
    
    graph.addVertice(a)
    graph.addVertice(b)
    graph.addVertice(b)
    
    graph.addEdge(a, y: b)
    
    XCTAssertEqual(graph.adjacent(a, y: b) , true  , "B should be adjacent to A")
    XCTAssertEqual(graph.adjacent(a, y: c) , false , "C should not be adjacent to A")
  }
  
  func testNoVerticeInDouble()
  {
    var graph = SPTGraph()
    
    let a = SPTVertice(name: "A" , identifier: "")
    
    graph.addVertice(a)
    
    XCTAssertEqual(graph.order() , 1  , "There should be only one vertice in the graph")
  }
  
  func testOnlyOneEdgeBetweenTwoVertices()
  {
    var graph = SPTGraph()
    
    XCTAssertEqual(graph.size() , 0 , "The graph should have no edge")
    
    let a = SPTVertice(name: "A" , identifier: "")
    let b = SPTVertice(name: "B" , identifier: "")
    
    graph.addVertice(a)
    graph.addVertice(b)
    
    graph.addEdge(a, y: b)
    graph.addEdge(a, y: b)
    
    XCTAssertEqual(graph.size() , 1  , "There should be only one edge between A and B")
  }
  
  func testEdgeOnKnownVertices()
  {
    var graph = SPTGraph()
    
    let a = SPTVertice(name: "A" , identifier: "")
    let b = SPTVertice(name: "B" , identifier: "")
    
    graph.addVertice(a)
    
    graph.addEdge(a, y: b)
    
    XCTAssertEqual(graph.size() , 0  , "There should be no edge")
  }
  
  func testVerticeContainment()
  {
    var graph = SPTGraph()
    
    let a = SPTVertice(name: "A" , identifier: "")
    let b = SPTVertice(name: "B" , identifier: "")
    
    graph.addVertice(a)
    
    graph.addEdge(a, y: b)
    
    XCTAssertEqual(graph.containsVertice(a) , true  , "There should be A in the graph")
    XCTAssertEqual(graph.containsVertice(b) , false , "There should not be B in the graph")
  }
  
  func testNeighbourhood()
  {
    var graph = SPTGraph()
    
    let a = SPTVertice(name: "A" , identifier: "")
    let b = SPTVertice(name: "B" , identifier: "")
    let c = SPTVertice(name: "C" , identifier: "")
    let d = SPTVertice(name: "D" , identifier: "")
    
    graph.addVertice(a)
    graph.addVertice(b)
    graph.addVertice(c)
    graph.addVertice(d)
    
    graph.addEdge(a, y: b)
    graph.addEdge(c, y: a)
    graph.addEdge(c, y: d)
    
    let neighbors = graph.neighbors(a)
    
    XCTAssertEqual(neighbors.filter({$0 == b}).count == 1 , true  , "B should be a neighbor of A")
    XCTAssertEqual(neighbors.filter({$0 == c}).count == 1 , true  , "C should be a neighbor of A")
    XCTAssertEqual(neighbors.filter({$0 == d}).count == 0 , true  , "D should be a neighbor of A")
  }
  
}
