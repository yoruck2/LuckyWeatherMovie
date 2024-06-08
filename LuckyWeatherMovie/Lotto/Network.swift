//
//  LottoResponse.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import Foundation
import Alamofire

struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, firstPrzwnerCo, firstAccumamnt, drwNo: Int
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo: Int
}

struct Network {
    static func getRequest(round: Int, completion: @escaping (Lotto) -> Void) {
        AF.request("\(APIURL.lottoURL)\(round)")
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let value):
                    completion(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

