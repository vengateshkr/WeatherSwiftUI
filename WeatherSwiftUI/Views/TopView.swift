//
//  TopView.swift
//  WeatherSwiftUI
//
//  Created by Venkatesh on 2/22/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct TopView: View {
    
    @ObservedObject var forecastViewModel : ForecastViewModel
    @State var showTextField = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                TextField("Enter a city name", text: self.$forecastViewModel.cityName) {
                    self.forecastViewModel.searchCity()
                }.padding(.all, 10)
                    .frame(width: screenWidth - 50, height: 50)
                    .foregroundColor(.white)
                    .background(Color("lightBlue"))
                    .cornerRadius(30)
                    .offset(x:self.showTextField ? 0.0 : (-screenWidth / 2 - 180))
                    .animation(.spring())
                
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width:40,height:40)
                    .foregroundColor(Color.white)
                    .offset(x: self.showTextField ? (screenWidth - 90) : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.showTextField.toggle()
                }
            }
        }.onAppear(perform: fetch)
    }
    
    func fetch() {
        self.forecastViewModel.searchCity()
    }

}

