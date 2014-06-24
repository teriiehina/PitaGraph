//
//  SPTVertice.swift
//  PitaGraph
//
//  Created by teriiehina on 20/06/2014.
//  Copyright (c) 2014 teriiehina. All rights reserved.
//

import UIKit

class SPTVertice: NSObject
{
  var name: String
  var identifier: String
  
  init(name: String , identifier: String)
  {
    self.name       = name
    self.identifier = identifier
    
    super.init()
  }
}
