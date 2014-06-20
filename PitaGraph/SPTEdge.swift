//
//  SPTEdge.swift
//  PitaGraph
//
//  Created by teriiehina on 20/06/2014.
//  Copyright (c) 2014 teriiehina. All rights reserved.
//

import UIKit

class SPTEdge: NSObject
{
  var startVertice: SPTVertice
  var endVertice:   SPTVertice
  
  init(start: SPTVertice , end: SPTVertice)
  {
    self.startVertice = start
    self.endVertice   = end
  }
}
