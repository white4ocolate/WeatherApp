//
//  Extensions.swift
//  WeatherApp
//
//  Created by white4ocolate on 05.08.2024.
//

import Foundation

extension Double {
    
    ///We will round the double, on wich we will call roundDouble function, to zero decimals.
    func roundDouble() -> String {
        
        return String(format: "%.0f", self)
    }
}
