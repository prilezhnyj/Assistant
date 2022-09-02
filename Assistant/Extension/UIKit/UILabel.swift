//
//  UILabel.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor, font: UIFont) {
        self.init()
        self.text = text
        self.numberOfLines = 0
        self.textColor = textColor
        self.textAlignment = .left
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
