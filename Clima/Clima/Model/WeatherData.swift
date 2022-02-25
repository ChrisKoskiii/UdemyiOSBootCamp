//
//  WeatherData.swift
//  Clima
//
//  Created by Christopher Koski on 2/24/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
  let name : String
  let main: Main
  let weather: [Weather]
}

struct Main: Codable {
  let temp: Double
}

struct Weather: Codable {
  var id: Int
  var description: String
}
