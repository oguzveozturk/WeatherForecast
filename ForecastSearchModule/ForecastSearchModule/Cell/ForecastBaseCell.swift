//
//  ForecastBaseCell.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import Common
import WeatherAPI
import Kingfisher

protocol ForecastSearchResultCellProtocol: AnyObject {
    associatedtype T
    var presenter: T! { get set }
    func setupLayout()
    func configure()
}

class ForecastBaseCell<T>: UITableViewCell, ForecastSearchResultCellProtocol {
    var presenter: T! {
        didSet {
            setupLayout()
            configure()
        }
    }
    
    lazy var weatherImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline,
                                    compatibleWith: .init(legibilityWeight: .bold))
        label.textAlignment = .center
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
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    lazy var middleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    func setupLayout() {
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, middleStack])
        labelStack.axis = .vertical
        labelStack.distribution = .equalSpacing
        labelStack.spacing = 8
        let mainStack = UIStackView(arrangedSubviews: [dateLabel,
                                                       firstSeperator,
                                                       labelStack,
                                                       secondSeperator,
                                                       weatherImageView])
        mainStack.spacing = 8
        addSubview(mainStack)
        mainStack.equalToSuperView(padding: .init(16))
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: 55),
            weatherImageView.widthAnchor.constraint(equalToConstant: 40),
            firstSeperator.widthAnchor.constraint(equalToConstant: 1),
            secondSeperator.widthAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    func configure() {}
}
