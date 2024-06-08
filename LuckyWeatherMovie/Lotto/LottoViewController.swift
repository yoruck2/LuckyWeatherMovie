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
    
    var round = 1122
    
    var lottoData: Lotto? {
        didSet {
            guard let lottoData else {
                return
            }
            self.firstBall.winningNumber = lottoData.drwtNo1
            self.secondBall.winningNumber = lottoData.drwtNo2
            self.thirdBall.winningNumber = lottoData.drwtNo3
            self.fourthBall.winningNumber = lottoData.drwtNo4
            self.fifthBall.winningNumber = lottoData.drwtNo5
            self.sixthBall.winningNumber = lottoData.drwtNo6
            self.bonusBall.winningNumber = lottoData.bnusNo
            self.winningResultRoundLabel.text = "\(lottoData.drwNo)회 당첨결과"
            self.dateLabel.text = "\(lottoData.drwNoDate) 추첨"
        }
    }
    
    lazy var searchTextField = {
        let view = UITextField()
        
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        
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
    
    var firstBall = WinningBall()
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
        
        configureHierachy()
        configureLayout()
        configureUI()
        searchTextField.delegate = self
        roundPickerView.delegate = self
        roundPickerView.dataSource = self
        
        var tempLotto = lottoData
        
        // TODO: 왜 초기 회차 반영이 안되는지..? -
        repeat {
            Network.getRequest(round: round) { [weak self] lotto in
                tempLotto = lotto
                if tempLotto?.returnValue == "success" {
                    self?.lottoData = lotto
                }
                self?.round += 1
            }
        } while tempLotto?.returnValue == "success"
        roundPickerView.selectRow(round + 1, inComponent: 0, animated: true)
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
    
    func configureUI() {
        
    }
}

extension LottoViewController {
    
    func configureLayout() {
        
        searchTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(50)
        }
        
        winningInfoLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(40)
            $0.leading.equalTo(searchTextField).offset(-5)
            $0.height.equalTo(15)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(40)
            $0.trailing.equalTo(searchTextField).offset(5)
            $0.height.equalTo(15)
        }
        
        seperatorLine.snp.makeConstraints {
            $0.top.equalTo(winningInfoLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.height.equalTo(1)
        }
        
        winningResultRoundLabel.snp.makeConstraints {
            $0.top.equalTo(seperatorLine).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        
        resultBallStackView.snp.makeConstraints {
            $0.top.equalTo(winningResultRoundLabel.snp.bottom).offset(30)
            
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        bonusLabel.snp.makeConstraints {
            $0.top.equalTo(resultBallStackView.snp.bottom).offset(5)
            $0.trailing.equalTo(resultBallStackView.snp.trailing).inset(4)
        }
        
        roundPickerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(250)
        }
    }
}

extension LottoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, let round = Int(text) else {
            return false
        }
        Network.getRequest(round: round) { [weak self] lotto in
            self?.lottoData = lotto
        }
        return true
    }
    
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //        guard let text = textField.text, let round = Int(text) else {
    //            return
    //        }
    //        Network.getRequest(round: round) { [weak self] lotto in
    //            self?.lottoData = lotto
    //        }
    //    }
}
