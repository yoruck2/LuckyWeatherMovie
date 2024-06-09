//
//  TextField.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/9/24.
//

import UIKit

extension LottoViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text, let round = Int(text) else {
            return
        }
        guard round >= 0 else {
            return
        }
        
        Network.getRequest(round: round) { [weak self] lotto in
            self?.lottoData = lotto
        }
        roundPickerView.selectRow(round - 1, inComponent: 0, animated: true)
        
    }
}

