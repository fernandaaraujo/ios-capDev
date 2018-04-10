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
    var score: Int { get }
    
    func newRound()
    func hit(value: Int)
    func resetGame()
}

enum Bonus: Int {
    case perfect = 100
}

class BullsEye: Game {
    var round = 1
    var target = 0
    var score = 0
    var points = 0
    var message = ""
    
    init() {
        target = generateRandomNumber()
    }
    
    func newRound() {
        round += 1
        target = generateRandomNumber()
    }
    
    func hit(value: Int) {
        points = calculatePoints(value: value)
        
        score += points
    }
    
    func resetGame() {
        score = 0
        round = 1
        target = generateRandomNumber()
    }
    
    private func generateRandomNumber() -> Int {
        var randomTarget = target
        
        while randomTarget == target {
            randomTarget = 1 + Int(arc4random_uniform(100))
        }
        
        return randomTarget
    }
    
    private func calculatePoints(value: Int) -> Int {
        let difference = calculateDifference(hitValue: value)
        
        return calculateBonus(difference: difference)
    }
    
    private func calculateDifference(hitValue: Int) -> Int {
        return abs(target - hitValue)
    }
    
    private func calculateBonus(difference: Int) -> Int {
        var currentPoints = 100 - difference
        
        if difference == 0 {
            currentPoints += 100
            message = "Perfect!"
        } else if difference == 1 {
            currentPoints += 50
            message = "You almost had it!"
        }
        
        return currentPoints
    }
}
