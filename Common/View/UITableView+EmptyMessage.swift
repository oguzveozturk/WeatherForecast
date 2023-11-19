//
//  UITableView+EmptyMessage.swift
//  Common
//
//  Created by Oğuz Öztürk on 18.11.2023.
//

import UIKit

public extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: .init(origin: .zero, size: bounds.size))
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        messageLabel.sizeToFit()

        backgroundView = messageLabel
        separatorStyle = .none
    }
    
    func restore() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}

