//
//  WeatherManager.swift
//  Clima
//
//  Created by Bhanuka Gamage on 12/4/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=33a35d4a4726eb313830aeca9b6b686e&units=metric"

    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        
        print(urlString)
        
        // 1. Create the URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            
            // 3. Give the sesssion a task
            let task = session.dataTask(with: url) { (data, respone, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    self.parseJSON(weatherData : safeData)
                    
                }
            }
            
            
            // 4. Start the task
            task.resume()
            
            
        }
        
    }
    
    func parseJSON(weatherData : Data) {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherJSON.self, from: weatherData)
            print(decodedData.list[0].main)
            print(decodedData.list[0].weather[0].description)
        } catch {
            print(error)
        }
        
        
        
        
        
        
    }
}
