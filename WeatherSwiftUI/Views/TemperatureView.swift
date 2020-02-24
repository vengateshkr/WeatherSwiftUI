//
//  TemperatureView.swift
//  WeatherSwiftUI
//
//  Created by Venkatesh on 2/22/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    @ObservedObject var vm : ForecastViewModel
    var body: some View {
        VStack {
            HStack {
                Text("\(vm.temperature)")
                    .bold()
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                
                Text(self.vm.weatherDecription)
                    .foregroundColor(Color("secondary"))
            }
            
            HStack {
                VStack {
                    Text("\(self.vm.wind)")
                        .foregroundColor(Color("secondary"))
                    Text("Wind")
                        .foregroundColor(Color("secondary"))
                }
                VStack {
                    Text("\(self.vm.humidity)")
                        .foregroundColor(Color("secondary"))
                    Text("Humidity")
                        .foregroundColor(Color("secondary"))
                }
                VStack {
                    Text("\(self.vm.maxTemp)")
                        .foregroundColor(Color("secondary"))
                        .bold()
                    
                    Text("Max")
                        .foregroundColor(Color("secondary"))
                        .bold()
                }
                
            }            
        }
    }
}

//struct TemperatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        TemperatureView(vm: <#T##ForecastViewModel#>)
//    }
//}
