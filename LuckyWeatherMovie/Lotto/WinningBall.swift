//
//  WinningBall.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit
import SnapKit

class WinningBall: UILabel {
    
    var winningNumber: Int = 12 {
        didSet {
            backgroundColor = color
            text = String(winningNumber)
        }
    }
    
    override func layoutSubviews() {
        textColor = .white
        textAlignment = .center
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        backgroundColor = color
        
        snp.makeConstraints {
            $0.width.equalTo(safeAreaLayoutGuide).multipliedBy(0.05)
            $0.height.equalTo(self.snp.width)
        }
    }

    var color: UIColor {
        switch self.winningNumber {
        case 1...10:
            return #colorLiteral(red: 1, green: 0.7942265868, blue: 0, alpha: 1)
        case 11...20:
            return #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        case 21...30:
            return #colorLiteral(red: 1, green: 0.4093799591, blue: 0.3997744322, alpha: 1)
        case 31...40:
            return .gray
        case 41...45:
            return #colorLiteral(red: 0.1715768278, green: 0.7817131877, blue: 0.06299539655, alpha: 1)
        default:
            return .clear
        }
    }
    
}
