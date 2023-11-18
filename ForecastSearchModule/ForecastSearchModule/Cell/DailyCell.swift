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

final class DailyCell: ForecastBaseCell<ForecastBaseCellPresenter<DailyDTO>>, ReusableView {
    private lazy var tempatureView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 4
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
        middleStack.addArrangedSubviews(lowLabel, tempatureView, highLabel)
        NSLayoutConstraint.activate([
            tempatureView.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    override func configure() {
        dateLabel.text = presenter.dto.day
        titleLabel.text = presenter.dto.weather.descZip.capitalized
        lowLabel.text = presenter.dto.low
        highLabel.text = presenter.dto.high
        weatherImageView.kf.setImage(with: presenter.dto.weather.firstImage)
    }
}
