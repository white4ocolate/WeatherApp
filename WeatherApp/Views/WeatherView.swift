//
//  WeatherView.swift
//  WeatherApp
//
//  Created by white4ocolate on 05.08.2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: CurrentWeatherData
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.day().month().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text(weather.main.temp.roundDouble() + "°C")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color(hue: 0.768, saturation: 0.869, brightness: 0.443))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
