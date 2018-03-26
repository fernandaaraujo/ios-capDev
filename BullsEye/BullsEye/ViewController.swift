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

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetNumber: UILabel!
    
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
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetNumber.text = String(targetValue)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let message = "The value of the slider is: \(currentValue)" +
                        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: UIAlertControllerStyle.alert)
        present(alert, animated: true, completion: nil)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        
        startNewRound()
    }
    
}

