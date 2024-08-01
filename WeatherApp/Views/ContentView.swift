//
//  ContentView.swift
//  WeatherApp
//
//  Created by white4ocolate on 01.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    ///We added @StateObject property wrapper, so that the view can be notified every time that te @Published veriables in our LocationManager are updated.
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.768, saturation: 0.869, brightness: 0.443))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
