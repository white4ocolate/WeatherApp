//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by white4ocolate on 01.08.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the weather app")
                    .bold().font(.title)
                Text("Please share your current location to get the weatther in your area")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .clipShape(.rect(cornerRadius: 30))
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity) // full screen
    }
}

#Preview {
    WelcomeView()
}
