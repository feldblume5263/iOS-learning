//
//  BMI.swift
//  BMI Calculator
//
//  Created by Junhong Park on 2021/08/31.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct BMI {
    let value: Float
    var advice: String?
    var color: UIColor?
    
    mutating func setDetail() {
        
        if value < 18.5 {
            advice = "Eat more pies!"
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
        else if value >= 24.9 {
            advice = "Eat less pies!"
            color = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        }
        else {
            advice = "Fit as a fiddle!"
            color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
    }
}
