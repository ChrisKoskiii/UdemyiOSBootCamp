//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

//add a check to make sure texfield input is an Int


class ViewController: UIViewController {
  
  @IBOutlet var billTextFIeld: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitNumberLabel: UILabel!
  
  var brain = TipsyBrain()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    }

  @IBAction func tipChanged(_ sender: UIButton) {
    brain.percentSelected = sender.tag
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    
    sender.isSelected = true
  }
  
  @IBAction func stepperChanged(_ sender: UIStepper) {
    splitNumberLabel.text = String(format: "%.0f", sender.value)
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let checkTotal = Double(billTextFIeld.text!) ?? 0.0
    let percent = Double(brain.percentSelected)
    brain.amountOfPeople = Int(splitNumberLabel.text!) ?? 2
    
    print(brain.calculate(checkTotal: checkTotal, percent: percent, amountOfPeople: brain.amountOfPeople))
    performSegue(withIdentifier: "goToTotal", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToTotal" {
      let destinationVC = segue.destination as! TotalViewController
      destinationVC.total = brain.total
      destinationVC.amountOfPeople = brain.amountOfPeople
      destinationVC.tipPercent = brain.percentSelected
      
    }
  }
  
}

