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

private extension HourlyCell {
    enum Constants {
        static let cloudImageName = "cloud.fill"
        static let rainImageName = "drop.fill"
        static let humidityImageName = "humidity.fill"
    }
}

final class HourlyCell: ForecastBaseCell<ForecastBaseCellPresenter<HourlyDTO>, HourlyDTO>, ReusableView {
    private lazy var cloudLabel = labelGenerator(imageName: Constants.cloudImageName)
    private lazy var rainLabel = labelGenerator(imageName: Constants.rainImageName)
    private lazy var humidityLabel = labelGenerator(imageName: Constants.rainImageName)
    
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
    
    override func configure(dto: HourlyDTO) {
        dateLabel.text = dto.time
        titleLabel.text = dto.weather.descZip.capitalized
        rainLabel.setTitle(dto.popStr, for: .normal)
        cloudLabel.setTitle(dto.cloudsStr, for: .normal)
        humidityLabel.setTitle(dto.humidityStr, for: .normal)
        weatherImageView.kf.setImage(with: dto.weather.firstImage)
    }
}
