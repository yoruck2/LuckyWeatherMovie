//
//  Array+\.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/10/24.
//

extension Array {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
