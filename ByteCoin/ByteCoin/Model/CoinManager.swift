//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
  func didUpdatePrice(price: String, currency: String)
  func didFailWithError(error: Error)
}

struct CoinManager {
  
  var delegate: CoinManagerDelegate?
  
  let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
  let apiKey = "541112F5-5C30-44D2-93A5-773940E8C86F"
  
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
  func getCoinPrice(for currency: String) {
    //Create the api call URL
    let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
    
    //Unwrap the URL
    if let url = URL(string: urlString) {
      
      //Create the URLSession
      let session = URLSession(configuration: .default)
      
      //Create the data task for the URLSession
      let task = session.dataTask(with: url) { (data, response, error) in
        if error != nil {
          print(error!)
          return
        }
        
        //Format the data we got back as as String
        if let safeData = data {
          
          if let bitCoinPrice = self.parseJSON(safeData) {
            
            //Left out this part!!! UI wasnt updating
            
            let priceString = String(format: "%.2f", bitCoinPrice)
            self.delegate?.didUpdatePrice(price: priceString, currency: currency)
          }
            
        }
        
      }
      
      //Start task to fetch the bitcoin averages
      task.resume()
    }
  }
  
  func parseJSON(_ data: Data) -> Double? {
    let decoder = JSONDecoder()
    do {
      let decodedData = try decoder.decode(CoinData.self, from: data)
      let lastPrice = decodedData.rate
      print(lastPrice)
      return lastPrice
    } catch {
      print(error)
      return nil
    }
  }
}
