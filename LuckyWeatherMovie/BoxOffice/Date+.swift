//
//  String+.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/11/24.
//

import Foundation

extension Date {
    
    var formatedYesterday: String {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        let yesterday = Calendar.current.date(bySetting: .day, value: -1, of: self)
        let result = format.string(from: yesterday ?? Date())
        return result
    }
}
