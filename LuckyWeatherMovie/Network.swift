//
//  LottoResponse.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import Alamofire

struct Network {
    static func getRequest(round: Int, completion: @escaping (LottoDTO) -> Void) {
        AF.request("\(APIURL.lottoURL)\(round)")
            .responseDecodable(of: LottoDTO.self) { response in
                switch response.result {
                case .success(let value):
                    completion(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func weatherGetRequest(completion: @escaping (WeatherDTO) -> Void) {
        AF.request("\(APIURL.weatherURL)")
            .responseDecodable(of: WeatherDTO.self) { response in
                switch response.result {
                case .success(let value):
                    completion(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

