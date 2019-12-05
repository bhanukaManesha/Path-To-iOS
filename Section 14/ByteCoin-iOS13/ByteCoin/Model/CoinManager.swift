//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didUpdateValue(_ coinManager : CoinManager, coin : Coin)
    func didFailWithError(error : Error)
}

struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate : CoinManagerDelegate?
    
    
    func getCoinPrice(currency : String){
        
        let url = baseURL + currency
        
        print(url)
        performRequest(with: url)

    }
    
    func performRequest(with urlString : String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error : error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let coinValue = self.parseJSON(safeData){
                        
                        self.delegate?.didUpdateValue(self, coin: coinValue)
                    }
                    
                    
                }
            }
            
            task.resume()
            
            
        }
    }
    
    
    func parseJSON(_ data : Data) -> Coin? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let coin = Coin(last: decodedData.last)
            
            return coin
        
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}
