//
//  BoxOfficeViewController.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/8/24.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    
    var boxOfficeDataList: [DailyBoxOfficeList] = [] {
        didSet {
            print("asdf")
            self.boxOfficeTableView.reloadData()
        }
    }
    
    lazy var titleLabel = {
        let view = UILabel()
        view.text = "Daily BoxOffice"
        view.textColor = .white
        view.font = UIFont(name: "Futura Bold", size: 30)
        view.textAlignment = .center
        return view
    }()    
    
    lazy var alertLabel = {
        let view = UILabel()
        view.text = ""
        view.textColor = .white
        view.font = UIFont(name: "Futura Bold", size: 13)
        view.textAlignment = .center
        return view
    }()
        
    lazy var searchTextField = {
        let view = UITextField()
        view.textColor = .white
        view.font = UIFont(name: "Futura Bold", size: 15)
        view.attributedPlaceholder = NSAttributedString(string: "yyyymmdd",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.textAlignment = .center
        view.addBottomBorder(with: .white, andWidth: 4)
        return view
    }()
        
    lazy var searchButton = {
        let view = UIButton()
        view.setTitle("검색", for: .normal)
        view.tintColor = UIColor(named: "keyColor")
        view.setTitleColor( .darkGray, for: .highlighted)
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: "keyColor")
        view.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return view
    }()
        
    lazy var boxOfficeTableView = {
        let view = UITableView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        
        Network.sendGetRequest(targetDate: Date().formatedYesterday) { data in
            self.boxOfficeDataList = data.boxOfficeResult.dailyBoxOfficeList
            print(#function)
        }
    }
    
    @objc
    func searchButtonTapped() {
        alertLabel.text = ""
        
        guard let text = searchTextField.text,
              let _ = Int(text) else {
            alertLabel.text = "⚠️ yyyymmdd 형식에 맞게 숫자만 입력하세요!"
            return
        }
        Network.sendGetRequest(targetDate: text) { data in
            self.boxOfficeDataList = data.boxOfficeResult.dailyBoxOfficeList
            print(#function)
//            self.boxOfficeTableView.reloadData()
        }
    }
    
    
    func configureHierachy() {
        view.addSubview(titleLabel)
        view.addSubview(alertLabel)
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(boxOfficeTableView)
    }
    
    func configureLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            
        }        
        alertLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            
        }
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(35)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-20)
            $0.height.equalTo(50)
        }
        searchButton.snp.makeConstraints {
            $0.top.equalTo(searchTextField)
            $0.height.equalTo(searchTextField)
            $0.width.equalTo(80)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        boxOfficeTableView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

extension BoxOfficeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView() {
        boxOfficeTableView.delegate = self
        boxOfficeTableView.dataSource = self
        boxOfficeTableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: BoxOfficeTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        boxOfficeDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier, for: indexPath) as! BoxOfficeTableViewCell
        cell.movieRank.text = boxOfficeDataList[indexPath.row].rank
        cell.movieTitle.text = boxOfficeDataList[indexPath.row].movieNm
        cell.releaseDate.text = boxOfficeDataList[indexPath.row].openDt
        
        return cell
    }
}

