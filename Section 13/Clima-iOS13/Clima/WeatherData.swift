//
//  WeatherData.swift
//  Clima
//
//  Created by Bhanuka Gamage on 12/4/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation


struct WeatherJSON : Decodable {
    let list : [WeatherData]
}

struct WeatherData : Decodable {
    
    let name : String
    let main : Main
    let weather : [Weather]

}

struct Main : Decodable {
    let temp : Double
}

struct Weather : Decodable {
    let description : String
}
