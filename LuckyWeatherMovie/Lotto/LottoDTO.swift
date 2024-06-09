//
//  LottoDTO.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/9/24.
//

struct LottoDTO: Codable {
    let totSellamnt: Int?  // 누적 당첨금
    let returnValue: String // 실행 결과
    let drwNoDate: String? // 당첨 날짜
    let firstWinamnt, firstPrzwnerCo, firstAccumamnt, drwNo: Int? // 1등 당첨금, 1등 당첨 인원, 1등 당첨 총금액, 회차
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo: Int? // 당첨번호
}
