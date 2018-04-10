//
//  BullsEyeSpecs.swift
//  Tests
//
//  Created by Fernanda Araújo on 10/04/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import Quick
import Nimble

@testable import BullsEye

class BullsEyeSpecs: QuickSpec {
  override func spec() {
    describe("BullsEye Game") {
      it("conforms with Game protocol") {
        let bullsEye = BullsEye()
        
        expect(bullsEye).to(beAKindOf(Game.self))
      }
      
      describe("round") {
        it("starts as 1") {
          let bullsEye = BullsEye()
          
          expect(bullsEye.round).to(equal(1))
        }
      }
    }
  }
}
