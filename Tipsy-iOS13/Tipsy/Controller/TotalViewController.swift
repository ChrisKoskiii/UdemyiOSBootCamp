//
//  TotalViewController.swift
//  Tipsy
//
//  Created by Christopher Koski on 2/23/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {

  @IBOutlet var totalLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  
  var total: Double?
  var amountOfPeople: Int?
  var tipPercent: Int?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    totalLabel.text = String(total!) ?? "Total not found"
    descriptionLabel.text = "Split between \(amountOfPeople ?? 2) people, with \(tipPercent ?? 20)% tip."
      
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  @IBAction func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
}
