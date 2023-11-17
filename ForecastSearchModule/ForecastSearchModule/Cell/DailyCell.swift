//
//  DailyCell.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import Common
import WeatherAPI
import Kingfisher


final class DailyCell: ForecastBaseCell<DailyCellPresenter>, ReusableView {
    private lazy var tempatureView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var highLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    private lazy var lowLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override func setupLayout() {
        super.setupLayout()
        middleStack.addArrangedSubview(lowLabel)
        middleStack.addArrangedSubview(tempatureView)
        middleStack.addArrangedSubview(highLabel)
        NSLayoutConstraint.activate([
            tempatureView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    override func configure() {
        dateLabel.text = presenter.dailyDTO.day
        titleLabel.text = presenter.dailyDTO.weather.descZip.capitalized
        lowLabel.text = presenter.dailyDTO.low
        highLabel.text = presenter.dailyDTO.high
        weatherImageView.kf.setImage(with: presenter.dailyDTO.weather.firstImage)
    }
}
