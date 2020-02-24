//
//  ForecastViewModel.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import Foundation

class ForecastViewModel : ObservableObject {
    @Published var weatherForecastResp : MainForecastResponse!
    var cityName : String = "Chennai"
    var weatherService = WeatherApiService()
    
    var currentCityName : String {
        return weatherForecastResp != nil ?  weatherForecastResp.city.name : ""
    }
    var currentCountryName : String {
        return weatherForecastResp != nil ? weatherForecastResp.city.country : ""
    }
    
    var weatherDay : String {
        if weatherForecastResp != nil , let day = self.weatherForecastResp.list.first?.dt {
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        } else {
            return ""
        }
    }
    
    var weatherDecription : String {
        if weatherForecastResp != nil , let desc = self.weatherForecastResp.list.first?.weather.first?.weatherDescription {
            let formattedDesc = desc.capitalized(with: .current)
            return formattedDesc
        } else {
            return ""
        }
    }
    
    var temperature : String {
        if weatherForecastResp != nil , let temp = self.weatherForecastResp.list.first?.temp.day {
            return String(format:"%.0f",temp)
        } else {
            return ""
        }
    }
    
    var wind : String {
        if weatherForecastResp != nil , let temp = self.weatherForecastResp.list.first?.speed {
            return String(format:"%.0f",temp)
        } else {
            return ""
        }
    }
    
    var humidity : String {
        if weatherForecastResp != nil , let temp = self.weatherForecastResp.list.first?.humidity {
            return String(format:"%d",temp)
        } else {
            return ""
        }
    }
    
    var maxTemp : String {
        if weatherForecastResp != nil , let temp = self.weatherForecastResp.list.first?.temp.max {
            return String(format:"%.0f",temp)
        } else {
            return ""
        }
    }
    
    func getForecastList() -> [List] {
        if weatherForecastResp != nil {
            return self.weatherForecastResp.list
        } else {
            return []
        }
    }
    
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

