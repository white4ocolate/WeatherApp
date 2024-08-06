//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by white4ocolate on 05.08.2024.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> CurrentWeatherData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=bee2a795253042be0dd149fb3ea52fb0&units=metric") else {fatalError("Missing URL")}
        print(url)
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data") }
        
        let decodedData = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
        
        return decodedData
    }
}
