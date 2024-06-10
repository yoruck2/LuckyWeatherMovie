//
//  Int+.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/10/24.
//

import Foundation

extension Int {
    
    func formatDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "MM월 dd일 HH시 mm분"
        let result = dateFormatter.string(from: date)
        
        return result
    }
}
