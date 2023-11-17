//
//  HourlyCell.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//


import UIKit
import Common
import WeatherAPI
import Kingfisher


final class HourlyCell: ForecastBaseCell<HourlyCellPresenter>, ReusableView {
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
        middleStack.addArrangedSubview(highLabel)
    }
    
    override func configure() {
        dateLabel.text = presenter.hourlyDTO.day
        titleLabel.text = presenter.hourlyDTO.weather.descZip.capitalized
        lowLabel.text = presenter.hourlyDTO.popStr
        highLabel.text = presenter.hourlyDTO.cloudsStr
        weatherImageView.kf.setImage(with: presenter.hourlyDTO.weather.firstImage)
    }
}
