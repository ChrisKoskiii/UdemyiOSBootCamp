//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Christopher Koski on 2/22/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
  
  var bmi: BMI?
  
  func getBMIValue() -> String {
    
    let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
    return bmiTo1DecimalPlace
    
  }
  
  mutating func calculateBMI(height: Float, weight: Float) {
    let bmiValue = weight / pow(height, 2)
    
    if bmiValue < 18.5 {
      bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .cyan)
    } else if bmiValue < 24.9 {
      bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .systemTeal)
    } else {
      bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .magenta)
    }
    
  }
  
  func getAdvice() -> String {
    return bmi?.advice ?? "Error loading advice"
  }
  
  func getColor() -> UIColor{
    return bmi?.color ?? .systemGray
  }
  
}
