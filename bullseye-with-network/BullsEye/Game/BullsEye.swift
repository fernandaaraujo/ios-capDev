//
//  BullsEye.swift
//  BullsEye
//
//  Created by Fernanda Araújo on 10/04/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import Foundation

protocol Game {
  var round: Int { get }
  var target: Int { get }
  
  func newRound()
}

class BullsEye: Game {
  var round = 1
  var target = 1 + Int(arc4random_uniform(100))
  
  func newRound() {
    round += 1
  }
}
