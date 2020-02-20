//
//  MainForecast.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import Foundation

struct MainForecastResponse: Codable {
    var city : City?
    var cod : String?
    var message : Double?
    var cnt : Int?
    var list : [MainForecastParams]?
}

struct MainForecastParams : Codable {
    var dt : Int?
    var temp : Temp?
    var pressure : Double?
    var weather : [Weather]?
    var speed : Int?
    var deg : Int?
    var clouds : Int?
}

struct Weather : Codable {
    var id : Int?
    var main : String?
    var description : String?
    var icons : String?
}

struct City : Codable {
    var id: Int?
    var name : String?
    var coord : Coord?
    var country : String?
    var population : Int?
    var timeZone : Int?
}

struct Coord: Codable {
    var lat : Double?
    var lon : Double?
}

struct Temp : Codable {
    var day : Double?
    var min : Double?
    var max : Double?
    var night : Double?
    var eve : Double?
    var morn : Double?
}
