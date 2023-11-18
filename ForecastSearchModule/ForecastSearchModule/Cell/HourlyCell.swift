//
//  HourlyCell.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//


import UIKit
import Common
import struct WeatherAPI.HourlyDTO
import Kingfisher

private extension HourlyCell {
    enum Constants {
        static let cloudImageName = "cloud.fill"
        static let rainImageName = "drop.fill"
        static let humidityImageName = "humidity.fill"
        static let windImageName = "wind"
    }
}

final class HourlyCell: ForecastBaseCell<ForecastBaseCellPresenter<HourlyDTO>>, ReusableView {
    private lazy var rainLabel = labelGenerator(imageName: Constants.rainImageName)
    private lazy var humidityLabel = labelGenerator(imageName: Constants.humidityImageName)
    private lazy var windLabel = labelGenerator(imageName: Constants.windImageName)
    
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
        middleStack.addArrangedSubviews(rainLabel, humidityLabel, windLabel)
    }
    
    override func configure() {
        dateLabel.text = presenter.dto.time
        titleLabel.text = presenter.dto.weather.descZip.capitalized
        rainLabel.setTitle(presenter.dto.rainStr, for: .normal)
        humidityLabel.setTitle(presenter.dto.humidityStr, for: .normal)
        windLabel.setTitle(presenter.dto.windStr, for: .normal)
        weatherImageView.kf.setImage(with: presenter.dto.weather.firstImage)
    }
}
