//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Christopher Koski on 2/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
  var total: Double?
  var percentSelected = 10
  var amountOfPeople = 2
  
  mutating func calculate(checkTotal: Double, percent: Double, amountOfPeople: Int) -> Double {
    let fixedPct = percent / 100.0
    total = ((checkTotal * fixedPct) + checkTotal) / Double(amountOfPeople)
    return total!
  }
}
