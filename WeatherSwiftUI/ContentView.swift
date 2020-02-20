//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var forecastViewModel : ForecastViewModel
    
    init() {
        self.forecastViewModel = ForecastViewModel()
    }
    
    var body: some View {
        ZStack {
            BackSplash()
            
            TextField("Enter a city name", text: self.$forecastViewModel.cityName) {
                self.forecastViewModel.searchCity()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
