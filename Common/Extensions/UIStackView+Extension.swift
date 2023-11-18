//
//  UIStackView+Extension.swift
//  Common
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
