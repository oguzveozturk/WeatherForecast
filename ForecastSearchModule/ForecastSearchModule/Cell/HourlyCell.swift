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

final class HourlyCell: ForecastBaseCell<ForecastBaseCellPresenter<HourlyDTO>>, ReusableView {
    private lazy var cloudLabel = labelGenerator(imageName: "cloud.fill")
    private lazy var rainLabel = labelGenerator(imageName: "drop.fill")
    private lazy var humidityLabel = labelGenerator(imageName: "humidity.fill")
    
    func labelGenerator(imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }
    
    override func setupLayout() {
        super.setupLayout()
        middleStack.distribution = .equalSpacing
        middleStack.addArrangedSubviews(cloudLabel, rainLabel, humidityLabel)
    }
    
    override func configure() {
        dateLabel.text = presenter.dto.time
        titleLabel.text = presenter.dto.weather.descZip.capitalized
        rainLabel.setTitle(presenter.dto.popStr, for: .normal)
        cloudLabel.setTitle(presenter.dto.cloudsStr, for: .normal)
        humidityLabel.setTitle(presenter.dto.humidityStr, for: .normal)
        weatherImageView.kf.setImage(with: presenter.dto.weather.firstImage)
    }
}
