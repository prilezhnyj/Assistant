//
//  UIViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

extension UIViewController {
    
    func alertController(style: UIAlertController.Style, title: String?, message: String?, okayButton: String, okayButtonStyle: UIAlertAction.Style, cancelButton: String, okayCompletion: @escaping () -> Void, cancelCompletion: @escaping () -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let okayAction = UIAlertAction(title: okayButton, style: okayButtonStyle) { _ in
            okayCompletion()
        }
        let cancelAction = UIAlertAction(title: cancelButton, style: .cancel) { _ in
            cancelCompletion()
        }
        alert.addAction(okayAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
