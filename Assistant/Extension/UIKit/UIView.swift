//
//  UIView.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

extension UIView {
    convenience init(bgColor: UIColor) {
        self.init()
        self.backgroundColor = bgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
