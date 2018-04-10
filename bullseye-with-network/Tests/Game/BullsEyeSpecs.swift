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
      
      var bullsEye: BullsEye!
      
      beforeEach {
          bullsEye = BullsEye()
      }
      
      it("conforms with Game protocol") {
        expect(bullsEye).to(beAKindOf(Game.self))
      }
      
      describe("round") {
        it("starts as 1") {
          expect(bullsEye.round).to(equal(1))
        }
      }
      
      describe("newRound") {
        it("increments the round") {
          bullsEye.newRound()
          bullsEye.newRound()
          
          expect(bullsEye.round).to(equal(3))
        }
        
        it("changes the target to a new number") {
          let firtTarget = bullsEye.target
          
          bullsEye.newRound()
          let newTarget = bullsEye.target
          
          expect(firtTarget).toNot(equal(newTarget))
        }
      }
      
      describe("randomNumber") {
        it("is a number between 0 and 100") {
          expect(bullsEye.target).to(beGreaterThanOrEqualTo(0))
          expect(bullsEye.target).to(beLessThanOrEqualTo(100))
        }
      }
    }
  }
}
