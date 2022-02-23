//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Christopher Koski on 2/22/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  var bmiValue: String?
  var advice: String?
  var color: UIColor?
  
  @IBOutlet var bmiLabel: UILabel!
  @IBOutlet var adviceLabel: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()
      
    bmiLabel.text = bmiValue
    adviceLabel.text = advice
    view.backgroundColor = color
    
    }
    
  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
