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
      
      describe("score") {
        var hitValue: Int!
        var targetValue: Int!
        
        beforeEach {
          hitValue = 50
          targetValue = bullsEye.target
        }
        
        it("starts as 0") {
          expect(bullsEye.score).to(equal(0))
        }
        
        it("increments score after hit a value") {
          let expectedScore = 100 - abs(targetValue - hitValue)

          bullsEye.hit(value: hitValue)
          
          expect(bullsEye.score).to(equal(expectedScore))
        }
        
        it("sums pontuation to currently score") {
          var expectedScore = 100 - abs(targetValue - hitValue)
          
          bullsEye.hit(value: hitValue)
          bullsEye.hit(value: hitValue)
          
          expectedScore += expectedScore
          
          expect(bullsEye.score).to(equal(expectedScore))
        }
      }
      
      describe("hit") {
        context("when users hit exact target") {
          it("score receive 100 bonus points") {
            let hitValue = bullsEye.target
            let targetValue = bullsEye.target
            let bonus = 100
            let expectedScore = 100 - abs(targetValue - hitValue) + bonus
            
            bullsEye.hit(value: hitValue)
            
            expect(bullsEye.score).to(equal(expectedScore))
          }
          
          it("shows to user the message Perfect!") {
            let hitValue = bullsEye.target
            let message = "Perfect!"
            
            bullsEye.hit(value: hitValue)
            
            expect(bullsEye.message).to(equal(message))
          }
        }
        
        context("when users misses the value by 1 point") {
          it("score receive 50 bonus points") {
            let hitValue = bullsEye.target - 1
            let targetValue = bullsEye.target
            let bonus = 50
            let expectedScore = 100 - abs(targetValue - hitValue) + bonus
            
            bullsEye.hit(value: hitValue)
            
            expect(bullsEye.score).to(equal(expectedScore))
          }
          
          it("shows to user the message You almost had it!") {
            let hitValue = bullsEye.target - 1
            let message = "You almost had it!"
            
            bullsEye.hit(value: hitValue)
            
            expect(bullsEye.message).to(equal(message))
          }
        }
        
        context("when users misses the value by less than 10 points") {
          it("shows to user the message Pretty good!") {
            let hitValue = bullsEye.target - 9
            let message = "Pretty good!"
            
            bullsEye.hit(value: hitValue)
            
            expect(bullsEye.message).to(equal(message))
          }
        }
        
        context("when users misses the value by more than 10 points") {
          it("shows to user the message Not even close...") {
            let hitValue = bullsEye.target - 20
            let message = "Not even close..."
            
            bullsEye.hit(value: hitValue)
            
            expect(bullsEye.message).to(equal(message))
          }
        }
      }
      
      describe("points") {
        it("difference between target and hit is a positive number") {
          let hitValue = 100
          let targetValue = bullsEye.target
          let points = 100 - abs(targetValue - hitValue)

          bullsEye.hit(value: hitValue)

          expect(bullsEye.points).to(equal(points))
        }
      }
      
      describe("resetGame") {
        it("resets game round and score") {
          let hitValue = 70
          let oldTarget = bullsEye.target
          bullsEye.hit(value: hitValue)
          bullsEye.hit(value: hitValue)

          bullsEye.resetGame()
          let newTarget = bullsEye.target
          
          expect(bullsEye.round).to(equal(1))
          expect(bullsEye.score).to(equal(0))
          expect(newTarget).toNot(equal(oldTarget))
        }
      }
    }
  }
}
