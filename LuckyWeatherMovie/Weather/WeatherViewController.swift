//
//  WeatherViewController.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

import Alamofire
import SnapKit
import Kingfisher

class WeatherViewController: UIViewController {
    
    var stackViewCount = 0
    
    // TODO: 날씨에 맞는 더 다양한 메세지와 배경 출력하기
    // TODO: APIURL를 다양한 쿼리에 대응하도록 만들기
    var weatherData: WeatherDTO? {
        didSet {
            guard let weatherData else {
                return
            }
            dateClockLabel.text = "\(weatherData.dt.formatDate()) 기준"
            print(weatherData.dt)
            weatherInfoBubble1 = WeatherBubbleLabel("현재 기온은 \(weatherData.main.temp.celsius)도 입니다")
            weatherInfoBubble2 = WeatherBubbleLabel("오늘 최저 기온은 \(weatherData.main.tempMin.celsius)도,\n 최저기온은 \(weatherData.main.tempMax.celsius)도 입니다")
            weatherInfoBubble3 = WeatherBubbleLabel("오늘의 날씨를 그림으로 표현하면...")
            let url = URL(string: "https://openweathermap.org/img/wn/\(weatherData.weather[0].icon).png")
            weatherInfoBubble4.kf.setImage(with: url)
            weatherInfoBubble5 = WeatherBubbleLabel("오늘도 즐거운 하루 되세요!")
        }
    }
    
    var weatherInfoBubble1 = WeatherBubbleLabel("날씨 정보를 불러오는 중입니다")
    var weatherInfoBubble2 = WeatherBubbleLabel("잠시만 기다려주세요...")
    var weatherInfoBubble3 = WeatherBubbleLabel("🥹")
    var weatherInfoBubble5 = WeatherBubbleLabel("")
    
    var weatherInfoBubble4 = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star")
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.alpha = 0
        view.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
        return view
    }()
    
    lazy var bubbles = [
        weatherInfoBubble1,
        weatherInfoBubble2,
        weatherInfoBubble3,
        weatherInfoBubble4,
        weatherInfoBubble5
    ]
    
    lazy var backgroundImageView = {
        let view = UIImageView()
        if weatherData?.weather[0].main == "Rain" {
            view.image = UIImage.animatedGif(named: "rainy")
        } else {
            view.image = UIImage.animatedGif(named: "breezy")
        }
        return view
    }()
    
    lazy var dateClockLabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .white
        view.font = .systemFont(ofSize: 13)
        return view
    }()
    
    // TODO: - 맵뷰를 띄운 후 지정한 좌표로 request를 보내 날씨 데이터를 가져오는 기능
    let mapButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "location.fill"), for: .normal)
        return view
    }()
    
    // TODO: - 도시 선택하는 기능
    let locationLabel = {
        let view = UILabel()
        view.text = "서울"
        view.textColor = .white
        view.font = .systemFont(ofSize: 25)
        return view
    }()
    
    let shareButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return view
    }()
    
    // TODO: 화면과 날씨 데이터를 갱신하는 기능
    let refreshButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        return view
    }()
    lazy var menus = [
        mapButton,
        locationLabel,
        shareButton,
        refreshButton
    ]
    
    lazy var menuBarStackView = {
        menus.forEach { $0.tintColor = .white }
        let stackview = UIStackView(arrangedSubviews: menus)
        stackview.spacing = 0
        stackview.distribution = .fillProportionally
        return stackview
    }()
    
    lazy var weatherInfoBubbleStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 15
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addBubble))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        Network.weatherGetRequest { data in
            self.weatherData = data
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if weatherInfoBubbleStackView.subviews.isEmpty {
            let guideMessage = WeatherBubbleLabel("안녕하세요!\n화면을 탭하면 현재 날씨를 알려드릴게요!")
            weatherInfoBubbleStackView.addArrangedSubview(guideMessage)
            guideMessage.appearMoition()
        }
    }
    
    func configureHierachy() {
        view.addSubview(backgroundImageView)
        view.addSubview(dateClockLabel)
        view.addSubview(menuBarStackView)
        view.addSubview(weatherInfoBubbleStackView)
    }
    
    func configureLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dateClockLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        menuBarStackView.snp.makeConstraints {
            $0.top.equalTo(dateClockLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        weatherInfoBubbleStackView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(menuBarStackView.snp.bottom).offset(20)
            $0.trailing.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
    
    @objc func addBubble() {
        guard let newBubble = bubbles[safe: stackViewCount] else {
            return
        }
        stackViewCount += 1
        weatherInfoBubbleStackView.addArrangedSubview(newBubble)
        newBubble.appearMoition()
    }
}
