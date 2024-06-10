//
//  MovieDTO.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/10/24.
//

import Foundation


struct BoxOfficeDTO: Codable {
    let boxOfficeResult: BoxOfficeResult
}


struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}


struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten, rankOldAndNew: String
    let movieCd, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String
}


