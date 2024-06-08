//
//  ViewController.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

class LottoViewController: UIViewController {
    
    lazy var searchTextField = {
        let view = UITextField()
        
        
        return view
    }()
    
    lazy var winningInfoLabel = {
        let view = UILabel()
        
        
        return view
    }()
    
    lazy var dateLabel = {
        let view = UILabel()
        
        
        return view
    }()
    
    lazy var seperatorView = {
        let view = UIView()
        
        return view
    }()
    
    let firstBall = UILabel()
    let secondBall = UILabel()
    let thirdBall = UILabel()
    let fourthBall = UILabel()
    let fifthBall = UILabel()
    let sixthBall = UILabel()
    let plus = UILabel()
    let bonusBall = UILabel()
    
    lazy var resultBallStackView = {
        let view = UIStackView()
        
        
        return view
    }()
    
    lazy var resultLabel = {
        let view = UILabel()
        
        
        return view
    }()
    
    lazy var bonusLabel = {
        let view = UILabel()
        
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    func configureHierachy() {
        view.addSubview(searchTextField)
        view.addSubview(winningInfoLabel)
        view.addSubview(dateLabel)
        view.addSubview(seperatorView)
        view.addSubview(resultBallStackView)
        view.addSubview(resultLabel)
        view.addSubview(bonusLabel)
    }
    
    func configureUI() {
        
    }
}

extension LottoViewController {
    
    func configureLayout() {
        
    }
}
