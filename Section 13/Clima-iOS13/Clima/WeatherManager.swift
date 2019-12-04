//
//  WeatherManager.swift
//  Clima
//
//  Created by Bhanuka Gamage on 12/4/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager : WeatherManager, weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?appid=33a35d4a4726eb313830aeca9b6b686e&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude : CLLocationDegrees, longitude : CLLocationDegrees) {
           let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
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
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let weather = self.parseJSON(weatherData : safeData) {
                        
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                    }
                    
                }
            }
            
            
            // 4. Start the task
            task.resume()
            
            
        }
        
    }
    
    func parseJSON(weatherData : Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherJSON.self, from: weatherData)
            
            let id = decodedData.list[0].weather[0].id
            
            let temp = decodedData.list[0].main.temp
            
            let name = decodedData.list[0].name
            
            let weather = WeatherModel(condtionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    

}
