//
//  File.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/10/24.
//

import UIKit

@IBDesignable class WeatherBubbleLabel: UILabel {
    
    @IBInspectable var topPadding: CGFloat = 0.0
    @IBInspectable var leftPadding: CGFloat = 0.0
    @IBInspectable var bottomPadding: CGFloat = 0.0
    @IBInspectable var rightPadding: CGFloat = 0.0

    convenience init(weatherText: String, _ padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)) {
        self.init()
        topPadding = padding.top
        leftPadding = padding.left
        bottomPadding = padding.bottom
        rightPadding = padding.right
        self.text = weatherText
        layer.cornerRadius = 8
        backgroundColor = .white
        clipsToBounds = true
        alpha = 0
        transform = CGAffineTransform(translationX: 0, y: 20)
    }
    
    override func drawText(in rect: CGRect) {
        let padding = UIEdgeInsets.init(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += self.leftPadding + self.rightPadding
        contentSize.height += self.topPadding + self.bottomPadding
        return contentSize
    }
    
}
