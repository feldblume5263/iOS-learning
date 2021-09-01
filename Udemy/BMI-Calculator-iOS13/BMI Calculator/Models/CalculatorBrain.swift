//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Junhong Park on 2021/08/31.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / pow(height, 2)
    
        bmi = BMI(value: bmiValue, advice: nil, color: nil)
        bmi?.setDetail()
    }
    
    
    func getBMIValue() -> Float {
        
        return bmi?.value ?? 0.0
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
