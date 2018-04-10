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
          let guess = abs(targetValue - hitValue)
          let expectedScore = 100 - guess

          _ = bullsEye.hit(value: hitValue)
          
          expect(bullsEye.score).to(equal(expectedScore))
        }
        
        it("sums pontuation to currently score") {
          let guess = abs(targetValue - hitValue)
          var expectedScore = 100 - guess
          
          _ = bullsEye.hit(value: hitValue)
          _ = bullsEye.hit(value: hitValue)
          
          expectedScore += expectedScore
          
          expect(bullsEye.score).to(equal(expectedScore))
        }
      }
      
      describe("hit") {
        context("when users hit exact target") {
          var targetValue: Int!
          var hitValue: Int!
          
          beforeEach {
            targetValue = bullsEye.target
            hitValue = targetValue
          }
          
          it("score receive 100 bonus points") {
            let bonus = 100
            let guess = abs(targetValue - hitValue)
            let expectedScore = 100 - guess + bonus
            
            _ = bullsEye.hit(value: hitValue)
            
            expect(bullsEye.score).to(equal(expectedScore))
          }
          
          it("returns that user had perfect hit") {
            let perfection = bullsEye.hit(value: hitValue)
            
            expect(perfection).to(equal(Perfection.perfect))
          }
        }
        
        context("when users misses the value by 1 point") {
          var targetValue: Int!
          var hitValue: Int!
          
          beforeEach {
            targetValue = bullsEye.target
            hitValue = targetValue - 1
          }
          
          it("score receive 50 bonus points") {
            let bonus = 50
            let guess = abs(targetValue - hitValue)
            let expectedScore = 100 - guess + bonus
            
            _ = bullsEye.hit(value: hitValue)
            
            expect(bullsEye.score).to(equal(expectedScore))
          }
          
          it("returns that user almost had it") {
            let perfection = bullsEye.hit(value: hitValue)
            
            expect(perfection).to(equal(Perfection.almost))
          }
        }
        
        context("when users misses the value by less than 10 points") {
          it("returns that user had pretty good hit") {
            let hitValue = bullsEye.target - 9
            let perfection = bullsEye.hit(value: hitValue)
            
            expect(perfection).to(equal(Perfection.prettyGood))
          }
        }
        
        context("when users misses the value by more than 10 points") {
          it("returns that user not even close") {
            let hitValue = bullsEye.target - 20
            let perfection = bullsEye.hit(value: hitValue)
            
            expect(perfection).to(equal(Perfection.notEvenClose))
          }
        }
      }
      
      describe("points") {
        it("difference between target and hit is a positive number") {
          let hitValue = 100
          let targetValue = bullsEye.target
          let guess = abs(targetValue - hitValue)
          let points = 100 - guess

          _ = bullsEye.hit(value: hitValue)

          expect(bullsEye.points).to(equal(points))
        }
      }
      
      describe("resetGame") {
        it("resets game round and score") {
          let hitValue = 70
          let oldTarget = bullsEye.target
          _ = bullsEye.hit(value: hitValue)
          _ = bullsEye.hit(value: hitValue)

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
