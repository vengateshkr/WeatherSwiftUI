//
//  MiddleView.swift
//  WeatherSwiftUI
//
//  Created by Venkatesh on 2/22/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import SwiftUI

struct MiddleView: View {
    @ObservedObject var vm : ForecastViewModel
    var body: some View {
        VStack {
            VStack {
                Text("\(vm.currentCityName),\(vm.currentCountryName)")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.light)
                
                Text("\(vm.weatherDay)")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .bold()
            }
            Spacer()
        }.padding(.trailing, 220)
    }
}

//struct MiddleView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiddleView()
//    }
//}
