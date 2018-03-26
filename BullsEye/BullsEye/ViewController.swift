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
        
//        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
//        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
//        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
//        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        
        updateLabels()
    }
    
    func updateLabels() {
        targetNumber.text = String(targetValue)
        roundLabel.text = String(roundNumber)
        scoreLabel.text = String(score)
    }
    
    func calculateDifference() -> Int {
        return abs(targetValue - currentValue)
    }
    
    func createBonusPoints() -> (title: String, points: Int) {
        let difference = calculateDifference()
        var points = 100 - difference
        var title = "Not even close..."
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        }
        
        return (title, points)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let points = createBonusPoints().points
        let title = createBonusPoints().title
        
        score += points

        let message = "Total score is: \(points)"
        
        let alert = UIAlertController(title: title,
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
    
    @IBAction func startNewGame() {
        roundNumber = 0
        score = 0
        
        startNewRound()
    }
}

