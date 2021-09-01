//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    var calculatorBrain = CalculatorBrain()
    
    
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightValue.text = String(round(sender.value * 100) / 100) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        weightValue.text = String(Int(sender.value)) + "Kg"
    }
    
    @IBAction func calculatorPressed(_ sender: UIButton) {
        let height = round(heightSlider.value * 100) / 100
        let weight = round(weightSlider.value)
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = String(format: "%.1f", calculatorBrain.getBMIValue())
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

