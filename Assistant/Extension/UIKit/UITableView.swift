//
//  UITableView.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

extension UITableView {
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.rowHeight = 60
        self.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
