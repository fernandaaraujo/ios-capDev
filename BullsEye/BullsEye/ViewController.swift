//
//  ViewController.swift
//  BullsEye
//
//  Created by Fernanda Araújo on 26/03/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 0
    var roundNumber: Int = 0
    var score: Int = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetNumber: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        
        startNewRound()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber = roundNumber + 1
        
        updateLabels()
    }
    
    func updateLabels() {
        targetNumber.text = String(targetValue)
        roundLabel.text = String(roundNumber)
        scoreLabel.text = String(score)
    }
    
    func calculateScore() -> Int {
        let score = abs(targetValue - currentValue)
        
        return 100 - score
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let roundScore = calculateScore()
        score = score + roundScore

        let message = "Total score is: \(roundScore)"
        
        let alert = UIAlertController(title: "Hello World",
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: UIAlertActionStyle.default,
                                   handler: { action in
                                                self.startNewRound()
                                            })

        present(alert, animated: true, completion: nil)
        
        alert.addAction(action)
    }
    
}

