//
//  BackSplash.swift
//  WeatherSwiftUI
//
//  Created by Gabriel on 2/20/20.
//  Copyright © 2020 TCS. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var gradient = Gradient(colors: [Color("lightPink"),Color("lightBlue")])
    var body: some View {
        Rectangle()
        .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
