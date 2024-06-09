//
//  UILabel+.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

extension UILabel {
    
    func setFontColorRange(targetString: String, font: UIFont?, color: UIColor?) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
}

