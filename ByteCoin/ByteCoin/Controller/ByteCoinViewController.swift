//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ByteCoinViewController: UIViewController {
  
  @IBOutlet var coinLabel: UILabel!
  @IBOutlet var currencyLabel: UILabel!
  @IBOutlet var currencyPicker: UIPickerView!

  var coinManager = CoinManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      coinManager.delegate = self

      currencyPicker.dataSource = self
      currencyPicker.delegate = self
      
    }
}

//MARK: - CoinManagerDelegate

extension ByteCoinViewController: CoinManagerDelegate {
  func didUpdatePrice(price: String, currency: String) {
    DispatchQueue.main.async {
      self.coinLabel.text = price
      self.currencyLabel.text = currency
    }
  }

  func didFailWithError(error: Error) {
    print(error)
  }
}

//MARK: - UIPickerViewDelegate

extension ByteCoinViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return coinManager.currencyArray.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return coinManager.currencyArray[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectedCurrency = coinManager.currencyArray[row]
    coinManager.getCoinPrice(for: selectedCurrency)
  }
}

