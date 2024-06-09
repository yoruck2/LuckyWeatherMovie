//
//  APIURL.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import Foundation
    
struct APIURL {
    static let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="
    static let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=\(APIType.weatherAPI.APIkey)"
    static let movieURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIType.movieAPI.APIkey)"
}

enum APIType {
    case movieAPI
    case weatherAPI

    var APIkey: String {
        let keyName: String
        
        switch self {
        case .movieAPI:
            keyName = "MOVIE_API_KEY"
        case .weatherAPI:
            keyName = "WEATHER_API_KEY"
        }
        guard let key = Bundle.main.object(forInfoDictionaryKey: keyName) as? String else {
            assertionFailure("API_KEY를 찾을 수 없음")
            return ""
        }
        return key
    }
}
