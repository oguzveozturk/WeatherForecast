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

final class DailyCell: UITableViewCell, ReusableView {
    private lazy var weatherImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline,
                                    compatibleWith: .init(legibilityWeight: .bold))
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var firstSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var secondSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 8
        let mainStack = UIStackView(arrangedSubviews: [dateLabel, firstSeperator,labelStack, secondSeperator, weatherImageView])
        mainStack.spacing = 8
        addSubview(mainStack)
        mainStack.equalToSuperView(padding: .init(16))
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: 60),
            weatherImageView.widthAnchor.constraint(equalToConstant: 40),
            firstSeperator.widthAnchor.constraint(equalToConstant: 1),
            secondSeperator.widthAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func configureWith(dto: DailyDTO) {
        dateLabel.text = dto.day
        titleLabel.text = dto.weather.descZip.capitalized
        descriptionLabel.text = dto.high + "~" + dto.low + " | " + dto.cloudsStr + " " + dto.popStr
        weatherImageView.kf.setImage(with: dto.weather.firstImage)
    }
}
