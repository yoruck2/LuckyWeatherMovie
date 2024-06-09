//
//  Constraints.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/9/24.
//

import Foundation

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
