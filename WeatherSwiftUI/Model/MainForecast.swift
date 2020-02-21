//
//  MainForecast.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import Foundation

// MARK: - MainForecastResponse
struct MainForecastResponse: Codable {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let temp: Temp
    let pressure: Double
    let humidity: Int
    let weather: [Weather]
    let speed: Double
    let deg, clouds: Int
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
