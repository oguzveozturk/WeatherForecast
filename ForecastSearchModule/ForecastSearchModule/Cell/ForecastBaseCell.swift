//
//  ForecastBaseCell.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import Common

protocol ForecastSearchResultCellProtocol: AnyObject {
    associatedtype Presenter
    associatedtype Model
    var presenter: Presenter! { get set }
    func setupLayout()
    func configure(dto: Model)
}

private extension ForecastBaseCell {
    enum Constants {
        static var dateLabelMaxLineCount: Int { 2  }
        static var middleStackSpacing: CGFloat { 4 }
        static var labelStackSpacing: CGFloat { 8 }
        static var mainStackSpacing: CGFloat { 8 }
        static var mainStackPading: UIEdgeInsets { .init(16) }
        static var dateLabelWith: CGFloat { 55 }
        static var weatherImageWidth: CGFloat { 40 }
        static var seperatorTickness: CGFloat { 1 }
    }
}

class ForecastBaseCell<Presenter: ForecastSearchResultCellPresenterProtocol, Model>: UITableViewCell, ForecastSearchResultCellProtocol {
    var presenter: Presenter! {
        didSet {
            presenter.load()
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
        label.numberOfLines = Constants.dateLabelMaxLineCount
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
        stackView.spacing = Constants.middleStackSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    func setupLayout() {
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, middleStack])
        labelStack.axis = .vertical
        labelStack.distribution = .equalSpacing
        labelStack.spacing = Constants.labelStackSpacing
        let mainStack = UIStackView(arrangedSubviews: [dateLabel,
                                                       firstSeperator,
                                                       labelStack,
                                                       secondSeperator,
                                                       weatherImageView])
        mainStack.spacing = Constants.mainStackSpacing
        addSubview(mainStack)
        mainStack.equalToSuperView(padding: Constants.mainStackPading)
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalToConstant: Constants.dateLabelWith),
            weatherImageView.widthAnchor.constraint(equalToConstant: Constants.weatherImageWidth),
            firstSeperator.widthAnchor.constraint(equalToConstant: Constants.seperatorTickness),
            secondSeperator.widthAnchor.constraint(equalToConstant: Constants.seperatorTickness),
        ])
    }
    
    func configure(dto: Model) {}
}
