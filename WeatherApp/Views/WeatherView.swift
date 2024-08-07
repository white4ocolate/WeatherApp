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
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.temp.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2021/12/20/04/04/buildings-6882271_1280.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                        //placeholder - is what the users sees while the data image is being downloaded
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: String(weather.main.humidity) + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundStyle(Color(hue: 0.768, saturation: 0.869, brightness: 0.443))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        } 
        .ignoresSafeArea(edges: .bottom)
        .background(Color(hue: 0.768, saturation: 0.869, brightness: 0.443))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
