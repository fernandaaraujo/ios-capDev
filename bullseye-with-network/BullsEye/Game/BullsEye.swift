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

class BullsEye: Game {
    var round = 1
    var target = 0
    var score = 0
    var points = 0
    
    init() {
        target = generateRandomNumber()
    }
    
    func newRound() {
        round += 1
        target = generateRandomNumber()
    }
    
    func hit(value: Int) {
        let difference = calculateDifference(hitValue: value)
        points = 100 - difference
        
        if difference == 0 {
            points += 100
        } else if difference == 1 {
            points += 50
        }
        
        score += points
    }
    
    func resetGame() {
        score = 0
        round = 1
    }
    
    private func generateRandomNumber() -> Int {
        var randomTarget = target
        
        while randomTarget == target {
            randomTarget = 1 + Int(arc4random_uniform(100))
        }
        
        return randomTarget
    }
    
    private func calculateDifference(hitValue: Int) -> Int {
        return abs(target - hitValue)
    }
}
