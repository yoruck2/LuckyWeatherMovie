//
//  WeatherDTO.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/9/24.
//
import Foundation

struct WeatherDTO: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
    let dt: Int
}

struct Main: Decodable {
    let temp: Double
    let pressure, humidity: Int
    let tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}


