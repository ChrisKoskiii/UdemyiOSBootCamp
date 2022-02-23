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
  
  @IBOutlet var heightLabel: UILabel!
  @IBOutlet var weightLabel: UILabel!
  @IBOutlet var heightSlider: UISlider!
  @IBOutlet var weightSlider: UISlider!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func heightSliderChanged(_ sender: UISlider) {
    let roundedHeight = String(format: "%.2f", sender.value)
    heightLabel.text = "\(roundedHeight)m"
  }
  
  @IBAction func weightSliderChanged(_ sender: UISlider) {
    weightLabel.text = "\(Int(sender.value))Kg"
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let height = heightSlider.value
    let weight = weightSlider.value
    
    calculatorBrain.calculateBMI(height: height, weight: weight)
    
    
    performSegue(withIdentifier: "goToResults", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResults" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.bmiValue = calculatorBrain.getBMIValue()
      destinationVC.advice = calculatorBrain.getAdvice()
      destinationVC.color = calculatorBrain.getColor()
    }
  }
  
  
}

