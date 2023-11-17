//
//  UIEdgeInsets+Extension.swift
//  Common
//
//  Created by Oğuz Öztürk on  17.11.2023.
//

import UIKit

public extension UIEdgeInsets {
    func with(newRight: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: newRight)
    }

    func with(newLeft: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: newLeft, bottom: bottom, right: right)
    }

    func with(newTop: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: newTop, left: left, bottom: bottom, right: right)
    }

    func with(newBottom: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: newBottom, right: right)
    }
    
    init(_ padding: CGFloat) {
        self.init(top: padding, left: padding, bottom: padding, right: padding)
    }
}
