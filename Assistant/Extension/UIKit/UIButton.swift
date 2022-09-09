//
//  UIButton.swift
//  Assistant
//
//  Created by Максим Боталов on 01.09.2022.
//

import UIKit

extension UIButton {
    convenience init(image: UIImage, colorImage: UIColor, backgroundColor: UIColor, isShadow: Bool) {
        self.init(type: .system)
        self.setImage(image, for: .normal)
        self.tintColor = colorImage
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if isShadow == true {
            self.layer.shadowColor = ColorSetup.white.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 10
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    convenience init(title: String, colorTitle: UIColor, backgroundColor: UIColor, isShadow: Bool) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.tintColor = colorTitle
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if isShadow == true {
            self.layer.shadowColor = ColorSetup.white.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 10
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
}
