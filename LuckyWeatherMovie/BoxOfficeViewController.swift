//
//  BoxOfficeViewController.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

class BoxOfficeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
 
//    lazy var searchingRound = 1120 + calculatePassedWeek()
//    
//    func calculatePassedWeek() -> Int {
//        guard let startDate = Calendar.current.date(from: DateComponents(year:2024,
//                                                                         month: 5,
//                                                                         day: 25)),
//              let passedDay = Calendar.current.dateComponents([.day],
//                                                              from: startDate,
//                                                              to: Date.now).day
//        else {
//            return 0
//        }
//        let passedWeek = passedDay / 7
//        return passedWeek
//    }
}

//
//DispatchQueue.global().async {
//    repeat {
//        let semaphore = DispatchSemaphore(value: 0)
//        Network.getRequest(round: self.searchingRound) { lotto in
//            if lotto.returnValue != "success" {
//                DispatchQueue.main.async {
//                    self.lottoData = lotto
//                }
//            } else {
//                tempLotto = lotto
//            }
//            self.searchingRound += 1
//            semaphore.signal()
//        }
//        semaphore.wait() // 네트워크 요청이 완료될 때까지 대기
//    } while tempLotto?.returnValue == "success"
//    self.roundPickerView.reloadAllComponents()
//    self.roundPickerView.selectRow(self.searchingRound-3, inComponent: 0, animated: true)
//}
