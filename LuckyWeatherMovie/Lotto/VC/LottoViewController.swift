//
//  ViewController.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

import SnapKit
import Alamofire

class LottoViewController: UIViewController {
    
    lazy var searchingRound = 1119 + calculatePassedWeek()
    
    var lottoData: LottoDTO? {
        didSet {
            guard let lottoData,
                    let drwNo = lottoData.drwNo,
                  let drwNoDate = lottoData.drwNoDate
            else {
                return
                
            }
            firstBall.winningNumber = lottoData.drwtNo1
            secondBall.winningNumber = lottoData.drwtNo2
            thirdBall.winningNumber = lottoData.drwtNo3
            fourthBall.winningNumber = lottoData.drwtNo4
            fifthBall.winningNumber = lottoData.drwtNo5
            sixthBall.winningNumber = lottoData.drwtNo6
            bonusBall.winningNumber = lottoData.bnusNo
            winningResultRoundLabel.text = "\(drwNo)회 당첨결과"
            winningResultRoundLabel.setFontColorRange(targetString: "\(drwNo)", font: .boldSystemFont(ofSize: 30), color: UIColor(named: "keyColor"))
            dateLabel.text = "\(drwNoDate) 추첨"
            searchTextField.text = "\(drwNo)"
            roundPickerView.reloadAllComponents()
        }
    }
    
    lazy var searchTextField = {
        let view = UITextField()
        
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        view.keyboardType = .numberPad
        view.placeholder = "조회하실 회차를 입력하세요"
        
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        
        return view
    }()
    
    lazy var winningInfoLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.text = "당첨번호 안내"
        
        return view
    }()
    
    lazy var dateLabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .gray
        view.font = .systemFont(ofSize: 13)
        
        return view
    }()
    
    lazy var seperatorLine = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    lazy var winningResultRoundLabel = {
        let view = UILabel()
        view.text = ""
        view.font = .systemFont(ofSize: 25, weight: .semibold)
        
        return view
    }()
    
    let firstBall = WinningBall()
    let secondBall = WinningBall()
    let thirdBall = WinningBall()
    let fourthBall = WinningBall()
    let fifthBall = WinningBall()
    let sixthBall = WinningBall()
    let bonusBall = WinningBall()
    let plus = {
        let view = UIImageView()
        view.image = UIImage(systemName: "plus")
        view.tintColor = .black
        view.contentMode = .center
        return view
    }()
    
    lazy var resultBallStackView = {
        let winningBalls = [
            firstBall,
            secondBall,
            thirdBall,
            fourthBall,
            fifthBall,
            sixthBall,
            plus,
            bonusBall
        ]
        
        let stackView = UIStackView(arrangedSubviews: winningBalls)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var bonusLabel = {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 12)
        view.text = "보너스"
        
        return view
    }()
    
    lazy var roundPickerView = {
        let view = UIPickerView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        searchTextField.delegate = self
        roundPickerView.delegate = self
        roundPickerView.dataSource = self
        
        configureHierachy()
        configureLayout()
        loadRecentWinningResult()
        
    }
    
    func loadRecentWinningResult() {
        var tempLotto = lottoData
        
        DispatchQueue.global().async {
            repeat {
                let semaphore = DispatchSemaphore(value: 0)
                Network.getRequest(round: self.searchingRound) { lotto in
                    tempLotto = lotto
                    if tempLotto?.returnValue == "success" {
                        DispatchQueue.main.async {
                            self.lottoData = lotto
                        }
                    }
                    self.searchingRound += 1
                    semaphore.signal()
                }
                semaphore.wait() // 네트워크 요청이 완료될 때까지 대기
            } while tempLotto?.returnValue == "success"
            self.roundPickerView.reloadAllComponents()
            self.roundPickerView.selectRow(self.searchingRound - 3, inComponent: 0, animated: true)
        }
    }
    
    func calculatePassedWeek() -> Int {
        guard let startDate = Calendar.current.date(from: DateComponents(year:2024,
                                                                         month: 5,
                                                                         day: 25)),
              let passedDay = Calendar.current.dateComponents([.day],
                                                              from: startDate,
                                                              to: Date.now).day
        else {
            return 0
        }
        let passedWeek = passedDay / 7
        return passedWeek
    }
    
    func configureHierachy() {
        view.addSubview(searchTextField)
        view.addSubview(winningInfoLabel)
        view.addSubview(dateLabel)
        view.addSubview(seperatorLine)
        view.addSubview(winningResultRoundLabel)
        view.addSubview(resultBallStackView)
        view.addSubview(bonusLabel)
        view.addSubview(roundPickerView)
    }
}

