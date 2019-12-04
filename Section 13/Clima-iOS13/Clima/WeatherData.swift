//
//  WeatherData.swift
//  Clima
//
//  Created by Bhanuka Gamage on 12/4/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation


struct WeatherJSON : Codable {
    let list : [WeatherData]
}

struct WeatherData : Codable {
    
    let name : String
    let main : Main
    let weather : [Weather]

}

struct Main : Codable {
    let temp : Double
}

struct Weather : Codable {
    let id : Int
}
