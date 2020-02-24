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
            VStack{
                TopView(forecastViewModel: self.forecastViewModel,showTextField: false)
                MiddleView(vm: self.forecastViewModel)
                VStack(alignment: .center, spacing: 8) {
                    Image(systemName: Helper().showWeatherIcon(item: self.forecastViewModel.weatherForecastResp))
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .scaledToFit()
                        .foregroundColor(.white)
                    TemperatureView(vm: self.forecastViewModel)
                    
                    Text("7-Day Weather Forecast")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .bold()
                        .padding(.all, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.forecastViewModel.getForecastList(),id: \.dt) { forecast in
                                BottomScrollForecast(forecastData : forecast)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
