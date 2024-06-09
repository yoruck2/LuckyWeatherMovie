//
//  UIView+.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/10/24.
//

import UIKit

extension UIView {
    
    func appearMoition() {
        transform = CGAffineTransform(translationX: 0, y: 20)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
            self.transform = .identity
        })
    }
    
}
