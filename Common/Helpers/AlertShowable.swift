//
//  AlertShowable.swift
//  Common
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit

public protocol AlertShowable: AnyObject {
    func showAlert(message: String)
}

public extension AlertShowable where Self: UIViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "Ok", style: .default))
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}
