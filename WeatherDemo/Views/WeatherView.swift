//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Joko Priyono on 29/12/21.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}