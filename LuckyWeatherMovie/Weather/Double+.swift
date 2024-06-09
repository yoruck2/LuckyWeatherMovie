//
//  Double+.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/10/24.
//

import Foundation

extension Double {
    
    var celsius: Int {
        let celsius = UnitTemperature.celsius.converter.value(fromBaseUnitValue: self)
        return Int(celsius.rounded(.toNearestOrAwayFromZero))
    }
}
