//
//  WeatherApiService.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import Foundation


class WeatherApiService {
    
    func getWeatherResponse(city : String, completion: @escaping (MainForecastResponse?) -> ()) {
        
        guard let url = URL(string:"https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&appid=ac8e30ad408fc9d88681826daaeb7ea0&units=imperial") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data , err == nil else {
                completion(nil)
                return
            }
            
            guard let weatherResp = try? JSONDecoder().decode(MainForecastResponse.self, from: data) else {
                completion(nil)
                return
            }
            
            completion(weatherResp)
        }
    }
}
