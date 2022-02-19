//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //IBOutlets allows reference to UI elements
  @IBOutlet var diceImageView1: UIImageView!
  @IBOutlet var diceImageView2: UIImageView!
  
  let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  @IBAction func rollButtonPressed(_ sender: UIButton) {
    diceImageView1.image = diceArray.randomElement()
    diceImageView2.image = diceArray.randomElement()
    
  }
  
}

