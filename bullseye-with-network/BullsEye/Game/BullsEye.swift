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
  
  func newRound()
}

class BullsEye: Game {
  var round = 1
  
  func newRound() {
    round += 1
  }
}
