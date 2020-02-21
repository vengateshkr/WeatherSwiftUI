//
//  ForecastViewModel.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import Foundation

class ForecastViewModel : ObservableObject {
    var weatherService = WeatherApiService()
    var cityName : String = "Chennai"
    @Published var weatherForecastResp : MainForecastResponse!
    
    func searchCity() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    func fetchWeather(by city : String) {
        self.weatherService.getWeatherResponse(city: city) { (data) in
            if let data = data {
                DispatchQueue.main.async {
                    self.weatherForecastResp = data
                    print(data)
                }
            }
        }
    }
}

