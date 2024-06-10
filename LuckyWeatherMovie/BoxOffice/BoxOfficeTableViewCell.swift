//
//  BoxOfficeTableViewCell.swift
//  LuckyWeatherMovie
//
//  Created by dopamint on 6/11/24.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {
    
    static let identifier = "BoxOfficeTableViewCell"
    
    lazy var movieRank = {
        let view = UILabel()
        view.text = "Daily BoxOffice"
        view.textColor = UIColor(named: "keyColor")
        view.font = UIFont(name: "Futura Bold", size: 20)
        view.textAlignment = .center
        return view
    }()
    
    lazy var movieTitle = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Futura Bold", size: 15)
        return view
    }()
    
    lazy var releaseDate = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont(name: "Futura Bold", size: 10)
        view.textAlignment = .right
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(movieRank)
        contentView.addSubview(movieTitle)
        contentView.addSubview(releaseDate)
        configureCellLayout()
        
    }
    
    func configureCellLayout() {
        movieRank.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading)
            $0.verticalEdges.equalTo(contentView)
            $0.width.equalTo(20)
        }
        movieTitle.snp.makeConstraints {
            $0.leading.equalTo(movieRank.snp.trailing).offset(3)
        }
        releaseDate.snp.makeConstraints {
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.leading.equalTo(movieTitle.snp.trailing)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
